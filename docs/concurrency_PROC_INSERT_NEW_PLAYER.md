De procedure waar er een potentieel concurrency probleem kan voorkomen is PROC_INSERT_NEW_PLAYER

```SQL
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
```

Op dit moment kan er een probleem ontstaan in deze procedure.

Na de eerste insert wordt een person_id terug gegeven.

Deze person_id wordt in de volgende insert gebruikt om een player te koppelen, maar als de person_id wordt veranderd tussendoor dan komt er een error.

Om dit probleem op te lossen krijgt de procedure het isolatie level `REPEATABLE READ`.

Nu kan de geïnserte waarde niet worden aangepast totdat de procedure is afgelopen.

De zwaardere isolatie level `SERIALIZABLE` is niet nodig, omdat andere inserts geen problemen opleveren. `SERIALIZABLE` zorgt voor een lagere performance dan `REPEATABLE READ`.