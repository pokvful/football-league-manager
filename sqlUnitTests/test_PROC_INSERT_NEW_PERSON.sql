tSQLt.NewTestClass @ClassName = 'test_PROC_INSERT_NEW_PERSON';

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.SETUP
AS
BEGIN

	EXEC tSQLt.FakeTable @tableName = 'dbo.Person', @Identity = 1;
	EXEC tSQLt.FakeTable @tableName = 'dbo.Player';
	EXEC tSQLt.FakeTable @tableName = 'dbo.Referee';
	EXEC tSQLt.FakeTable @tableName = 'dbo.Coach';

END

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_PLAYER_VALID_DATA_PLAYER]
AS
BEGIN

	EXEC PROC_INSERT_NEW_PLAYER 'Country', 'FirstName', 'LastName', 'MiddleName', '2000-10-04', 'Club', 1

	CREATE TABLE expected
	(
		PERSON_ID INT,
		CLUB_NAME VARCHAR(128),
		JERSEY    INT
	);

	INSERT INTO expected (PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'Club', 1)

	EXEC tSQLt.AssertEqualsTable @Expected='expected',
		 @Actual='dbo.Player'
END

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_PLAYER_VALID_DATA_PLAYER_PERSON]
AS
BEGIN

	EXEC PROC_INSERT_NEW_PLAYER 'Country', 'FirstName', 'LastName', 'MiddleName', '2000-10-04', 'Club', 1

	CREATE TABLE expected
	(
		PERSON_ID    INT,
		COUNTRY_NAME VARCHAR(128),
		FIRST_NAME   VARCHAR(128),
		LAST_NAME    VARCHAR(128),
		MIDDLE_NAME  VARCHAR(128),
		BIRTH_DATE   DATE
	);

	INSERT INTO expected (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	VALUES (1, 'Country', 'FirstName', 'LastName', 'MiddleName', '2000-10-04');

	EXEC tSQLt.AssertEqualsTable @Expected='expected',
		 @Actual='dbo.Person';
END

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_REFEREE_VALID_DATA_REFEREE]
AS
BEGIN

	EXEC PROC_INSERT_NEW_REFEREE @Country_name = 'Country', @First_name = 'Piet', @Last_name = 'Jan',
		 @Middle_name = 'van', @Birth_Date = '2000-10-04'

	CREATE TABLE expected
	(
		PERSON_ID INT
	);

	INSERT INTO expected (PERSON_ID)
	VALUES (1)

	EXEC tSQLt.AssertEqualsTable @Expected='expected',
		 @Actual='dbo.Referee'
END

GO


CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_REFEREE_VALID_DATA_REFEREE_PERSON]
AS
BEGIN

	EXEC PROC_INSERT_NEW_REFEREE @Country_name = 'Country', @First_name = 'Piet', @Last_name = 'Jan',
		 @Middle_name = 'van', @Birth_Date = '2000-10-04'

	CREATE TABLE expected
	(
		PERSON_ID    INT,
		COUNTRY_NAME VARCHAR(128),
		FIRST_NAME   VARCHAR(128),
		LAST_NAME    VARCHAR(128),
		MIDDLE_NAME  VARCHAR(128),
		BIRTH_DATE   DATE
	);

	INSERT INTO expected (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	VALUES (1, 'Country', 'Piet', 'Jan', 'van', '2000-10-04');

	EXEC tSQLt.AssertEqualsTable @Expected='expected',
		 @Actual='dbo.Person';
END

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_COACH_VALID_DATA_COACH]
AS
BEGIN

	EXEC PROC_INSERT_NEW_COACH @Country_name = 'Country', @First_name = 'Piet', @Last_name = 'Jan',
		 @Middle_name = 'van', @Birth_Date = '2000-10-04'

	CREATE TABLE expected
	(
		PERSON_ID INT
	);

	INSERT INTO expected (PERSON_ID)
	VALUES (1)

	EXEC tSQLt.AssertEqualsTable @Expected='expected',
		 @Actual='dbo.Coach'

END

GO


CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_COACH_VALID_DATA_COACH_PERSON]
AS
BEGIN

	EXEC PROC_INSERT_NEW_COACH @Country_name = 'Country', @First_name = 'Piet', @Last_name = 'Jan',
		 @Middle_name = 'van', @Birth_Date = '2000-10-04';

	CREATE TABLE expected
	(
		PERSON_ID    INT,
		COUNTRY_NAME VARCHAR(128),
		FIRST_NAME   VARCHAR(128),
		LAST_NAME    VARCHAR(128),
		MIDDLE_NAME  VARCHAR(128),
		BIRTH_DATE   DATE
	);

	INSERT INTO expected (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	VALUES (1, 'Country', 'Piet', 'Jan', 'van', '2000-10-04');

	EXEC tSQLt.AssertEqualsTable @Expected='expected',
		 @Actual='dbo.Person';
END

GO

TSQLT.Run @TestName = test_PROC_INSERT_NEW_PERSON;