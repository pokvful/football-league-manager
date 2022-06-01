CREATE OR ALTER PROCEDURE PROC_INSERT_NEW_COACH @Country_name VARCHAR(128),
												@First_name VARCHAR(128),
												@Last_name VARCHAR(128),
												@Middle_name VARCHAR(128) = NULL,
												@Birth_Date DATE
AS
BEGIN
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	DECLARE @Inserted_personID TABLE
							   (
								   person_id INT NOT NULL
							   );

	INSERT INTO PERSON (COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	OUTPUT (inserted.PERSON_ID) INTO @Inserted_personID
	VALUES (@Country_name, @First_name, @Last_name, @Middle_name, @Birth_Date)

	INSERT INTO COACH (PERSON_ID)
	SELECT PERSON_ID
	FROM @Inserted_personID
END

GO

CREATE OR ALTER PROCEDURE PROC_INSERT_NEW_REFEREE @Country_name VARCHAR(128),
												  @First_name VARCHAR(128),
												  @Last_name VARCHAR(128),
												  @Middle_name VARCHAR(128) = NULL,
												  @Birth_Date DATE
AS
BEGIN
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	DECLARE @Inserted_personID TABLE
							   (
								   person_id INT NOT NULL
							   );

	INSERT INTO PERSON (COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	OUTPUT inserted.PERSON_ID INTO @Inserted_personID
	VALUES (@Country_name, @First_name, @Last_name, @Middle_name, @Birth_Date)

	INSERT INTO REFEREE (PERSON_ID)
	SELECT PERSON_ID
	FROM @Inserted_personID

END

GO

CREATE OR ALTER PROCEDURE PROC_INSERT_NEW_PLAYER @Country_name VARCHAR(128),
												 @First_name VARCHAR(128),
												 @Last_name VARCHAR(128),
												 @Middle_name VARCHAR(128) = NULL,
												 @Birth_date DATE,
												 @Club_name VARCHAR(128),
												 @Jersey INT
AS
BEGIN
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	DECLARE @Inserted_personID TABLE
							   (
								   person_id INT NOT NULL
							   );

	INSERT INTO PERSON (COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	OUTPUT (inserted.PERSON_ID) INTO @Inserted_personID
	VALUES (@Country_name, @First_name, @Last_name, @Middle_name, @Birth_date)

	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME, JERSEY)
	SELECT person_id, @Club_name, @Jersey
	FROM @Inserted_personID;
END
