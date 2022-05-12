EXEC tSQLt.NewTestClass 'TEST_CHK_PERSON_MINIMUM_AGE'
GO
CREATE OR ALTER PROCEDURE [TEST_CHK_PERSON_MINIMUM_AGE].[Test that checks if the person is at least 15 years old FAILING]
AS
BEGIN
    EXEC TSQLT.FAKETABLE 'dbo.PERSON'

    EXEC TSQLT.APPLYCONSTRAINT
        @TableName = 'dbo.PERSON', @ConstraintName = 'CHK_PERSON_HAS_VALID_AGE'

    EXEC TSQLT.ExpectException

	INSERT INTO PERSON (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
    VALUES(1, 'Netherlands', 'Pieter', ' Post', null, GETDATE())
END;
GO

EXEC tSQLt.Run '[TEST_CHK_PERSON_MINIMUM_AGE].[Test that checks if the person is at least 15 years old FAILING]'
GO

CREATE OR ALTER PROCEDURE [TEST_CHK_PERSON_MINIMUM_AGE].[Test that checks if the person is at least 15 years old PASSING]
AS
BEGIN
    EXEC TSQLT.FAKETABLE 'dbo.PERSON'

    EXEC TSQLT.APPLYCONSTRAINT
        @TableName = 'dbo.PERSON', @ConstraintName = 'CHK_PERSON_HAS_VALID_AGE'

    EXEC TSQLT.ExpectNoException

	INSERT INTO PERSON (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
    VALUES(1, 'Netherlands', 'Pieter', ' Post', null, '1980-01-01' )
END;
GO

EXEC tSQLt.Run '[TEST_CHK_PERSON_MINIMUM_AGE].[Test that checks if the person is at least 15 years old PASSING]'
GO

CREATE OR ALTER PROCEDURE [TEST_CHK_PERSON_MINIMUM_AGE].[Test that checks if the person is at least 15 years old PASSING EDGE]
AS
BEGIN
    EXEC TSQLT.FAKETABLE 'dbo.PERSON'

    EXEC TSQLT.APPLYCONSTRAINT
        @TableName = 'dbo.PERSON', @ConstraintName = 'CHK_PERSON_HAS_VALID_AGE'

    EXEC TSQLT.ExpectNoException

	INSERT INTO PERSON (BIRTH_DATE)
    VALUES(DATEADD(year, -15, GETDATE()))
END;
GO

EXEC tSQLt.Run '[TEST_CHK_PERSON_MINIMUM_AGE].[Test that checks if the person is at least 15 years old PASSING EDGE]'
GO

CREATE OR ALTER PROCEDURE [TEST_CHK_PERSON_MINIMUM_AGE].[Test that checks if the person is at least 15 years old FAILING EDGE]
AS
BEGIN
    EXEC TSQLT.FAKETABLE 'dbo.PERSON'

    EXEC TSQLT.APPLYCONSTRAINT
        @TableName = 'dbo.PERSON', @ConstraintName = 'CHK_PERSON_HAS_VALID_AGE'

    EXEC TSQLT.ExpectException

	INSERT INTO PERSON (BIRTH_DATE)
    VALUES(DATEADD(day, 1, DATEADD(year, -15, GETDATE())))
END;
GO

EXEC tSQLt.Run '[TEST_CHK_PERSON_MINIMUM_AGE].[Test that checks if the person is at least 15 years old FAILING EDGE]'
GO

