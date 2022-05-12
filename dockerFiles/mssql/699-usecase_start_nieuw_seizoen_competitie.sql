CREATE TYPE clubNamesTable
AS TABLE(club_name CLUB_NAME PRIMARY KEY)
GO
CREATE OR ALTER PROCEDURE START_NEW_EDITION
(@competitionname COMPETITION_NAME ,
@seasonname SEASON_NAME not null, 
@listofclubs clubNamesTable not null READONLY,
@startdatumCompetitie DATE not null, 
@duurRondeInDagen INT = 7 ,
@aantPotjesPerMatchday INT = 3, 
@aantMatchdaysPerRonde INT = 4)
AS
BEGIN
	DECLARE @aantClubs INT = (SELECT COUNT(*) FROM @listofclubs)
	-- Op basis van een lijst van meespelende clubs wordt spelende clubs gevuld.
	IF @aantClubs < 2
		THROW 500003, 'Not enough clubs to start an edition', 1


	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
	VALUES (@seasonname, @competitionname)

	INSERT INTO CLUB_PLAYS_IN_EDITION (SEASON_NAME, COMPETITION_NAME, CLUB_NAME)
	SELECT @seasonname, @competitionname, club_name FROM @listofclubs

	-- Bereken hoeveel potjes worden gespeeld
	DECLARE @aantPotjes INT = (@aantClubs * ( @aantClubs - 1)) / 2

	DECLARE @aantMatchdays INT = CEILING((@aantPotjes * 1.0) / (@aantPotjesPerMatchday * 1.0))
	-- Genereer alle rondes
	DECLARE @geneerdeRonde INT = 0
	DECLARE @hoeveelGenereerdeMatchdays INT = 0
	WHILE (@hoeveelGenereerdeMatchdays < @aantMatchdays)
		BEGIN
			DECLARE @startDatumRonde DATE = DATEADD(day, @geneerdeRonde * @duurRondeInDagen, @startdatumCompetitie)
			INSERT INTO [ROUND] (SEASON_NAME, COMPETITION_NAME, START_DATE)
			VALUES (@seasonname, @competitionname, @startDatumRonde)


		END
	-- Genereer allemaal matches met matchdays
	-- matches met alle mogelijke clubs


END
