exec TSQLT.NEWTESTCLASS 'TRG_CHECK_ALL_EVENTS';
go

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.SETUP
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.POSITION'
	EXEC tSQLt.FakeTable 'dbo.SUBSTITUTE'

	EXEC tSQLt.FakeTable 'dbo.PASS'
	EXEC tSQLt.FakeTable 'dbo.GOAL'
	EXEC tSQLt.FakeTable 'dbo.SHOT'
	EXEC tSQLt.FakeTable 'dbo.FOUL'
	EXEC tSQLt.FakeTable 'dbo.CORNER'


	INSERT INTO POSITION (PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES	(1, 1, 'ATTACK'),
		   	(2, 1, 'DEFFEBDER'),
			(3, 1, 'ATTACK'),
			(4, 1, 'KEEPER'),
			(5, 1, 'ATTACK')

	INSERT INTO SUBSTITUTE (MATCH_ID, TIME, IN_PERSON_ID, OUT_PERSON_ID)
	VALUES (1, 45, 6, 1),
		   (1, 86, 7, 2),
		   (1, 86, 8, 3),
		   (1, 86, 9, 4),
		   (1, 86, 10, 5)

	EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.PASS', @triggername = 'TRG_PASS_ONLY_FOR_PLAYER_PLAYED_IN_MATCH'
END
GO

----------------------------------------------------------------------------------------------------------------------
--PASS
CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test pass only for one player played in match, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.PASS(MATCH_ID, TIME, PERSON_ID, SUCCES)
	VALUES (1, 35, 1, 'true')
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test pass only for one player played in match, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.PASS(MATCH_ID, TIME, PERSON_ID, SUCCES)
	VALUES (1, 24, 124, 'true')
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test pass for more then one player played in match where both played in match, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.PASS(MATCH_ID, TIME, PERSON_ID, SUCCES)
	VALUES (1, 24, 1, 'true'),
		   (1, 24, 2, 'true')
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test pass for more then one player played in match where one doesnt exist, should failed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.PASS(MATCH_ID, TIME, PERSON_ID, SUCCES)
	VALUES (1, 24, 1, 'true'),
		   (1, 24, 124, 'true')
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[test pass when person id is correct but match id doesn't exist, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.PASS(MATCH_ID, TIME, PERSON_ID, SUCCES)
	VALUES (1, 24, 1, 'true'),
		   (17, 24, 2, 'true')
--Assert
END
GO

--EXEC tSQLt.Run[TRG_CHECK_ALL_EVENTS]

----------------------------------------------------------------------------------------------------------------------
--GOAL
exec TSQLT.NEWTESTCLASS 'TRG_CHECK_ALL_EVENTS';
go

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.SETUP
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.POSITION'
	EXEC tSQLt.FakeTable 'dbo.SUBSTITUTE'

	EXEC tSQLt.FakeTable 'dbo.PASS'
	EXEC tSQLt.FakeTable 'dbo.GOAL'
	EXEC tSQLt.FakeTable 'dbo.SHOT'
	EXEC tSQLt.FakeTable 'dbo.FOUL'
	EXEC tSQLt.FakeTable 'dbo.CORNER'


	INSERT INTO POSITION (PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES	(1, 1, 'ATTACK'),
		   	(2, 1, 'DEFFEBDER'),
			(3, 1, 'ATTACK'),
			(4, 1, 'KEEPER'),
			(5, 1, 'ATTACK')

	INSERT INTO SUBSTITUTE (MATCH_ID, TIME, IN_PERSON_ID, OUT_PERSON_ID)
	VALUES (1, 45, 6, 1),
		   (1, 86, 7, 2),
		   (1, 86, 8, 3),
		   (1, 86, 9, 4),
		   (1, 86, 10, 5)

	EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.PASS', @triggername = 'TRG_PASS_ONLY_FOR_PLAYER_PLAYED_IN_MATCH'
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test goal only for one player played in match, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.GOAL(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 35, 1)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test goal only for one player played in match, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.GOAL(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 35, 124)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test goal for more then one player played in match where both played in match, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.GOAL(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 24, 1),
		   (1, 27, 2)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test pass for more then one player played in match where one doesnt exist, should failed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.GOAL(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 24, 1),
		   (1, 27, 86)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[test pass when person id is correct but match id doesn't exist, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.GOAL(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 24, 1),
		   (17, 24, 2)
--Assert
END
GO

EXEC tSQLt.Run[TRG_CHECK_ALL_EVENTS]