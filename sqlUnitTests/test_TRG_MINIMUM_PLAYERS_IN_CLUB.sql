exec TSQLT.NEWTESTCLASS 'TRG_MINIMUM_PLAYERS_IN_CLUB'
go

CREATE
OR
ALTER PROCEDURE [TRG_MINIMUM_PLAYERS_IN_CLUB].[Test total player in club is les then 11 failed]
    AS
BEGIN
--Assemble
EXEC tSQLt.FakeTable 'dbo', PLAYER;
EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.PLAYER', @triggername = 'TRG_MINIMUM_PLAYERS_IN_CLUB'
--Act
EXEC [tSQLt].[ExpectException] 'There must be at least 11 players in a club'
INSERT INTO dbo.PLAYER(PERSON_ID, CLUB_NAME,JERSEY)
VALUES	(1,'TESTCLUB1', 1),
		(2,'TESTCLUB1', 2),
		(3,'TESTCLUB1', 3),
		(4,'TESTCLUB1', 4),
		(5,'TESTCLUB1', 5),
		(6,'TESTCLUB1', 6),
		(7,'TESTCLUB1', 7),
		(8,'TESTCLUB1', 8)
--Assert

end
go

CREATE
OR
ALTER PROCEDURE [TRG_MINIMUM_PLAYERS_IN_CLUB].[Test total player in club is les then 11 passed]
    AS
BEGIN
--Assemble
EXEC tSQLt.FakeTable 'dbo', PLAYER;
EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.PLAYER', @triggername = 'TRG_MINIMUM_PLAYERS_IN_CLUB'
--Act
EXEC [tSQLt].[ExpectNoException]
INSERT INTO dbo.PLAYER(PERSON_ID, CLUB_NAME,JERSEY)
VALUES  (1,'TESTCLUB1', 1),
		(2,'TESTCLUB1', 2),
		(3,'TESTCLUB1', 3),
		(4,'TESTCLUB1', 4),
		(5,'TESTCLUB1', 5),
		(6,'TESTCLUB1', 6),
		(7,'TESTCLUB1', 7),
		(8,'TESTCLUB1', 8),
		(9,'TESTCLUB1', 9),
		(10,'TESTCLUB1', 10),
		(11,'TESTCLUB1', 11),
		(12,'TESTCLUB1', 12)
--Assert

end
go

CREATE
OR
ALTER PROCEDURE [TRG_MINIMUM_PLAYERS_IN_CLUB].[Test total player in club is les then 11 passed when inserted more then one team passed]
    AS
BEGIN
--Assemble
EXEC tSQLt.FakeTable 'dbo', PLAYER;
EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.PLAYER', @triggername = 'TRG_MINIMUM_PLAYERS_IN_CLUB'
--Act
EXEC [tSQLt].[ExpectNoException]
INSERT INTO dbo.PLAYER(PERSON_ID, CLUB_NAME,JERSEY)
VALUES  (1,'TESTCLUB1', 1),
		(2,'TESTCLUB1', 2),
		(3,'TESTCLUB1', 3),
		(4,'TESTCLUB1', 4),
		(5,'TESTCLUB1', 5),
		(6,'TESTCLUB1', 6),
		(7,'TESTCLUB1', 7),
		(8,'TESTCLUB1', 8),
		(9,'TESTCLUB1', 9),
		(10,'TESTCLUB1', 10),
		(11,'TESTCLUB1', 11),
		(12,'TESTCLUB1', 12),
		(1,'TESTCLUB2', 1),
		(2,'TESTCLUB2', 2),
		(3,'TESTCLUB2', 3),
		(4,'TESTCLUB2', 4),
		(5,'TESTCLUB2', 5),
		(6,'TESTCLUB2', 6),
		(7,'TESTCLUB2', 7),
		(8,'TESTCLUB2', 8),
		(9,'TESTCLUB2', 9),
		(10,'TESTCLUB2', 10),
		(11,'TESTCLUB2', 11)
--Assert

end
go

CREATE
OR
ALTER PROCEDURE [TRG_MINIMUM_PLAYERS_IN_CLUB].[Test total player in club is les then 11 passed when inserted more then one team failed]
    AS
BEGIN
--Assemble
EXEC tSQLt.FakeTable 'dbo', PLAYER;
EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.PLAYER', @triggername = 'TRG_MINIMUM_PLAYERS_IN_CLUB'
--Act
EXEC [tSQLt].[ExpectException] 'There must be at least 11 players in a club'
INSERT INTO dbo.PLAYER(PERSON_ID, CLUB_NAME,JERSEY)
VALUES  (1,'TESTCLUB1', 1),
		(2,'TESTCLUB1', 2),
		(3,'TESTCLUB1', 3),
		(4,'TESTCLUB1', 4),
		(5,'TESTCLUB1', 5),
		(6,'TESTCLUB1', 6),
		(7,'TESTCLUB1', 7),
		(8,'TESTCLUB1', 8),
		(9,'TESTCLUB1', 9),
		(10,'TESTCLUB1', 10),
		(11,'TESTCLUB1', 11),
		(12,'TESTCLUB1', 12),
		(1,'TESTCLUB2', 1),
		(2,'TESTCLUB2', 2),
		(3,'TESTCLUB2', 3),
		(4,'TESTCLUB2', 4),
		(5,'TESTCLUB2', 5)
--Assertv

end
go

EXEC tSQLt.Run[TRG_MINIMUM_PLAYERS_IN_CLUB]