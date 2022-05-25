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

Wanneer deze procedure wordt uitgevoerd kan er een probleem ontstaan. 

Tussen de twee inserts in de procedure kan iemand anders een update uitvoeren.

Als deze persoon de person_ids aanpast na de eerste insert zal de output waarde niet overeenkomen met de nieuwe id.

Als dan de player insert wordt gedaan kan er een error komen.

Gelukkig is de risico dat dit gebeurt nihil.

Maar voor het geval dat kan de procedure het isolatie level `REPEATABLE READ` krijgen, nu kan de geïnserte waardes niet worden aangepast totdat de procedure is afgelopen en blijft het veilig.

Isolatie level `SERIALIZABLE` is niet nodig omdat andere inserts geen probleem vormen en hogere isolatie levels zorgen voor een lagere performance.