exec TSQLT.NEWTESTCLASS 'TRG_MINIMUM_PLAYERS_IN_CLUB'
go

CREATE OR ALTER PROCEDURE TRG_MINIMUM_PLAYERS_IN_CLUB.SETUP
AS
BEGIN

	EXEC tSQLt.FakeTable 'dbo.PLAYER'
	INSERT INTO dbo.PLAYER(PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (30, 'TESTCLUB10', 1),
		   (31, 'TESTCLUB10', 2),
		   (32, 'TESTCLUB10', 3),
		   (33, 'TESTCLUB10', 4),
		   (34, 'TESTCLUB10', 5),
		   (35, 'TESTCLUB10', 6),
		   (36, 'TESTCLUB10', 7),
		   (37, 'TESTCLUB10', 8),
		   (38, 'TESTCLUB10', 9),
		   (39, 'TESTCLUB10', 10),
		   (40, 'TESTCLUB10', 11),
		   (41, 'TESTCLUB10', 12)
	EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.PLAYER', @triggername = 'TRG_MINIMUM_PLAYERS_IN_CLUB'
END
GO

CREATE OR ALTER PROCEDURE TRG_MINIMUM_PLAYERS_IN_CLUB.[Test total player in club is equal or more than 11, should succeed]
AS
BEGIN
	--Assemble
--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.PLAYER(PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'TESTCLUB1', 1),
		   (2, 'TESTCLUB1', 2),
		   (3, 'TESTCLUB1', 3),
		   (4, 'TESTCLUB1', 4),
		   (5, 'TESTCLUB1', 5),
		   (6, 'TESTCLUB1', 6),
		   (7, 'TESTCLUB1', 7),
		   (8, 'TESTCLUB1', 8),
		   (9, 'TESTCLUB1', 9),
		   (10, 'TESTCLUB1', 10),
		   (11, 'TESTCLUB1', 11),
		   (12, 'TESTCLUB1', 12)
--Assert

end
go

CREATE OR ALTER PROCEDURE TRG_MINIMUM_PLAYERS_IN_CLUB.[Test total player in club is less than 11, should fail]
AS
BEGIN
	--Assemble
--Act
	EXEC [tSQLt].[ExpectException] 'There must be at least 11 players in a club'
	INSERT INTO dbo.PLAYER(PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'TESTCLUB1', 1),
		   (2, 'TESTCLUB1', 2),
		   (3, 'TESTCLUB1', 3),
		   (4, 'TESTCLUB1', 4),
		   (5, 'TESTCLUB1', 5),
		   (6, 'TESTCLUB1', 6),
		   (7, 'TESTCLUB1', 7),
		   (8, 'TESTCLUB1', 8)
--Assert

end
go

CREATE OR ALTER PROCEDURE TRG_MINIMUM_PLAYERS_IN_CLUB.[Test when more then one team with total player in club is equal or more than 11, should succeed]
AS
BEGIN
	--Assemble
--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.PLAYER(PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'TESTCLUB1', 1),
		   (2, 'TESTCLUB1', 2),
		   (3, 'TESTCLUB1', 3),
		   (4, 'TESTCLUB1', 4),
		   (5, 'TESTCLUB1', 5),
		   (6, 'TESTCLUB1', 6),
		   (7, 'TESTCLUB1', 7),
		   (8, 'TESTCLUB1', 8),
		   (9, 'TESTCLUB1', 9),
		   (10, 'TESTCLUB1', 10),
		   (11, 'TESTCLUB1', 11),
		   (12, 'TESTCLUB1', 12),
		   (1, 'TESTCLUB2', 1),
		   (2, 'TESTCLUB2', 2),
		   (3, 'TESTCLUB2', 3),
		   (4, 'TESTCLUB2', 4),
		   (5, 'TESTCLUB2', 5),
		   (6, 'TESTCLUB2', 6),
		   (7, 'TESTCLUB2', 7),
		   (8, 'TESTCLUB2', 8),
		   (9, 'TESTCLUB2', 9),
		   (10, 'TESTCLUB2', 10),
		   (11, 'TESTCLUB2', 11)
--Assert

end
go

CREATE OR ALTER PROCEDURE TRG_MINIMUM_PLAYERS_IN_CLUB.[Test when more then one team is inserted with one team les then 11, should fail]
AS
BEGIN
	--Assemble
--Act
	EXEC [tSQLt].[ExpectException] 'There must be at least 11 players in a club'
	INSERT INTO dbo.PLAYER(PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'TESTCLUB1', 1),
		   (2, 'TESTCLUB1', 2),
		   (3, 'TESTCLUB1', 3),
		   (4, 'TESTCLUB1', 4),
		   (5, 'TESTCLUB1', 5),
		   (6, 'TESTCLUB1', 6),
		   (7, 'TESTCLUB1', 7),
		   (8, 'TESTCLUB1', 8),
		   (9, 'TESTCLUB1', 9),
		   (10, 'TESTCLUB1', 10),
		   (11, 'TESTCLUB1', 11),
		   (12, 'TESTCLUB1', 12),
		   (1, 'TESTCLUB2', 1),
		   (2, 'TESTCLUB2', 2),
		   (3, 'TESTCLUB2', 3),
		   (4, 'TESTCLUB2', 4),
		   (5, 'TESTCLUB2', 5)
--Assertv

end
go

CREATE OR ALTER PROCEDURE TRG_MINIMUM_PLAYERS_IN_CLUB.[Test when existing player plus inserted player is above 11 player, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.PLAYER(PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (42, 'TESTCLUB10', 13),
		   (43, 'TESTCLUB10', 14)


--Assertv

end
go

EXEC tSQLt.Run[TRG_MINIMUM_PLAYERS_IN_CLUB]