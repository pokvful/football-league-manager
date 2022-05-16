EXEC tSQLt.NewTestClass 'test_ADD_PLAYER_CLUB'
GO
CREATE OR ALTER PROC test_ADD_PLAYER_CLUB.SetUp
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.PERSON', @Identity = 1
	EXEC tSQLt.FakeTable 'dbo.PLAYER'

	DROP TABLE IF EXISTS test_ADD_PLAYER_CLUB.verwacht

	DROP TABLE IF EXISTS test_ADD_PLAYER_CLUB.verwacht2
END
GO
CREATE OR ALTER PROC test_ADD_PLAYER_CLUB.[test player added without middle name]
AS
BEGIN
	SELECT TOP(0) * 
	INTO test_ADD_PLAYER_CLUB.verwacht
	FROM PERSON

	SELECT TOP(0) *
	INTO test_ADD_PLAYER_CLUB.verwacht2
	FROM PLAYER

	SET IDENTITY_INSERT test_ADD_PLAYER_CLUB.verwacht ON
	INSERT INTO test_ADD_PLAYER_CLUB.verwacht (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	VALUES (1, 'United Kingdom', 'first', 'last', null, '2000-01-01')

	INSERT INTO test_ADD_PLAYER_CLUB.verwacht2 (PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'club1', 22)

	EXEC dbo.ADD_PLAYER_CLUB 'first', 'last', '2000-01-01', 'United Kingdom', 'club1', 22

	EXEC tSQLt.AssertEqualsTable 'test_ADD_PLAYER_CLUB.verwacht', 'PERSON'
	EXEC tSQLt.AssertEqualsTable 'test_ADD_PLAYER_CLUB.verwacht2', 'PLAYER'
END
GO
EXEC tSQLt.Run 'test_ADD_PLAYER_CLUB.[test player added without middle name]'
GO
CREATE OR ALTER PROC test_ADD_PLAYER_CLUB.[test player added with middle name]
AS
BEGIN
	SELECT TOP(0) * 
	INTO test_ADD_PLAYER_CLUB.verwacht
	FROM PERSON

	SELECT TOP(0) *
	INTO test_ADD_PLAYER_CLUB.verwacht2
	FROM PLAYER

	SET IDENTITY_INSERT test_ADD_PLAYER_CLUB.verwacht ON
	INSERT INTO test_ADD_PLAYER_CLUB.verwacht (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	VALUES (1, 'United Kingdom', 'first', 'last', 'm', '2000-01-01')

	INSERT INTO test_ADD_PLAYER_CLUB.verwacht2 (PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'club1', 22)

	EXEC dbo.ADD_PLAYER_CLUB 'first', 'last', '2000-01-01', 'United Kingdom', 'club1', 22, 'm'

	EXEC tSQLt.AssertEqualsTable 'test_ADD_PLAYER_CLUB.verwacht', 'PERSON'
	EXEC tSQLt.AssertEqualsTable 'test_ADD_PLAYER_CLUB.verwacht2', 'PLAYER'
END
GO
EXEC tSQLt.Run 'test_ADD_PLAYER_CLUB.[test player added with middle name]'
GO

EXEC tSQLt.NewTestClass 'test_ALTER_PLAYER_CLUB'
GO
CREATE OR ALTER PROC test_ALTER_PLAYER_CLUB.SetUp
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.PLAYER'

	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'club', 44)

	DROP TABLE IF EXISTS test_ALTER_PLAYER_CLUB.verwacht
END
GO
CREATE OR ALTER PROC test_ALTER_PLAYER_CLUB.[test verander alleen club]
AS
BEGIN
	SELECT TOP(0) *
	INTO test_ALTER_PLAYER_CLUB.verwacht
	FROM PLAYER

	INSERT INTO test_ALTER_PLAYER_CLUB.verwacht (PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'ander', 44)

	EXEC ALTER_PLAYER_CLUB 1, 'ander'

	EXEC tSQLt.AssertEqualsTable 'test_ALTER_PLAYER_CLUB.verwacht', 'PLAYER'
END
GO
EXEC tSQLt.Run 'test_ALTER_PLAYER_CLUB.[test verander alleen club]'
GO
CREATE OR ALTER PROC test_ALTER_PLAYER_CLUB.[test verander club en jersey]
AS
BEGIN
	SELECT TOP(0) *
	INTO test_ALTER_PLAYER_CLUB.verwacht
	FROM PLAYER

	INSERT INTO test_ALTER_PLAYER_CLUB.verwacht (PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'ander', 2)

	EXEC dbo.ALTER_PLAYER_CLUB 1, 'ander', 2

	EXEC tSQLt.AssertEqualsTable 'test_ALTER_PLAYER_CLUB.verwacht', 'PLAYER'
END
GO
EXEC tSQLt.Run 'test_ALTER_PLAYER_CLUB.[test verander club en jersey]'
GO

EXEC tSQLt.NewTestClass 'test_UPDATE_CLUB'
GO
CREATE OR ALTER PROC test_UPDATE_CLUB.SetUp
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.CLUB'
	EXEC tSQLt.FakeTable 'dbo.STADIUM'

	DROP TABLE IF EXISTS test_UPDATE_CLUB.verwacht
	DROP TABLE IF EXISTS test_UPDATE_CLUB.verwacht2

	INSERT INTO CLUB (CLUB_NAME, STADIUM_NAME, COACH_PERSON_ID, COUNTRY_NAME, CITY_NAME)
	VALUES ('club', 'stadium', 2, 'country', 'city')

	INSERT INTO STADIUM (STADIUM_NAME, CAPACITY)
	VALUES ('stadium', 666), ('stadium2', 333)
END
GO
CREATE OR ALTER PROC test_UPDATE_CLUB.[test update all information with existing stadium]
AS
BEGIN
	SELECT TOP(0) * 
	INTO test_UPDATE_CLUB.verwacht
	FROM CLUB

	SELECT TOP(0) *
	INTO test_UPDATE_CLUB.verwacht2
	FROM STADIUM

	INSERT INTO test_UPDATE_CLUB.verwacht (CLUB_NAME, STADIUM_NAME, COACH_PERSON_ID, COUNTRY_NAME, CITY_NAME)
	VALUES ('changedClub', 'stadium2', 4, 'cc', 'ccc')

	INSERT INTO test_UPDATE_CLUB.verwacht2 (STADIUM_NAME, CAPACITY)
	VALUES ('stadium', 666), ('stadium2', 333)

	EXEC dbo.UPDATE_CLUB @CLUB_NAME = 'club', @STADIUM_NAME = 'stadium2',@coach = 4, @COUNTRY_NAME = 'cc', @CITY_NAME = 'ccc', @NEW_CLUB_NAME =  'changedClub'

	EXEC tSQLt.AssertEqualsTable 'test_UPDATE_CLUB.verwacht', 'CLUB'
	EXEC tSQLt.AssertEqualsTable 'test_UPDATE_CLUB.verwacht2', 'STADIUM'
END
GO
EXEC tSQLt.Run 'test_UPDATE_CLUB.[test update all information with existing stadium]'
GO
CREATE OR ALTER PROC test_UPDATE_CLUB.[test all parameter null]
AS
BEGIN
	SELECT TOP(0) * 
	INTO test_UPDATE_CLUB.verwacht
	FROM CLUB

	SELECT TOP(0) *
	INTO test_UPDATE_CLUB.verwacht2
	FROM STADIUM

	INSERT INTO test_UPDATE_CLUB.verwacht (CLUB_NAME, STADIUM_NAME, COACH_PERSON_ID, COUNTRY_NAME, CITY_NAME)
	VALUES ('club', 'stadium', 2, 'country', 'city')

	INSERT INTO test_UPDATE_CLUB.verwacht2 (STADIUM_NAME, CAPACITY)
	VALUES ('stadium', 666), ('stadium2', 333)

	EXEC dbo.UPDATE_CLUB 'club'

	EXEC tSQLt.AssertEqualsTable 'test_UPDATE_CLUB.verwacht', 'CLUB'
	EXEC tSQLt.AssertEqualsTable 'test_UPDATE_CLUB.verwacht2', 'STADIUM'
END
GO
EXEC tSQLt.Run 'test_UPDATE_CLUB.[test all parameter null]'
GO
CREATE OR ALTER PROC test_UPDATE_CLUB.[test give club non existing stadium]
AS
BEGIN
	SELECT TOP(0) * 
	INTO test_UPDATE_CLUB.verwacht
	FROM CLUB

	SELECT TOP(0) *
	INTO test_UPDATE_CLUB.verwacht2
	FROM STADIUM

	INSERT INTO test_UPDATE_CLUB.verwacht (CLUB_NAME, STADIUM_NAME, COACH_PERSON_ID, COUNTRY_NAME, CITY_NAME)
	VALUES ('club', 'newadded', 2, 'country', 'city')

	INSERT INTO test_UPDATE_CLUB.verwacht2 (STADIUM_NAME, CAPACITY)
	VALUES ('stadium', 666), ('stadium2', 333), ('newadded', 2022)

	EXEC dbo.UPDATE_CLUB 'club', 'newadded', 2022

	EXEC tSQLt.AssertEqualsTable 'test_UPDATE_CLUB.verwacht', 'CLUB'
	EXEC tSQLt.AssertEqualsTable 'test_UPDATE_CLUB.verwacht2', 'STADIUM'
END
GO
EXEC tSQLt.Run 'test_UPDATE_CLUB.[test give club non existing stadium]'