EXEC tSQLt.NewTestClass 'test_GET_SCORE_EDITION'
GO
CREATE OR ALTER PROC test_GET_SCORE_EDITION.SetUp
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.GOAL'
	EXEC tSQLt.FakeTable 'dbo.MATCH'
	EXEC tSQLt.FakeTable 'dbo.PLAYER'
	EXEC tSQLt.FakeTable 'dbo.COMPETITION'

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

	INSERT INTO COMPETITION (COMPETITION_NAME, COMPETITION_TYPE)
	VALUES ('comp', 'Nationale competitie'), ('comp2', 'Nationale competitie') ,('knockcomp', 'Knockout')

	DROP TABLE IF EXISTS test_GET_SCORE_EDITION.expected 

	CREATE TABLE test_GET_SCORE_EDITION.expected(
	RANK INT,
	COMPETITION_NAME COMPETITION_NAME,
	SEASON_NAME SEASON_NAME,
	CLUB_NAME CLUB_NAME,
	GS INT,
	W INT,
	G INT,
	L INT,
	DV INT,
	DT INT,
	DS INT,
	[Pt.] INT
	)

END
GO
CREATE OR ALTER PROCEDURE test_GET_SCORE_EDITION.[test view 1 edition]
AS
BEGIN
	INSERT INTO test_GET_SCORE_EDITION.expected VALUES
	(1, 'comp', '20/21', 'club2', 6, 1, 5, 0, 3, 1, 2, 8),
	(2, 'comp', '20/21', 'club3', 5, 0, 5, 0, 1, 1, 0, 5),
	(2, 'comp', '20/21', 'club4', 5, 0, 5, 0, 1, 1, 0, 5),
	(4, 'comp', '20/21', 'club1', 6, 0, 5, 1, 1, 3, -2,5)
	

	EXEC tSQLt.AssertEqualsTable 'test_GET_SCORE_EDITION.expected', 'SCORE_EDITIONS'
END
GO
EXEC tSQLt.Run 'test_GET_SCORE_EDITION.[test view 1 edition]'
GO
CREATE OR ALTER PROCEDURE test_GET_SCORE_EDITION.[test no data thus empty view]
AS
BEGIN
	DELETE FROM GOAL
	DELETE FROM MATCH
	DELETE FROM PLAYER

	EXEC tSQLt.AssertEmptyTable 'SCORE_EDITIONS'
END
GO
EXEC tSQLt.Run 'test_GET_SCORE_EDITION.[test no data thus empty view]'
GO
CREATE OR ALTER PROCEDURE test_GET_SCORE_EDITION.[test 2 competitions]
AS
BEGIN
	INSERT INTO MATCH (MATCH_ID, SEASON_NAME, COMPETITION_NAME, HOME_CLUB_NAME, OUT_CLUB_NAME, MATCH_DAY) VALUES
	(6000, '20/21', 'comp2', 'aa', 'bb', GETDATE()),
	(6001, '20/21', 'comp2', 'aa', 'cc', GETDATE()),
	(6002, '20/21', 'comp2', 'bb', 'aa', GETDATE()),
	(6003, '20/21', 'comp2', 'bb', 'cc', GETDATE()),
	(6004, '20/21', 'comp2', 'cc', 'bb', GETDATE()),
	(6005, '20/21', 'comp2', 'cc', 'aa', GETDATE())

	INSERT INTO GOAL (MATCH_ID, PERSON_ID) VALUES
	(6000, 1000),
	(6001, 1001),
	(6004, 2000), (6004, 2000),
	(6005, 2000)
	
	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME) VALUES
	(1000, 'aa'), (1001, 'aa'),
	(2000, 'cc')

	INSERT INTO test_GET_SCORE_EDITION.expected (RANK,COMPETITION_NAME,SEASON_NAME,CLUB_NAME,GS,W,G,L,DV,DT,DS,[Pt.]) VALUES
	(1, 'comp', '20/21', 'club2', 6, 1, 5, 0, 3, 1, 2, 8),
	(2, 'comp', '20/21', 'club3', 5, 0, 5, 0, 1, 1, 0, 5),
	(2, 'comp', '20/21', 'club4', 5, 0, 5, 0, 1, 1, 0, 5),
	(4, 'comp', '20/21', 'club1', 6, 0, 5, 1, 1, 3, -2,5),
	(1, 'comp2','20/21', 'cc'	, 4, 2, 1, 1, 3, 1, 2, 7),
	(2, 'comp2','20/21', 'aa'	, 4, 2, 1, 1, 2, 1, 1, 7),
	(3, 'comp2','20/21', 'bb'	, 4, 0, 2, 2, 0, 3, -3, 2)

	EXEC tSQLt.AssertEqualsTable 'test_GET_SCORE_EDITION.expected', 'SCORE_EDITIONS'
END
GO
EXEC tSQLt.Run 'test_GET_SCORE_EDITION.[test 2 competitions]'
GO
CREATE OR ALTER PROC test_GET_SCORE_EDITION.[test procedure]
AS
BEGIN
	INSERT INTO MATCH (MATCH_ID, SEASON_NAME, COMPETITION_NAME, HOME_CLUB_NAME, OUT_CLUB_NAME, MATCH_DAY) VALUES
	(6000, '20/21', 'comp2', 'aa', 'bb', GETDATE()),
	(6001, '20/21', 'comp2', 'aa', 'cc', GETDATE()),
	(6002, '20/21', 'comp2', 'bb', 'aa', GETDATE()),
	(6003, '20/21', 'comp2', 'bb', 'cc', GETDATE()),
	(6004, '20/21', 'comp2', 'cc', 'bb', GETDATE()),
	(6005, '20/21', 'comp2', 'cc', 'aa', GETDATE())

	INSERT INTO GOAL (MATCH_ID, PERSON_ID) VALUES
	(6000, 1000),
	(6001, 1001),
	(6004, 2000), (6004, 2000),
	(6005, 2000)
	
	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME) VALUES
	(1000, 'aa'), (1001, 'aa'),
	(2000, 'cc')

	INSERT INTO test_GET_SCORE_EDITION.expected (RANK,COMPETITION_NAME,SEASON_NAME,CLUB_NAME,GS,W,G,L,DV,DT,DS,[Pt.]) VALUES
	(1, 'comp2','20/21', 'cc'	, 4, 2, 1, 1, 3, 1, 2, 7),
	(2, 'comp2','20/21', 'aa'	, 4, 2, 1, 1, 2, 1, 1, 7),
	(3, 'comp2','20/21', 'bb'	, 4, 0, 2, 2, 0, 3, -3, 2)

	DROP TABLE IF EXISTS test_GET_SCORE_EDITION.valueFromProcedure

	CREATE TABLE test_GET_SCORE_EDITION.valueFromProcedure(
	RANK INT,
	COMPETITION_NAME COMPETITION_NAME,
	SEASON_NAME SEASON_NAME,
	CLUB_NAME CLUB_NAME,
	GS INT,
	W INT,
	G INT,
	L INT,
	DV INT,
	DT INT,
	DS INT,
	[Pt.] INT
	)

	INSERT INTO test_GET_SCORE_EDITION.valueFromProcedure
	EXEC dbo.GET_SCORE_EDITION '20/21', 'comp2'

	EXEC tSQLt.AssertEqualsTable 'test_GET_SCORE_EDITION.expected', 'test_GET_SCORE_EDITION.valueFromProcedure'

END
GO
EXEC tSQLt.Run 'test_GET_SCORE_EDITION.[test procedure]'
GO
CREATE OR ALTER PROCEDURE test_GET_SCORE_EDITION.[test 3 competitions one KO which shouldn't show]
AS
BEGIN
	INSERT INTO MATCH (MATCH_ID, SEASON_NAME, COMPETITION_NAME, HOME_CLUB_NAME, OUT_CLUB_NAME, MATCH_DAY) VALUES
	(6000, '20/21', 'comp2', 'aa', 'bb', GETDATE()),
	(6001, '20/21', 'comp2', 'aa', 'cc', GETDATE()),
	(6002, '20/21', 'comp2', 'bb', 'aa', GETDATE()),
	(6003, '20/21', 'comp2', 'bb', 'cc', GETDATE()),
	(6004, '20/21', 'comp2', 'cc', 'bb', GETDATE()),
	(6005, '20/21', 'comp2', 'cc', 'aa', GETDATE())

	INSERT INTO MATCH (MATCH_ID, SEASON_NAME, COMPETITION_NAME, HOME_CLUB_NAME, OUT_CLUB_NAME, MATCH_DAY) VALUES
	(7000, '20/21', 'knockcomp', 'aa', 'bb', GETDATE()),
	(7001, '20/21', 'knockcomp', 'bb', 'aa', GETDATE())

	INSERT INTO GOAL (MATCH_ID, PERSON_ID) VALUES
	(6000, 1000),
	(6001, 1001),
	(6004, 2000), (6004, 2000),
	(6005, 2000)

	INSERT INTO GOAL (MATCH_ID, PERSON_ID) VALUES
	(7000, 1000), (7001, 1001)
	
	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME) VALUES
	(1000, 'aa'), (1001, 'aa'),
	(2000, 'cc')

	INSERT INTO test_GET_SCORE_EDITION.expected (RANK,COMPETITION_NAME,SEASON_NAME,CLUB_NAME,GS,W,G,L,DV,DT,DS,[Pt.]) VALUES
	(1, 'comp', '20/21', 'club2', 6, 1, 5, 0, 3, 1, 2, 8),
	(2, 'comp', '20/21', 'club3', 5, 0, 5, 0, 1, 1, 0, 5),
	(2, 'comp', '20/21', 'club4', 5, 0, 5, 0, 1, 1, 0, 5),
	(4, 'comp', '20/21', 'club1', 6, 0, 5, 1, 1, 3, -2,5),
	(1, 'comp2','20/21', 'cc'	, 4, 2, 1, 1, 3, 1, 2, 7),
	(2, 'comp2','20/21', 'aa'	, 4, 2, 1, 1, 2, 1, 1, 7),
	(3, 'comp2','20/21', 'bb'	, 4, 0, 2, 2, 0, 3, -3, 2)

	EXEC tSQLt.AssertEqualsTable 'test_GET_SCORE_EDITION.expected', 'SCORE_EDITIONS'
END
GO
EXEC tSQLt.Run 'test_GET_SCORE_EDITION.[test 3 competitions one KO which shouldn''t show]'