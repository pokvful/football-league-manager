if not exists(select 1 from systypes where name='clubNamesTable')
   CREATE TYPE clubNamesTable AS TABLE(club_name CLUB_NAME PRIMARY KEY)
GO
IF NOT EXISTS (SELECT 1 FROM SYSTYPES WHERE NAME = 'clubPairsTable')
	CREATE TYPE clubPairsTable AS TABLE(home_club CLUB_NAME, out_club CLUB_NAME, rank int)
GO
CREATE OR ALTER PROCEDURE ADD_MATCHES_TO_MATCHDAY -- Only for internal use.
(@competitionname COMPETITION_NAME, @seasonname SEASON_NAME, @round DATE, @matchday DATE , @gamesPerMatchday INT, @rankedClubPairs clubPairsTable READONLY, @start INT = 1)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @savepoint varchar(128) =	CAST(OBJECT_NAME(@@PROCID) as varchar(125)) + 
										CAST(@@NESTLEVEL AS varchar(3))
	declare @startTranCount int = @@trancount;
	begin try
		begin transaction
		save transaction @savepoint

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
	begin catch
		if XACT_STATE() = -1 and @startTranCount = 0
		begin 
			rollback transaction
		end
		else
		begin
			if XACT_STATE() = 1
			begin 
				rollback transaction @savepoint;
				commit transaction;
			end;
		end;
	end catch;
END
GO
-- From internet https://stackoverflow.com/questions/48099486/sql-server-round-robin-tournament/48101665#48101665 
CREATE OR ALTER PROCEDURE GENERATE_ROUND_ROBIN_TOURNAMENT_TABLE
(@listofclubs clubNamesTable READONLY)
AS
BEGIN
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
@stardDateCompetition DATE, -- not null 
@lengthRound INT = 7 ,
@gamesPerMatchday INT = 3, 
@amountOfMatchdaysPerRound INT = 4)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @aantClubs INT = (SELECT COUNT(*) FROM @listofclubs)
	-- Op basis van een lijst van meespelende clubs wordt spelende clubs gevuld.
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

	-- Bereken hoeveel potjes worden gespeeld
	DECLARE @aantPotjes INT = (@aantClubs * ( @aantClubs - 1))

	DECLARE @aantMatchdays INT = CEILING((@aantPotjes * 1.0) / (@gamesPerMatchday * 1.0))

	DECLARE @clubPairs as clubPairsTable

	INSERT INTO @clubPairs
	EXEC dbo.GENERATE_ROUND_ROBIN_TOURNAMENT_TABLE @listofclubs

	-- Genereer alle rondes
	DECLARE @generatedRound INT = 0
	DECLARE @amountOfGeneratedMatchdays INT = 0
	DECLARE @generatedMatches INT = 0

	WHILE (@amountOfGeneratedMatchdays < @aantMatchdays) -- Loop to generate rounds
		BEGIN
			DECLARE @startDatumRonde DATE = DATEADD(day, @generatedRound * (@lengthRound + 1), @stardDateCompetition)

			INSERT INTO [ROUND] (SEASON_NAME, COMPETITION_NAME, START_DATE)
			VALUES (@seasonname, @competitionname, @startDatumRonde)

			DECLARE @amountOfGeneratedMatchdaysInRound INT = 0
			WHILE(@amountOfGeneratedMatchdaysInRound < @amountOfMatchdaysPerRound) -- Loops for matchdays in round
			BEGIN -- Strategy first match is on start round and the rest are spread evenly
				
				IF @amountOfGeneratedMatchdays >= @aantMatchdays
					BREAK;
				
				DECLARE @datumMatchDay DATE
				IF (@amountOfGeneratedMatchdaysInRound = 0)
				BEGIN
					SET @datumMatchDay = @startDatumRonde
				END
				ELSE
				BEGIN
					DECLARE @daysBetweenMatches FLOAT = @lengthRound * 1.0 / @amountOfMatchdaysPerRound * 1.0

					SET @datumMatchDay = DATEADD(day, @daysBetweenMatches * @amountOfGeneratedMatchdaysInRound, @startDatumRonde)
				END
				INSERT INTO MATCHDAY (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
				VALUES (@seasonname, @competitionname, @startDatumRonde, @datumMatchDay)


				EXEC dbo.ADD_MATCHES_TO_MATCHDAY @competitionname, @seasonname, @startDatumRonde, @datumMatchDay, @gamesPerMatchday, @clubPairs , @generatedMatches


				SET @amountOfGeneratedMatchdaysInRound = @amountOfGeneratedMatchdaysInRound + 1
				SET @amountOfGeneratedMatchdays = @amountOfGeneratedMatchdays + 1

			END
			SET @generatedRound = @generatedRound + 1
		END

END
GO