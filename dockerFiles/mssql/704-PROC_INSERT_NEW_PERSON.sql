CREATE OR ALTER PROCEDURE PROC_INSERT_NEW_COACH @Person_id INT,
												@Country_name VARCHAR(128),
												@First_name VARCHAR(128),
												@Last_name VARCHAR(128),
												@Middle_name VARCHAR(128),
												@Birth_Date DATE
AS
	SET NOCOUNT ON;
BEGIN
	INSERT INTO PERSON (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	VALUES (@Person_ID, @Country_name, @First_name, @Last_name, @Middle_name, @Birth_Date)

	INSERT INTO COACH (PERSON_ID)
	VALUES (@Person_id)
END

GO
CREATE OR ALTER PROCEDURE PROC_INSERT_NEW_REFEREE @Person_id INT,
												  @Country_name VARCHAR(128),
												  @First_name VARCHAR(128),
												  @Last_name VARCHAR(128),
												  @Middle_name VARCHAR(128),
												  @Birth_Date DATE
AS
	SET NOCOUNT ON;
BEGIN
	INSERT INTO PERSON (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	VALUES (@Person_ID, @Country_name, @First_name, @Last_name, @Middle_name, @Birth_Date)

	INSERT INTO REFEREE (PERSON_ID)
	VALUES (@Person_id)

END

GO

CREATE OR ALTER PROCEDURE PROC_INSERT_NEW_PLAYER
												 @Country_name VARCHAR(128),
												 @First_name VARCHAR(128),
												 @Last_name VARCHAR(128),
												 @Middle_name VARCHAR(128),
												 @Birth_date DATE,
												 @Club_name VARCHAR(128),
												 @Jersey INT
AS
	SET NOCOUNT ON;

BEGIN
	INSERT INTO PERSON (COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	VALUES (@Country_name, @First_name, @Last_name, @Middle_name, @Birth_date)

	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (SCOPE_IDENTITY(), @Club_name, @Jersey)
END