tSQLt.NewTestClass @ClassName = 'test_PROC_INSERT_NEW_PERSON';

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.SETUP
AS
BEGIN

	EXEC tSQLt.FakeTable @tableName = 'dbo.Person', @Identity = 1;
	EXEC tSQLt.FakeTable @tableName = 'dbo.Player';
	EXEC tSQLt.FakeTable @tableName = 'dbo.Referee';
	EXEC tSQLt.FakeTable @tableName = 'dbo.Coach';

	INSERT INTO dbo.Player (PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'Club', 1);

END

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_PLAYER_SUCCESS]
AS
BEGIN
	EXEC TSQLT.ExpectNoException;

	EXEC PROC_INSERT_NEW_PLAYER 'Country', 'FirstName', 'LastName', 'MiddleName', '2000-10-04', 'Club', 1

END

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_PLAYER_FAILS]
AS
BEGIN

	EXEC TSQLT.ExpectException;

	EXEC PROC_INSERT_NEW_PLAYER 'Country', 'FirstName', 'LastName', 'MiddleName', '2000-10-04', 'Club', 1

END

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_REFEREE_SUCCESS]
AS
BEGIN

	EXEC TSQLT.ExpectNoException;

	EXEC PROC_INSERT_NEW_REFEREE @Country_name = 'Country', @First_name = 'Piet', @Last_name = 'Jan',
		 @Middle_name = 'van', @Birth_Date = '2000-10-04'

END

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_REFEREE_FAILS]
AS
BEGIN

	EXEC TSQLT.ExpectException;

	EXEC PROC_INSERT_NEW_REFEREE @Country_name = 'Country', @First_name = 'Piet', @Last_name = 'Jan',
		 @Middle_name = 'van', @Birth_Date = '2000-10-04'

END

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_COACH_SUCCESS]
AS
BEGIN

	EXEC TSQLT.ExpectNoException;

	EXEC PROC_INSERT_NEW_COACH @Country_name = 'Country', @First_name = 'Piet', @Last_name = 'Jan',
		 @Middle_name = 'van', @Birth_Date = '2000-10-04'

END

GO

CREATE OR ALTER PROCEDURE test_PROC_INSERT_NEW_PERSON.[test_PROC_INSERT_NEW_COACH_FAILS]
AS
BEGIN

	EXEC TSQLT.ExpectException;

	EXEC PROC_INSERT_NEW_COACH @Country_name = 'Country', @First_name = 'Piet', @Last_name = 'Jan',
		 @Middle_name = 'van', @Birth_Date = '2000-10-04'
END

GO

TSQLT.Run @TestName = test_PROC_INSERT_NEW_PERSON;