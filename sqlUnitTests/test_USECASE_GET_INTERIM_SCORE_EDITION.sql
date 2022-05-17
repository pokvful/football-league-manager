EXEC tSQLt.NewTestClass 'test_USECASE_OPHALEN_TUSSENSTAND_EDITIE'
GO
CREATE OR ALTER PROC test_USECASE_OPHALEN_TUSSENSTAND_EDITIE.SetUp
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.GOAL'
	EXEC tSQLt.FakeTable 'dbo.MATCH'
	--EXEC tSQLt.FakeTable ''
	EXEC tSQLt.FakeTable 'dbo.CLUB_PLAYS_IN_EDITION'
	EXEC tSQLt.FakeTable 'dbo.PLAYER'
END
GO
CREATE OR ALTER PROCEDURE test_USECASE_OPHALEN_TUSSENSTAND_EDITIE.[test tabel]
AS
BEGIN
	INSERT INTO CLUB_PLAYS_IN_EDITION (CLUB_NAME, SEASON_NAME, COMPETITION_NAME) VALUES
	('club1', '20/21', 'comp'),
	('club2', '20/21', 'comp'),
	('club3', '20/21', 'comp'),
	('club4', '20/21', 'comp')

	INSERT INTO MATCH (MATCH_ID, SEASON_NAME, COMPETITION_NAME, HOME_CLUB_NAME, OUT_CLUB_NAME, MATCH_DAY) VALUES
	(1, '20/21', 'comp', 'club2', 'club1', GETDATE()),
	(2, '20/21', 'comp', 'club3', 'club1', GETDATE()),
	(3, '20/21', 'comp', 'club4', 'club1', GETDATE()),
	(4, '20/21', 'comp', 'club1', 'club2', GETDATE()),
	(5, '20/21', 'comp', 'club3', 'club2', GETDATE()),
	(6, '20/21', 'comp', 'club4', 'club2', GETDATE()),
	(7, '20/21', 'comp', 'club1', 'club3', GETDATE()),
	(8, '20/21', 'comp', 'club2', 'club3', GETDATE()),
	(9, '20/21', 'comp', 'club4', 'club3', GETDATE()),
	(10,'20/21', 'comp', 'club1', 'club4', GETDATE()),
	(11,'20/21', 'comp', 'club2', 'club4', GETDATE()),
	(12,'20/21', 'comp', 'club3', 'club4', DATEADD(day, 1, GETDATE()))

	INSERT INTO GOAL (MATCH_ID, PERSON_ID) VALUES
	(1, 55),(1, 56),(1,55),(1,70),

	(9, 20), (9, 5)

	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME) VALUES
	(55, 'club2'), (56, 'club2'), (70, 'club1'), (20, 'club3'), (5, 'club4')
	
	--SELECT * FROM dbo.GOALS_MATCHES GROUP BY COMPETITION_NAME, SEASON_NAME
				--

	--SELECT * FROM dbo.GOALS_MATCHES
	
	--SELECT MATCH_ID, SEASON_NAME, COMPETITION_NAME, HOME_CLUB_NAME AS 'CLUB_NAME' FROM MATCH
	--UNION
	--SELECT MATCH_ID, SEASON_NAME, COMPETITION_NAME, OUT_CLUB_NAME AS 'CLUB_NAME' FROM MATCH

	--SELECT * FROM CLUB_PLAYS_IN_EDITION
	--SELECT c1.CLUB_NAME, c2.CLUB_NAME FROM CLUB_PLAYS_IN_EDITION c1, CLUB_PLAYS_IN_EDITION c2 WHERE c1.CLUB_NAME <> c2.CLUB_NAME
END
GO
EXEC tSQLt.Run 'test_USECASE_OPHALEN_TUSSENSTAND_EDITIE.[test tabel]'
-- punten
-- W 3
-- G 1
-- L 0