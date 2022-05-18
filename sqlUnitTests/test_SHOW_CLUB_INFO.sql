EXEC tSQLt.NewTestClass 'test_SHOW_CLUB_INFO'
GO
CREATE OR ALTER PROCEDURE test_SHOW_CLUB_INFO.SetUp
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.PLAYER'
	EXEC tSQLt.FakeTable 'dbo.MATCH'
	EXEC tSQLt.FakeTable 'dbo.PLAYER_AS_RESERVE_IN_MATCH'
	EXEC tSQLt.FakeTable 'dbo.POSITION'
	EXEC tSQLt.FakeTable 'dbo.PERSON'

	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME) VALUES
	(1, 'club1'), (2, 'club2'), (3, 'club1'), (4, 'club2'), (5, 'club3'), (6, 'club4'), (7, 'club3')

	INSERT INTO MATCH (MATCH_ID, SEASON_NAME, COMPETITION_NAME, HOME_CLUB_NAME, OUT_CLUB_NAME) VALUES
	(1, '20/21', 'comp1', 'club1', 'club2'),
	(2, '20/21', 'comp1', 'club2', 'club1'),
	(3, '22/23', 'comp2', 'club3', 'club4')

	INSERT INTO PLAYER_AS_RESERVE_IN_MATCH (PLAYER_PERSON_ID, MATCH_ID) VALUES
	(1, 1), 
	(4, 2),
	(5, 3)

	INSERT INTO POSITION (PLAYER_PERSON_ID, MATCH_ID) VALUES
	(2, 1), (3, 1), 
	(2, 2), (3, 2),
	(6, 3), (7, 3)

	INSERT INTO PERSON (PERSON_ID, FIRST_NAME, MIDDLE_NAME, LAST_NAME, BIRTH_DATE) VALUES
	(1, 'first', 'middle', 'last', '2222-02-02'),
	(2, 'first', NULL , 'last', '2222-02-02'),
	(3, 'first', 'middle', 'last', '2222-02-02'),
	(4, 'first', 'middle', 'last', '2222-02-02'),
	(5, 'first', 'middle', 'last', '2222-02-02'),
	(6, 'first', 'middle', 'last', '2222-02-02'),
	(7, 'first', 'middle', 'last', '2222-02-02')

	DROP TABLE IF EXISTS test_SHOW_CLUB_INFO.expected

	CREATE TABLE test_SHOW_CLUB_INFO.expected(
		PERSON_ID G_IDENTITY NOT NULL,
		FIRST_NAME NAME NOT NULL,
		MIDDLE_NAME NAME NULL,
		LAST_NAME NAME NOT NULL,
		BIRTH_DATE _DATE_ NOT NULL
	)

	DROP TABLE IF EXISTS test_SHOW_CLUB_INFO.actual

	CREATE TABLE test_SHOW_CLUB_INFO.actual(
		PERSON_ID G_IDENTITY NOT NULL,
		FIRST_NAME NAME NOT NULL,
		MIDDLE_NAME NAME NULL,
		LAST_NAME NAME NOT NULL,
		BIRTH_DATE _DATE_ NOT NULL
	)
END
GO
CREATE OR ALTER PROC test_SHOW_CLUB_INFO.[test GET_SELECTION_CLUB_OF_EDITION club2 comp1 20/21]
AS
BEGIN
	INSERT INTO test_SHOW_CLUB_INFO.expected VALUES
	(2, 'first', NULL , 'last', '2222-02-02'),
	(4, 'first', 'middle', 'last', '2222-02-02')

	INSERT INTO test_SHOW_CLUB_INFO.actual
	EXEC GET_SELECTION_CLUB_OF_EDITION 'club2', 'comp1', '20/21'

	EXEC tSQLt.AssertEqualsTable 'test_SHOW_CLUB_INFO.expected', 'test_SHOW_CLUB_INFO.actual'
END
GO
EXEC tSQLt.Run 'test_SHOW_CLUB_INFO.[test GET_SELECTION_CLUB_OF_EDITION club2 comp1 20/21]'
GO
CREATE OR ALTER PROCEDURE test_SHOW_CLUB_INFO.[test nonexistent club]
AS
BEGIN
	INSERT INTO test_SHOW_CLUB_INFO.actual
	EXEC GET_SELECTION_CLUB_OF_EDITION 'a', 'comp1', '20/21'

	EXEC tSQLt.AssertEmptyTable 'test_SHOW_CLUB_INFO.actual'
END
GO
EXEC tSQLt.Run 'test_SHOW_CLUB_INFO.[test nonexistent club]'
