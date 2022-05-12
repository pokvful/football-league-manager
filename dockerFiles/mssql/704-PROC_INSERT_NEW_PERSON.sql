CREATE PROCEDURE PROC_INSERT_NEW_PERSON
	@Country_name VARCHAR(128),
	@First_name VARCHAR(128),
	@Last_name VARCHAR(128),
	@Middle_name VARCHAR(128),
	@Birth_Date DATE
AS
    SET NOCOUNT ON;

    INSERT INTO PERSON (COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
		VALUES(@Country_name, @First_name, @Last_name, @Middle_name, @Birth_Date)

GO

