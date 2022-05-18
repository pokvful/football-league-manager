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

	EXEC tSQLt.ExpectNoException;

	CREATE TABLE expectedPlayerTable
	(
		PERSON_ID INT,
		CLUB_NAME VARCHAR(128),
		JERSEY    INT
	);

	INSERT INTO expectedPlayerTable (PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'Club', 1)

	CREATE TABLE expectedPersonTable
	(
		PERSON_ID    INT,
		COUNTRY_NAME VARCHAR(128),
		FIRST_NAME   VARCHAR(128),
		LAST_NAME    VARCHAR(128),
		MIDDLE_NAME  VARCHAR(128),
		BIRTH_DATE   DATE
	);

	INSERT INTO expectedPersonTable (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	VALUES (1, 'Country', 'FirstName', 'LastName', 'MiddleName', '2000-10-04');

	EXEC tSQLt.AssertEqualsTable @Expected='expectedPersonTable',
		 @Actual='dbo.Person';

	EXEC tSQLt.AssertEqualsTable @Expected='expectedPlayerTable',
		 @Actual='dbo.Player'
END

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_REFEREE_VALID_DATA_REFEREE]
AS
BEGIN

	EXEC PROC_INSERT_NEW_REFEREE @Country_name = 'Country', @First_name = 'Firstname', @Last_name = 'Lastname',
		 @Middle_name = 'MiddleName', @Birth_Date = '2000-10-04'

	EXEC TSQLT.ExpectNoException;

	CREATE TABLE expectedRefereeTable
	(
		PERSON_ID INT
	);

	INSERT INTO expectedRefereeTable (PERSON_ID)
	VALUES (1)

	CREATE TABLE expectedPersonTable
	(
		PERSON_ID    INT,
		COUNTRY_NAME VARCHAR(128),
		FIRST_NAME   VARCHAR(128),
		LAST_NAME    VARCHAR(128),
		MIDDLE_NAME  VARCHAR(128),
		BIRTH_DATE   DATE
	);

	INSERT INTO expectedPersonTable (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	VALUES (1, 'Country', 'FirstName', 'LastName', 'MiddleName', '2000-10-04');

	EXEC tSQLt.AssertEqualsTable @Expected='expectedPersonTable',
		 @Actual='dbo.Person';

	EXEC tSQLt.AssertEqualsTable @Expected='expectedRefereeTable',
		 @Actual='dbo.Referee'
END

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_COACH_VALID_DATA_COACH]
AS
BEGIN

	EXEC PROC_INSERT_NEW_COACH @Country_name = 'Country', @First_name = 'Firstname', @Last_name = 'Lastname',
		 @Middle_name = 'MiddleName', @Birth_Date = '2000-10-04'

	CREATE TABLE expectedCoachTable
	(
		PERSON_ID INT
	);

	INSERT INTO expectedCoachTable (PERSON_ID)
	VALUES (1)

	CREATE TABLE expectedPersonTable
	(
		PERSON_ID    INT,
		COUNTRY_NAME VARCHAR(128),
		FIRST_NAME   VARCHAR(128),
		LAST_NAME    VARCHAR(128),
		MIDDLE_NAME  VARCHAR(128),
		BIRTH_DATE   DATE
	);

	INSERT INTO expectedPersonTable (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	VALUES (1, 'Country', 'FirstName', 'LastName', 'MiddleName', '2000-10-04');

	EXEC tSQLt.AssertEqualsTable @Expected='expectedPersonTable',
		 @Actual='dbo.Person';

	EXEC tSQLt.AssertEqualsTable @Expected='expectedCoachTable',
		 @Actual='dbo.Coach'

END

GO

TSQLT.Run @TestName = test_PROC_INSERT_NEW_PERSON;