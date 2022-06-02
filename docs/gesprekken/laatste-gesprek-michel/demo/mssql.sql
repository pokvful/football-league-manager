-- er moeten minstens 7 mensen en maximaal 11 mensen per club in de lineup staan
DELETE FROM LINEUP
	WHERE MATCH_ID = 1295;

INSERT INTO LINEUP (PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES (17, 1295, 'ATTACKER'),
		(26, 1295, 'ATTACKER'),
		(53, 1295, 'ATTACKER'),
		(71, 1295, 'ATTACKER');

INSERT INTO LINEUP (PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES ( 17, 1295, 'ATTACKER'), -- 1
		( 26, 1295, 'ATTACKER'),
		( 35, 1295, 'ATTACKER'),
		( 44, 1295, 'ATTACKER'),
		( 53, 1295, 'ATTACKER'),
		( 62, 1295, 'ATTACKER'),
		( 71, 1295, 'ATTACKER'),
		( 80, 1295, 'ATTACKER'),
		( 89, 1295, 'ATTACKER'),
		( 98, 1295, 'ATTACKER'), -- 10
		(107, 1295, 'ATTACKER'),
		(116, 1295, 'ATTACKER'),
		(125, 1295, 'ATTACKER'),
		(134, 1295, 'ATTACKER'),
		(143, 1295, 'ATTACKER'),
		(152, 1295, 'ATTACKER'),
		(161, 1295, 'ATTACKER');

-- Voeg een nieuwe event toe
DECLARE @columns ColumnTable;

INSERT INTO @columns (nameColumn, typeColumn, nullable)
	VALUES ('test_column', 'VARCHAR(60)', 'NOT NULL');

EXECUTE ADD_NEW_EVENT_TYPE
	@newEventName = 'TestEvent',
	@extraColumns = @columns;
GO

EXECUTE sp_help 'MATCH'; -- er staat nu een fk naar de match tabel vanuit TestEvent (staat onderaan)

-- nieuwe positie toevoegen en gebruiken
UPDATE LINEUP
	SET POSITION_TYPE = 'OUTSIDER'
	WHERE PLAYER_PERSON_ID = 107;

-- na het toevoegen van een nieuwe soort positie, mag de bovenstaande query wel worden uitgevoerd
INSERT INTO [POSITION] (POSITION_TYPE)
	VALUES ('OUTSIDER');

-- er is een blacklist toegevoegd zodat bepaalde tabellen niet mee overgenoomen worden naar mongo
SELECT * FROM [POSITION];
-- mongosh: db.POSITION.find()
