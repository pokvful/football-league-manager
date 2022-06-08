if not exists(select 1 from systypes where name='clubNamesTable')
   CREATE TYPE clubNamesTable AS TABLE(club_name CLUB_NAME PRIMARY KEY)
GO
IF NOT EXISTS (SELECT 1 FROM SYSTYPES WHERE NAME = 'clubPairsTable')
	CREATE TYPE clubPairsTable AS TABLE(home_club CLUB_NAME, out_club CLUB_NAME, rank int)
GO
CREATE OR ALTER PROCEDURE ADD_MATCHES_TO_MATCHDAY -- Only for internal use.
(@competitionname COMPETITION_NAME, @seasonname SEASON_NAME, @round DATE, @matchday DATE , @gamesPerMatchday INT, @rankedClubPairs clubPairsTable READONLY, @start INT = 0)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @savepoint VARCHAR(128) =	CAST(OBJECT_NAME(@@PROCID) AS VARCHAR(125)) + 
										CAST(@@NESTLEVEL AS VARCHAR(3))
	DECLARE @startTranCount INT = @@TRANCOUNT;
	IF @startTranCount > 0  
		SAVE TRANSACTION @savepoint
	ELSE
		BEGIN TRANSACTION

	BEGIN TRY

	DECLARE @maxMatches INT = @start + @gamesPerMatchday
	WHILE (@start < @maxMatches)
	BEGIN
		DECLARE @homeclub CLUB_NAME = (SELECT home_club FROM @rankedClubPairs WHERE [rank] = @start)
		DECLARE @outclub CLUB_NAME = (SELECT out_club FROM @rankedClubPairs WHERE [rank] = @start)

		IF @homeclub IS NULL
			BREAK;

		INSERT INTO MATCH (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY, HOME_CLUB_NAME, OUT_CLUB_NAME, STADIUM_NAME)
		VALUES
		(@seasonname, @competitionname, @round, @matchday, @homeclub, @outclub, (SELECT STADIUM_NAME FROM CLUB WHERE CLUB_NAME = @homeclub))

		SET @start = @start + 1
	END

	COMMIT TRAN
	end try
	BEGIN CATCH
			IF XACT_STATE() = -1 OR  @startTranCount = 0
			BEGIN 
				ROLLBACK TRANSACTION
			END
			ELSE
			BEGIN
				IF XACT_STATE() = 1
				BEGIN 
					ROLLBACK TRANSACTION @savepoint;
				END;
			END;
			THROW

	END CATCH
END
GO
-- From internet https://stackoverflow.com/questions/48099486/sql-server-round-robin-tournament/48101665#48101665 
CREATE OR ALTER PROCEDURE GENERATE_ROUND_ROBIN_TOURNAMENT_TABLE
(@listofclubs clubNamesTable READONLY)
AS
BEGIN
SET NOCOUNT ON
;WITH Teams
	 AS (SELECT club_name,
				TeamNum = ROW_NUMBER() OVER (ORDER BY club_name),
				TeamCount = COUNT(*) OVER()
		 FROM   @listofclubs
		 /*Purpose of below is to add an extra dummy team if odd number 
		   of teams. This null team name will be matched up against competitors 
		   having no game that week */
		 GROUP  BY club_name WITH ROLLUP
		 HAVING GROUPING(club_name) = 0
				 OR COUNT(*) %2 = 1),
	 Weeks
	 AS ( /*We need numbers 1- 11 for a 12 team league etc. 
		   Can use the row numbers calculated above for this*/
		 SELECT TeamNum AS Week
		 FROM   Teams
		 WHERE  TeamNum < TeamCount),
	 Positioned
	 AS (SELECT club_name,
				TeamNum,
				Week,
				position,
				TeamCount,
				/*Sum of opposing positions should add up to TeamCount + 1 so can calculate slot for grouping*/
				Slot = CASE WHEN position <= TeamCount / 2 THEN position ELSE TeamCount + 1 - position END
		 FROM   Teams
				CROSS JOIN Weeks
				/*Uses scheduling algorithm from Wikipedia with the last team in fixed position
				  and all other teams rotating around (between positions 1 and 11 in 12 team example)*/
				CROSS APPLY (SELECT CASE
									  WHEN TeamNum = TeamCount
										THEN TeamCount
									  ELSE 1 + ( ( TeamNum + Week ) % ( TeamCount - 1 ) )
									END) CA(position)),
	 Matches
	 AS (SELECT Week,
				Slot,
				TeamCount,
				TopTeam = MAX(CASE WHEN position = slot THEN club_name END),
				BottomTeam = MAX(CASE WHEN position <> slot THEN club_name END)
		 FROM   Positioned
		 GROUP  BY Week,
				   Slot,
				   TeamCount)
SELECT CA.HomeTeam, CA.AwayTeam, ROW_NUMBER() OVER (ORDER BY CA.WEEK) - 1
FROM   Matches
	   CROSS APPLY (
				   /*Choose Home and Away from alternating Top and Bottom of pair to 
					 avoid long runs of either for a team*/
				   /*First two rows are for alternate weeks in the 1st half of the season */
				   SELECT TopTeam, BottomTeam, Week
				   WHERE  Week %2 = 0
				   UNION ALL
				   SELECT BottomTeam, TopTeam, Week
				   WHERE  Week %2 > 0
				   UNION ALL
				   /*For second half of the season just reversing the "Home" and "Away" teams */
				   SELECT BottomTeam, TopTeam, Week + TeamCount - 1
				   WHERE  Week %2 = 0
				   UNION ALL
				   SELECT TopTeam, BottomTeam, Week + TeamCount - 1
				   WHERE  Week %2 > 0) CA(HomeTeam, AwayTeam, Week)
/*Exclude any dummy matches if odd number of teams*/
WHERE  CA.AwayTeam IS NOT NULL
	   AND CA.HomeTeam IS NOT NULL
ORDER  BY CA.Week; 
END

GO
CREATE OR ALTER PROCEDURE START_NEW_EDITION
(@competitionname COMPETITION_NAME , -- not null
@seasonname SEASON_NAME , -- not null
@listofclubs clubNamesTable READONLY, -- not null
@startDateCompetition DATE, -- not null 
@lengthRound INT = 7 , -- in days
@gamesPerMatchday INT = 3, 
@amountOfMatchdaysPerRound INT = 4)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @aantClubs INT = (SELECT COUNT(*) FROM @listofclubs)
	IF @aantClubs < 2
		THROW 500003, 'Not enough clubs to start an edition', 1
	IF @lengthRound < 0 
		THROW 500003, '@lengthRound can''t be negative', 1
	IF @amountOfMatchdaysPerRound > @lengthRound OR @amountOfMatchdaysPerRound < 0
		THROW 500003, '@amountOfMatchdaysPerRound is invalid', 1
	IF @gamesPerMatchday < 0
		THROW 500003, '@gamesPerMatchday can''t be negative', 1

	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
	VALUES (@seasonname, @competitionname)

	INSERT INTO CLUB_PLAYS_IN_EDITION (SEASON_NAME, COMPETITION_NAME, CLUB_NAME)
	SELECT @seasonname, @competitionname, club_name FROM @listofclubs

	-- Calculate amount of matches played
	DECLARE @aantPotjes INT = (@aantClubs * ( @aantClubs - 1))

	DECLARE @amountMatchdays INT = CEILING((@aantPotjes * 1.0) / (@gamesPerMatchday * 1.0))

	DECLARE @clubPairs as clubPairsTable

	INSERT INTO @clubPairs
	EXEC dbo.GENERATE_ROUND_ROBIN_TOURNAMENT_TABLE @listofclubs

	DECLARE @daysBetweenMatches FLOAT = @lengthRound * 1.0 / @amountOfMatchdaysPerRound * 1.0

	-- generate all rounds
	DECLARE @generatedRound INT = 0
	DECLARE @amountOfGeneratedMatchdays INT = 0


	WHILE (@amountOfGeneratedMatchdays < @amountMatchdays) -- Loop to generate rounds
		BEGIN
			DECLARE @startDateRound DATE = DATEADD(day, @generatedRound * (@lengthRound + 1), @startDateCompetition)

			PRINT 'generate round'

			INSERT INTO [ROUND] (SEASON_NAME, COMPETITION_NAME, START_DATE)
			VALUES (@seasonname, @competitionname, @startDateRound)

			DECLARE @amountOfGeneratedMatchdaysInRound INT = 0
			WHILE(@amountOfGeneratedMatchdaysInRound < @amountOfMatchdaysPerRound) -- Loops for matchdays in round
			BEGIN -- Strategy first match is on start round and the rest are spread evenly
				
				PRINT '@amountOfGeneratedMatchdays >= @amountMatchdays'
				PRINT @amountOfGeneratedMatchdays
				PRINT @amountMatchdays

				IF @amountOfGeneratedMatchdays >= @amountMatchdays
					BREAK;
				
				DECLARE @dateMatchday DATE
				
				SET @dateMatchday = DATEADD(day, @daysBetweenMatches * @amountOfGeneratedMatchdaysInRound, @startDateRound)
				
				INSERT INTO MATCHDAY (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
				VALUES (@seasonname, @competitionname, @startDateRound, @dateMatchday)


				EXEC dbo.ADD_MATCHES_TO_MATCHDAY @competitionname, @seasonname, @startDateRound, @dateMatchday, @gamesPerMatchday, @clubPairs


				SET @amountOfGeneratedMatchdaysInRound = @amountOfGeneratedMatchdaysInRound + 1
				SET @amountOfGeneratedMatchdays = @amountOfGeneratedMatchdays + 1

			END
			SET @generatedRound = @generatedRound + 1
		END

END
GO