EXEC tSQLt.NewTestClass 'testUserAuthorization';

GO

CREATE OR ALTER PROCEDURE testUserAuthorization.[test that the administrator can read and insert]
AS
BEGIN

	EXEC tSQLt.FakeTable @TableName='dbo.CITY'

    EXEC tSQLt.ExpectNoException

    EXECUTE AS USER = 'Administrator';

    EXEC ('SELECT * FROM dbo.CITY');

    EXEC ('INSERT INTO dbo.CITY (COUNTRY_NAME, CITY_NAME) VALUES (''COUNTRY_NAME'', ''CITY_NAME'')');

END;

GO

EXEC tSQLt.Run 'testUserAuthorization.[test that the administrator can read and insert]';

GO

CREATE OR ALTER PROCEDURE testUserAuthorization.[test that the administrator can delete and update]
AS
BEGIN

    EXEC tSQLt.FakeTable @TableName='dbo.CITY'

    EXEC tSQLt.ExpectNoException

    EXECUTE AS USER = 'Administrator';

    EXEC ('DELETE FROM CITY WHERE CITY_NAME = ''CITY'';');

    EXEC ('UPDATE COUNTRY SET COUNTRY_NAME = ''COUNTRY'' WHERE COUNTRY_NAME = ''COUNTRY'';');

END;

GO

EXEC tSQLt.Run 'testUserAuthorization.[test that the administrator can delete and update]';

GO

CREATE OR ALTER PROCEDURE testUserAuthorization.[test that the data_analist can not delete insert and update]
AS
BEGIN

  	EXEC tSQLt.FakeTable @TableName='dbo.CITY';

    EXEC tSQLt.ExpectException;

    EXECUTE AS USER = 'Data_analist';

    EXEC ('DELETE FROM dbo.CITY WHERE CITY_NAME = ''CITY'';');

    EXEC ('UPDATE dbo.CITY SET CITY_NAME = ''CITY'' WHERE COUNTRY_NAME = ''CITY'';');

  	EXEC ('INSERT INTO dbo.CITY(CITY_NAME) WHERE CITY = ''CITY'';');

END;

GO

EXEC tSQLt.Run 'testUserAuthorization.[test that the data_analist can not delete insert and update]';

GO

CREATE OR ALTER PROCEDURE testUserAuthorization.[test that the data_analist can read]
AS
BEGIN

    EXEC tSQLt.FakeTable @TableName='dbo.CITY';

    EXEC tSQLt.ExpectNoException;

    EXECUTE AS USER = 'Data_analist';

    EXEC ('SELECT * FROM dbo.CITY');

END;

EXEC tSQLt.Run 'testUserAuthorization.[test that the data_analist can read]';
