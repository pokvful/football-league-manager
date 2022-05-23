EXEC tSQLt.NewTestClass 'test_VIEW_MATCHDAY_INFORMATION'
GO

CREATE OR ALTER PROC test_VIEW_MATCHDAY_INFORMATION.SetUp
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.GOAL'
	EXEC tSQLt.FakeTable 'dbo.MATCH'
	EXEC tSQLt.FakeTable 'dbo.PLAYER'


	INSERT INTO MATCH (MATCH_ID, SEASON_NAME, COMPETITION_NAME, HOME_CLUB_NAME, OUT_CLUB_NAME, MATCH_DAY) VALUES
	(1, '20/21', 'comp', 'club2', 'club1', GETDATE()),
	(2, '20/21', 'comp', 'club3', 'club1', GETDATE()),
	(3, '20/21', 'comp', 'club4', 'club1', GETDATE()),
	(4, '20/21', 'comp', 'club1', 'club2', GETDATE()),
	(5, '20/21', 'comp', 'club3', 'club2', GETDATE()),
	(6, '20/21', 'comp', 'club4', 'club2', GETDATE()),
	(7, '20/21', 'comp', 'club1', 'club3', GETDATE()),
	(8, '20/21', 'comp', 'club2', 'club3', GETDATE()),
	(9, '20/21', 'comp', 'club4', 'club3', GETDATE())

	INSERT INTO GOAL (MATCH_ID, PERSON_ID) VALUES
	(1, 55),(1, 56),(1,55),(1,70),

	(9, 20), (9, 5)

	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME) VALUES
	(55, 'club2'), (56, 'club2'), (70, 'club1'), (20, 'club3'), (5, 'club4')

	DROP TABLE IF EXISTS test_VIEW_MATCHDAY_INFORMATION.expected 


	CREATE TABLE test_VIEW_MATCHDAY_INFORMATION.expected (
			MATCH_ID G_IDENTITY NOT NULL,
			COMPETITION_NAME COMPETITION_NAME NOT NULL,
			SEASON_NAME SEASON_NAME,
			CLUB_NAME CLUB_NAME,
	)
END
GO
