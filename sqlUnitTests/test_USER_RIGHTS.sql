EXEC tSQLt.NewTestClass 'testUserAuthorization';

GO

CREATE OR ALTER PROCEDURE testUserAuthorization.SETUP
AS
BEGIN

	EXEC tSQLt.FakeTable @TableName = 'dbo.CITY'

END

GO

CREATE OR ALTER PROCEDURE testUserAuthorization.[test that the administrator can read and insert]
AS
BEGIN

	EXEC tSQLt.ExpectNoException

	EXECUTE AS USER = 'Administrator';

	EXEC ('SELECT * FROM dbo.CITY');

	EXEC ('INSERT INTO dbo.CITY (COUNTRY_NAME, CITY_NAME) VALUES (''COUNTRY_NAME'', ''CITY_NAME'')');

END;

GO

CREATE OR ALTER PROCEDURE testUserAuthorization.[test that the administrator can delete and update]
AS
BEGIN

	EXEC tSQLt.ExpectNoException

	EXECUTE AS USER = 'Administrator';

	EXEC ('DELETE FROM CITY WHERE CITY_NAME = ''CITY'';');

	EXEC ('UPDATE COUNTRY SET COUNTRY_NAME = ''COUNTRY'' WHERE COUNTRY_NAME = ''COUNTRY'';');

END;

GO


CREATE OR ALTER PROCEDURE testUserAuthorization.[test that transport can not delete and update]
AS
BEGIN

	EXEC tSQLt.ExpectException

	EXECUTE AS USER = 'Transport';

	EXEC ('DELETE FROM CITY WHERE CITY_NAME = ''CITY'';');

	EXEC ('UPDATE COUNTRY SET COUNTRY_NAME = ''COUNTRY'' WHERE COUNTRY_NAME = ''COUNTRY'';');

END;

GO

CREATE OR ALTER PROCEDURE testUserAuthorization.[test that the transport can read]
AS
BEGIN

	EXEC tSQLt.ExpectNoException

	EXECUTE AS USER = 'Transport';

	EXEC ('SELECT * FROM CITY WHERE CITY_NAME = ''CITY'';');

END;

GO

EXEC tSQLt.Run 'testUserAuthorization';
