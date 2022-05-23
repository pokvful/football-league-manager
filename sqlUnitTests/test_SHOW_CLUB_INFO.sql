EXEC tSQLt.NewTestClass 'test_SHOW_SELECTION_CLUB_EDITION'
GO
CREATE OR ALTER PROCEDURE test_SHOW_SELECTION_CLUB_EDITION.SetUp
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

	DROP TABLE IF EXISTS test_SHOW_SELECTION_CLUB_EDITION.expected

	CREATE TABLE test_SHOW_SELECTION_CLUB_EDITION.expected(
		PERSON_ID G_IDENTITY NOT NULL,
		FIRST_NAME NAME NOT NULL,
		MIDDLE_NAME NAME NULL,
		LAST_NAME NAME NOT NULL,
		BIRTH_DATE _DATE_ NOT NULL
	)

	DROP TABLE IF EXISTS test_SHOW_SELECTION_CLUB_EDITION.actual

	CREATE TABLE test_SHOW_SELECTION_CLUB_EDITION.actual(
		PERSON_ID G_IDENTITY NOT NULL,
		FIRST_NAME NAME NOT NULL,
		MIDDLE_NAME NAME NULL,
		LAST_NAME NAME NOT NULL,
		BIRTH_DATE _DATE_ NOT NULL
	)
END
GO
CREATE OR ALTER PROC test_SHOW_SELECTION_CLUB_EDITION.[test GET_SELECTION_CLUB_OF_EDITION club2 comp1 20/21]
AS
BEGIN
	INSERT INTO test_SHOW_SELECTION_CLUB_EDITION.expected VALUES
	(2, 'first', NULL , 'last', '2222-02-02'),
	(4, 'first', 'middle', 'last', '2222-02-02')

	INSERT INTO test_SHOW_SELECTION_CLUB_EDITION.actual
	EXEC GET_SELECTION_CLUB_OF_EDITION 'club2', 'comp1', '20/21'

	EXEC tSQLt.AssertEqualsTable 'test_SHOW_SELECTION_CLUB_EDITION.expected', 'test_SHOW_SELECTION_CLUB_EDITION.actual'
END
GO
EXEC tSQLt.Run 'test_SHOW_SELECTION_CLUB_EDITION.[test GET_SELECTION_CLUB_OF_EDITION club2 comp1 20/21]'
GO
CREATE OR ALTER PROCEDURE test_SHOW_SELECTION_CLUB_EDITION.[test nonexistent club]
AS
BEGIN
	INSERT INTO test_SHOW_SELECTION_CLUB_EDITION.actual
	EXEC GET_SELECTION_CLUB_OF_EDITION 'a', 'comp1', '20/21'

	EXEC tSQLt.AssertEmptyTable 'test_SHOW_SELECTION_CLUB_EDITION.actual'
END
GO
EXEC tSQLt.Run 'test_SHOW_SELECTION_CLUB_EDITION.[test nonexistent club]'
GO
EXEC tSQLt.NewTestClass 'test_SHOW_CLUB_INFORMATION'
GO
CREATE OR ALTER PROCEDURE test_SHOW_CLUB_INFORMATION.[test proc GET_CLUB_INFORMATION]
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.CLUB'
	EXEC tSQLt.FakeTable 'dbo.STADIUM'

	INSERT INTO CLUB (CLUB_NAME, STADIUM_NAME, COACH_PERSON_ID, COUNTRY_NAME, CITY_NAME) VALUES
	('Vitesse', 'ahold', 22, 'The Netherlands', 'Antwerp'),
	('Ajax', 'De Kuip', 12, 'The Netherlands', 'Amsterdam')

	INSERT INTO STADIUM (STADIUM_NAME, CAPACITY)
	VALUES ('De Kuip', 150000)

	DROP TABLE IF EXISTS test_SHOW_CLUB_INFORMATION.expected

	DROP TABLE IF EXISTS test_SHOW_CLUB_INFORMATION.actual

	CREATE TABLE test_SHOW_CLUB_INFORMATION.expected (
		CLUB_NAME CLUB_NAME NOT NULL,
		CITY_NAME CITY_NAME NOT NULL, 
		COUNTRY_NAME COUNTRY_NAME NOT NULL, 
		STADIUM_NAME STADIUM_NAME NOT NULL, 
		CAPACITY_STADIUM CAPACITY NOT NULL,
		COACH G_IDENTITY NOT NULL
	)

	CREATE TABLE test_SHOW_CLUB_INFORMATION.actual (
		CLUB_NAME CLUB_NAME NOT NULL,
		CITY_NAME CITY_NAME NOT NULL, 
		COUNTRY_NAME COUNTRY_NAME NOT NULL, 
		STADIUM_NAME STADIUM_NAME NOT NULL, 
		CAPACITY_STADIUM CAPACITY NOT NULL,
		COACH G_IDENTITY NOT NULL
	)

	INSERT INTO test_SHOW_CLUB_INFORMATION.expected 
	VALUES ('Ajax', 'Amsterdam', 'The Netherlands', 'De Kuip', 150000, 12)

	INSERT INTO test_SHOW_CLUB_INFORMATION.actual
	EXEC GET_CLUB_INFORMATION 'Ajax'

	EXEC tSQLt.AssertEqualsTable 'test_SHOW_CLUB_INFORMATION.expected', 'test_SHOW_CLUB_INFORMATION.actual'
END
GO
EXEC tSQLt.Run 'test_SHOW_CLUB_INFORMATION.[test proc GET_CLUB_INFORMATION]'