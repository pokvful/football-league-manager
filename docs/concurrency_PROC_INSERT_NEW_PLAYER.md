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

Het kan gebeuren in het moment tussen dat de twee inserts worden uitgevoerd.

Bij de eerste insert in de PERSON tabel wordt de person id terug gegeven.

Maar als de person id wordt aangepast voordat de insert in PLAYER wordt gedaan levert dat problemen op.

Gelukkig is de risico dat dit gebeurt nihil.

Maar voor het geval dat kan de procedure het isolatie level `REPEATABLE READ` krijgen, nu kan de geïnserte waardes niet worden aangepast totdat de procedure is afgelopen en blijft het veilig.

Isolatie level `SERIALIZABLE` is niet nodig omdat andere inserts geen probleem vormen.