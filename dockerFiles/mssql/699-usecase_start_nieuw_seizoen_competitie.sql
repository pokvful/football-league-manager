if not exists(select 1 from systypes where name='clubNamesTable')
   CREATE TYPE clubNamesTable AS TABLE(club_name CLUB_NAME PRIMARY KEY)
GO
IF NOT EXISTS (SELECT 1 FROM SYSTYPES WHERE NAME = 'clubPairsTable')
	CREATE TYPE clubPairsTable AS TABLE(home_club CLUB_NAME, out_club CLUB_NAME, rank int)
GO
CREATE OR ALTER PROCEDURE ADD_MATCHES_TO_MATCHDAY -- Alleen voor intern gebruik.
(@competitionname COMPETITION_NAME, @seasonname SEASON_NAME, @round DATE, @matchday DATE , @aantPotjesPerMatchday INT, @rankedClubPairs clubPairsTable READONLY, @start INT = 1)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @savepoint varchar(128) =	CAST(OBJECT_NAME(@@PROCID) as varchar(125)) + 
										CAST(@@NESTLEVEL AS varchar(3))
	declare @startTranCount int = @@trancount;
	begin try
		begin transaction
		save transaction @savepoint

	DECLARE @maxMatches INT = @start + @aantPotjesPerMatchday
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
CREATE OR ALTER PROCEDURE START_NEW_EDITION
(@competitionname COMPETITION_NAME , -- not null
@seasonname SEASON_NAME , -- not null
@listofclubs clubNamesTable READONLY, -- not null
@startdatumCompetitie DATE, -- not null 
@duurRondeInDagen INT = 7 ,
@aantPotjesPerMatchday INT = 3, 
@aantMatchdaysPerRonde INT = 4)
AS
BEGIN
	-- Check not nulls
	IF @startdatumCompetitie IS NULL
		THROW 500003, '@startdatumCompetitie cannot be null', 1


	DECLARE @aantClubs INT = (SELECT COUNT(*) FROM @listofclubs)
	-- Op basis van een lijst van meespelende clubs wordt spelende clubs gevuld.
	IF @aantClubs < 2
		THROW 500003, 'Not enough clubs to start an edition', 1
	IF @duurRondeInDagen < 0 
		THROW 500003, '@duurRondeInDagen can''t be negative', 1
	IF @aantMatchdaysPerRonde > @duurRondeInDagen OR @aantMatchdaysPerRonde < 0
		THROW 500003, '@aantMatchDaysPerRonde is invalid', 1
	IF @aantPotjesPerMatchday < 0
		THROW 500003, '@aantPotjesPerMatchday can''t be negative', 1

	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
	VALUES (@seasonname, @competitionname)

	INSERT INTO CLUB_PLAYS_IN_EDITION (SEASON_NAME, COMPETITION_NAME, CLUB_NAME)
	SELECT @seasonname, @competitionname, club_name FROM @listofclubs

	-- Bereken hoeveel potjes worden gespeeld
	DECLARE @aantPotjes INT = (@aantClubs * ( @aantClubs - 1))

	DECLARE @aantMatchdays INT = CEILING((@aantPotjes * 1.0) / (@aantPotjesPerMatchday * 1.0))


	DECLARE @clubPairs as clubPairsTable

	;WITH randomnumbs (h_club, o_club, randomNum) as (
	SELECT c1.club_name, c2.club_name, CAST(CRYPT_GEN_RANDOM(1) AS INT) FROM @listofclubs c1, @listofclubs c2
	WHERE c1.club_name <> c2.club_name
	)
	INSERT INTO @clubPairs
	SELECT h_club, o_club, ROW_NUMBER() OVER (ORDER BY randomNum) - 1 FROM randomnumbs

	-- Genereer alle rondes
	DECLARE @geneerdeRonde INT = 0
	DECLARE @hoeveelGenereerdeMatchdays INT = 0
	DECLARE @genereerdeMatches INT = 0
	WHILE (@hoeveelGenereerdeMatchdays < @aantMatchdays) -- Loop to generate rounds
		BEGIN
			DECLARE @startDatumRonde DATE = DATEADD(day, @geneerdeRonde * (@duurRondeInDagen + 1), @startdatumCompetitie)

			INSERT INTO [ROUND] (SEASON_NAME, COMPETITION_NAME, START_DATE)
			VALUES (@seasonname, @competitionname, @startDatumRonde)

			DECLARE @aantGeneerdeMatchdaysInRonde INT = 0
			WHILE(@aantGeneerdeMatchdaysInRonde < @aantMatchdaysPerRonde) -- Loops for matchdays in round
			BEGIN -- Strategy first match is on start round and the rest are spread evenly
				
				IF @hoeveelGenereerdeMatchdays >= @aantMatchdays
					BREAK;
				
				DECLARE @datumMatchDay DATE
				IF (@aantGeneerdeMatchdaysInRonde = 0)
				BEGIN
					SET @datumMatchDay = @startDatumRonde
				END
				ELSE
				BEGIN
					DECLARE @daysBetweenMatches FLOAT = @duurRondeInDagen * 1.0 / @aantMatchdaysPerRonde * 1.0

					SET @datumMatchDay = DATEADD(day, @daysBetweenMatches * @aantGeneerdeMatchdaysInRonde, @startDatumRonde)
				END
				INSERT INTO MATCHDAY (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
				VALUES (@seasonname, @competitionname, @startDatumRonde, @datumMatchDay)


				-- MATCHES
				EXEC dbo.ADD_MATCHES_TO_MATCHDAY @competitionname, @seasonname, @startDatumRonde, @datumMatchDay, @aantPotjesPerMatchday, @clubPairs , @genereerdeMatches


				SET @aantGeneerdeMatchdaysInRonde = @aantGeneerdeMatchdaysInRonde + 1
				SET @hoeveelGenereerdeMatchdays = @hoeveelGenereerdeMatchdays + 1

			END
			SET @geneerdeRonde = @geneerdeRonde + 1
		END

END
GO