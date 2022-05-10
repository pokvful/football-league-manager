
EXEC tSQLt.NewTestClass 'testUserAuthorization'

GO

CREATE OR ALTER PROCEDURE testUserAuthorization.[test that the administrator can read and insert]
AS
BEGIN

    EXEC tSQLt.FakeTable @TableName='dbo.CITY'

    EXEC tSQLt.ExpectNoException

    EXECUTE AS USER = 'Administrator';

    SELECT *
	    FROM dbo.CITY;

    INSERT INTO dbo.CITY (COUNTRY_NAME, CITY_NAME)
	    VALUES ('COUNTRY_NAME', 'CITY_NAME');

END;

GO

EXEC tSQLt.Run 'testUserAuthorization.[test that the administrator can read and write]'

GO

CREATE OR ALTER PROCEDURE testUserAuthorization.[test that the administrator can delete and update]
AS
BEGIN\

    EXEC tSQLt.FakeTable @TableName='dbo.CITY'

    EXEC tSQLt.ExpectNoException

    EXECUTE AS USER = 'Administrator';

    DELETE
	    FROM CITY
            WHERE CITY_NAME = 'CITY';

    UPDATE COUNTRY
        SET COUNTRY_NAME = 'COUNTRY'
            WHERE COUNTRY_NAME = 'COUNTRY'

END;

GO

EXEC tSQLt.Run 'testUserAuthorization.[test that the administrator can delete and update]'

GO

CREATE OR ALTER PROCEDURE testUserAuthorization.[test that the data_analist can not delete and update]
AS
BEGIN

    EXEC tSQLt.FakeTable @TableName='dbo.CITY'

    EXEC tSQLt.ExpectException

    EXECUTE AS USER = 'Data_analist';

    DELETE
	    FROM dbo.CITY
            WHERE CITY_NAME = 'CITY';

    UPDATE dbo.CITY
        SET CITY_NAME = 'CITY'
            WHERE COUNTRY_NAME = 'CITY'

END;

GO

EXEC tSQLt.Run 'testUserAuthorization.[test that the data_analist can not delete and update]'

GO

CREATE OR ALTER PROCEDURE testUserAuthorization.[test that the data_analist can read]
AS
BEGIN

    EXEC tSQLt.FakeTable @TableName='dbo.CITY'

    EXEC tSQLt.ExpectNoException

    EXECUTE AS USER = 'Data_analist';

    SELECT *
	    FROM dbo.CITY;

END;

EXEC tSQLt.Run 'testUserAuthorization.[test that the data_analist can read]'