EXEC tSQLt.NewTestClass 'test_VW_BRACKETS_KO'
GO
CREATE OR ALTER PROCEDURE test_VW_BRACKETS_KO.SetUp
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.MATCH'
	EXEC tSQLt.FakeTable 'dbo.COMPETITION'
	EXEC tSQLt.FakeTable 'dbo.GOALS_MATCHES'
	EXEC tSQLt.FakeTable 'dbo.ROUND'

	INSERT INTO [MATCH] (MATCH_ID, SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY) 
	VALUES (1, '20/21', 'compko', GETDATE(), GETDATE())

	INSERT INTO COMPETITION (COMPETITION_NAME, COMPETITION_TYPE)
	VALUES ('compko', 'Knockout')

	EXEC ('	INSERT INTO GOALS_MATCHES (MATCH_ID, HOME_CLUB_NAME, OUT_CLUB_NAME, HOME_GOALS, OUT_GOALS) 
			VALUES (1, ''henry'', ''yrneh'', 20, 5) ')

	INSERT INTO ROUND (SEASON_NAME, COMPETITION_NAME, START_DATE, ROUND_NR, ROUND_NAME)
	VALUES ('20/21', 'compko', GETDATE(), 1, 'finale')

	DROP TABLE IF EXISTS test_VW_BRACKETS_KO.expected

	CREATE TABLE test_VW_BRACKETS_KO.expected (
		MATCH_ID G_IDENTITY,
		ROUND_NR ROUND_NR,
		ROUND_NAME ROUND_NAME,
		HOME_CLUB_NAME CLUB_NAME,
		OUT_CLUB_NAME CLUB_NAME,
		HOME_GOALS INT,
		OUT_GOALS INT
	)
END
GO
CREATE OR ALTER PROCEDURE test_VW_BRACKETS_KO.[test 1 ko competition] AS
BEGIN
	INSERT INTO test_VW_BRACKETS_KO.expected
	VALUES (1, 1, 'finale', 'henry', 'yrneh', 20, 5)
	
	EXEC tSQLt.AssertEqualsTable 'test_VW_BRACKETS_KO.expected', 'VW_BRACKETS_KO'
END
GO
EXEC tSQLt.Run 'test_VW_BRACKETS_KO.[test 1 ko competition]'
GO
CREATE OR ALTER PROCEDURE test_VW_BRACKETS_KO.[test filters normal matches out] AS
BEGIN
	INSERT INTO [MATCH] (MATCH_ID, SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY) 
	VALUES (2, '20/21', 'normies', GETDATE(), GETDATE())

	INSERT INTO COMPETITION (COMPETITION_NAME, COMPETITION_TYPE)
	VALUES ('normies', 'Nationale Competitie')

	INSERT INTO test_VW_BRACKETS_KO.expected
	VALUES (1, 1, 'finale', 'henry', 'yrneh', 20, 5)
	
	EXEC tSQLt.AssertEqualsTable 'test_VW_BRACKETS_KO.expected', 'VW_BRACKETS_KO'
END
GO
EXEC tSQLt.Run 'test_VW_BRACKETS_KO.[test filters normal matches out]'