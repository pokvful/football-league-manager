EXEC tSQLt.NewTestClass 'test_START_NEW_EDITION'
GO
CREATE OR ALTER PROCEDURE test_START_NEW_EDITION.SetUp
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.EDITION'
	EXEC tSQLt.FakeTable 'dbo.CLUB_PLAYS_IN_EDITION'
	EXEC tSQLt.FakeTable 'dbo.ROUND'
	EXEC tSQLt.FakeTable 'dbo.MATCHDAY'
	EXEC tSQLt.FakeTable 'dbo.MATCH'

	DROP TABLE IF EXISTS test_START_NEW_EDITION.clubslist

	DECLARE @Table as dbo.clubNamesTable

	SELECT TOP 0 * INTO test_START_NEW_EDITION.clubslist FROM @Table

	INSERT INTO test_START_NEW_EDITION.clubslist (club_name) VALUES 
	('club1'),
	('club2'),
	('club3'),
	('club4'),
	('club5'),
	('club6'),
	('club7'),
	('club8'),
	('club9'),
	('club10')

	DROP TABLE IF EXISTS test_START_NEW_EDITION.verwacht
END
GO
CREATE OR ALTER PROCEDURE test_START_NEW_EDITION.[test correct EDITION made]
AS
BEGIN
	-- expected table
	SELECT TOP 0 *
	INTO test_START_NEW_EDITION.verwacht
	FROM EDITION

	INSERT INTO test_START_NEW_EDITION.verwacht (SEASON_NAME, COMPETITION_NAME)
	VALUES ('20/21', 'comp')
	-- Here fill @listofclubs
	DECLARE @Table AS dbo.clubNamesTable

	INSERT INTO @Table
	SELECT club_name 
	FROM test_START_NEW_EDITION.clubslist
	--
	EXEC tSQLt.ExpectNoException


	EXEC dbo.START_NEW_EDITION @competitionname = 'comp', @seasonname = '20/21', @listofclubs = @Table, @stardDateCompetition = '2000-05-05'


	EXEC tSQLt.AssertEqualsTable 'test_START_NEW_EDITION.verwacht', 'EDITION'
END
GO
EXEC tSQLt.Run 'test_START_NEW_EDITION.[test correct EDITION made]'
GO
CREATE OR ALTER PROCEDURE test_START_NEW_EDITION.[test met 9 clubs 6 rondes]
AS
BEGIN
	DECLARE @expectedAmount INT = 6

	DECLARE @Table AS dbo.clubNamesTable

	INSERT INTO @Table
	SELECT TOP (9) club_name 
	FROM test_START_NEW_EDITION.clubslist

	EXEC tSQLt.ExpectNoException

	EXEC dbo.START_NEW_EDITION @competitionname = 'comp', 
								@seasonname = '20/21', 
								@listofclubs = @Table, 
								@stardDateCompetition = '2000-05-05', 
								@gamesPerMatchday = 3, 
								@amountOfMatchdaysPerRound = 4

	DECLARE @amountOfRounds INT = (SELECT COUNT(*) FROM ROUND)
	
	EXEC tSQLt.AssertEquals @expectedAmount, @amountOfRounds
END
GO
EXEC tSQLt.Run 'test_START_NEW_EDITION.[test met 9 clubs 6 rondes]'
GO
CREATE OR ALTER PROCEDURE test_START_NEW_EDITION.[test met 10 clubs 8 rondes]
AS
BEGIN
	DECLARE @expectedAmount INT = 8

	DECLARE @Table AS dbo.clubNamesTable

	INSERT INTO @Table
	SELECT TOP (10) club_name 
	FROM test_START_NEW_EDITION.clubslist

	EXEC tSQLt.ExpectNoException

	EXEC dbo.START_NEW_EDITION @competitionname = 'comp', 
								@seasonname = '20/21', 
								@listofclubs = @Table, 
								@stardDateCompetition = '2000-05-05', 
								@gamesPerMatchday = 3, 
								@amountOfMatchdaysPerRound = 4

	DECLARE @amountOfRounds INT = (SELECT COUNT(*) FROM ROUND)
	
	EXEC tSQLt.AssertEquals @expectedAmount, @amountOfRounds
END
GO
EXEC tSQLt.Run 'test_START_NEW_EDITION.[test met 10 clubs 8 rondes]'

GO
CREATE OR ALTER PROCEDURE test_START_NEW_EDITION.[test met 10 clubs 30 matchdays]
AS
BEGIN
	DECLARE @expectedAmount INT = 30

	DECLARE @Table AS dbo.clubNamesTable

	INSERT INTO @Table
	SELECT TOP (10) club_name 
	FROM test_START_NEW_EDITION.clubslist

	EXEC tSQLt.ExpectNoException

	EXEC dbo.START_NEW_EDITION @competitionname = 'comp', 
								@seasonname = '20/21', 
								@listofclubs = @Table, 
								@stardDateCompetition = '2000-05-05', 
								@gamesPerMatchday = 3, 
								@amountOfMatchdaysPerRound = 4

	DECLARE @amountOfMatchdays INT = (SELECT COUNT(*) FROM MATCHDAY)
	
	EXEC tSQLt.AssertEquals @expectedAmount, @amountOfMatchdays
END
GO
EXEC tSQLt.Run 'test_START_NEW_EDITION.[test met 10 clubs 30 matchdays]'
GO
CREATE OR ALTER PROCEDURE test_START_NEW_EDITION.[test met 10 clubs 90 matches]
AS
BEGIN
	DECLARE @expectedAmount INT = 90

	DECLARE @Table AS dbo.clubNamesTable

	INSERT INTO @Table
	SELECT TOP (10) club_name 
	FROM test_START_NEW_EDITION.clubslist

	EXEC tSQLt.ExpectNoException

	EXEC dbo.START_NEW_EDITION @competitionname = 'comp', 
								@seasonname = '20/21', 
								@listofclubs = @Table, 
								@stardDateCompetition = '2000-05-05', 
								@gamesPerMatchday = 3, 
								@amountOfMatchdaysPerRound = 4

	DECLARE @amountOfMatches INT = (SELECT COUNT(*) FROM MATCH)
	
	EXEC tSQLt.AssertEquals @expectedAmount, @amountOfMatches
END
GO
EXEC tSQLt.Run 'test_START_NEW_EDITION.[test met 10 clubs 90 matches]'
GO
CREATE OR ALTER PROCEDURE test_START_NEW_EDITION.[test startdatum null error]
AS
BEGIN
	DECLARE @Table AS dbo.clubNamesTable

	INSERT INTO @Table
	SELECT TOP (10) club_name 
	FROM test_START_NEW_EDITION.clubslist

	EXEC tSQLt.ExpectException '@startdatumCompetitie cannot be null'

	EXEC dbo.START_NEW_EDITION @competitionname = 'comp', 
								@seasonname = '20/21', 
								@listofclubs = @Table, 
								@stardDateCompetition = null, 
								@gamesPerMatchday = 3, 
								@amountOfMatchdaysPerRound = 4
END
GO
EXEC tSQLt.Run 'test_START_NEW_EDITION.[test startdatum null error]'
GO
CREATE OR ALTER PROCEDURE test_START_NEW_EDITION.[test te weinig clubs]
AS
BEGIN
	DECLARE @Table AS dbo.clubNamesTable

	INSERT INTO @Table
	SELECT TOP (0) club_name 
	FROM test_START_NEW_EDITION.clubslist 

	EXEC tSQLt.ExpectException 'Not enough clubs to start an edition'

	EXEC dbo.START_NEW_EDITION @competitionname = 'comp', 
								@seasonname = '20/21', 
								@listofclubs = @Table, 
								@stardDateCompetition = '2000-05-05', 
								@gamesPerMatchday = 3, 
								@amountOfMatchdaysPerRound = 4
END
GO
EXEC tSQLt.Run 'test_START_NEW_EDITION.[test te weinig clubs]'
GO
