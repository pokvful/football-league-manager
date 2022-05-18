exec TSQLT.NEWTESTCLASS 'TRG_CHECK_ALL_EVENTS';
go

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.SETUP
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.POSITION'
	EXEC tSQLt.FakeTable 'dbo.PLAYER_AS_RESERVE_IN_MATCH'

	EXEC tSQLt.FakeTable 'dbo.PASS'
	EXEC tSQLt.FakeTable 'dbo.GOAL'
	EXEC tSQLt.FakeTable 'dbo.SHOT'
	EXEC tSQLt.FakeTable 'dbo.FOUL'
	EXEC tSQLt.FakeTable 'dbo.CORNER'
	EXEC tSQLt.FakeTable 'dbo.SUBSTITUTE'

	INSERT INTO POSITION (PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES	(1, 1, 'ATTACK'),
		   	(2, 1, 'DEFFEBDER'),
			(3, 1, 'ATTACK'),
			(4, 1, 'KEEPER'),
			(5, 1, 'ATTACK')

	INSERT INTO PLAYER_AS_RESERVE_IN_MATCH (PLAYER_PERSON_ID, MATCH_ID)
	VALUES (6, 1),
	       (7, 1),
	       (8, 1),
	       (9, 1),
	       (10, 1)

	EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.PASS', @triggername = 'TRG_PASS_ONLY_FOR_PLAYER_PLAYED_IN_MATCH'
	EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.GOAL', @triggername = 'TRG_GOAL_ONLY_FOR_PLAYER_PLAYED_IN_MATCH'
	EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.SHOT', @triggername = 'TRG_SHOT_ONLY_FOR_PLAYER_PLAYED_IN_MATCH'
	EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.FOUL', @triggername = 'TRG_FOUL_ONLY_FOR_PLAYER_PLAYED_IN_MATCH'
	EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.CORNER', @triggername = 'TRG_CORNER_ONLY_FOR_PLAYER_PLAYED_IN_MATCH'
 	EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.SUBSTITUTE', @triggername = 'TRG_SUBSTITUTE_IN_ONLY_FOR_PLAYER_PLAYED_IN_MATCH'
 	EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.SUBSTITUTE', @triggername = 'TRG_SUBSTITUTE_OUT_ONLY_FOR_PLAYER_PLAYED_IN_MATCH'
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


----------------------------------------------------------------------------------------------------------------------
--GOAL

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


----------------------------------------------------------------------------------------------------------------------
--SHOT

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test SHOT only for one player played in match, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.SHOT(MATCH_ID, TIME, PERSON_ID, ON_GOAL)
	VALUES (1, 35, 1, 'TRUE')
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test SHOT only for one player played in match, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.SHOT(MATCH_ID, TIME, PERSON_ID, ON_GOAL)
	VALUES (1, 35, 124, 'false')
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test SHOT for more then one player played in match where both played in match, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.SHOT(MATCH_ID, TIME, PERSON_ID, ON_GOAL)
	VALUES (1, 24, 1, 'true'),
		   (1, 27, 2, 'true')
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test SHOT for more then one player played in match where one doesnt exist, should failed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.SHOT(MATCH_ID, TIME, PERSON_ID, ON_GOAL)
	VALUES (1, 24, 1, 'true'),
		   (1, 27, 86, 'true')
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[test SHOT when person id is correct but match id doesn't exist, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.SHOT(MATCH_ID, TIME, PERSON_ID, ON_GOAL)
	VALUES (1, 24, 1, 'true'),
		   (17, 24, 2, 'true')
--Assert
END
GO

----------------------------------------------------------------------------------------------------------------------
--FOUL

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test FOUL only for one player played in match, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.FOUL(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 35, 1)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test FOUL only for one player played in match, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.FOUL(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 35, 124)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test FOUL for more then one player played in match where both played in match, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.FOUL(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 24, 1),
		   (1, 27, 2)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test FOUL for more then one player played in match where one doesnt exist, should failed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.FOUL(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 24, 1),
		   (1, 27, 86)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[test FOUL when person id is correct but match id doesn't exist, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.FOUL(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 24, 1),
		   (17, 24, 2)
--Assert
END
GO

----------------------------------------------------------------------------------------------------------------------
--CORNER

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test CORNER only for one player played in match, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.CORNER(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 35, 1)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test CORNER only for one player played in match, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.CORNER(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 35, 124)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test CORNER for more then one player played in match where both played in match, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.CORNER(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 24, 1),
		   (1, 27, 2)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test CORNER for more then one player played in match where one doesnt exist, should failed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.CORNER(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 24, 1),
		   (1, 27, 99)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[test CORNER when person id is correct but match id doesn't exist, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.CORNER(MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 24, 1),
		   (17, 24, 2)
--Assert
END
GO


----------------------------------------------------------------------------------------------------------------------
--SUBSTITUTE IN

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test SUBSTITUTE_IN only for one player played in match and is reserve, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.SUBSTITUTE(MATCH_ID, TIME, IN_PERSON_ID, OUT_PERSON_ID)
	VALUES (1, 45, 6, 1)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test SUBSTITUTE_IN only for one player played in match and is reserve, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.SUBSTITUTE(MATCH_ID, TIME, IN_PERSON_ID, OUT_PERSON_ID)
	VALUES (1, 45, 77, 1)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test SUBSTITUTE_IN for more then one player played in match where one doesnt exist, should succeed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.SUBSTITUTE(MATCH_ID, TIME, IN_PERSON_ID, OUT_PERSON_ID)
	VALUES (1, 45, 6, 1),
		   (1, 86, 7, 2),
		   (1, 86, 8, 3),
		   (1, 86, 9, 4),
		   (1, 86, 10, 5)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test SUBSTITUTE_IN for more then one player played in match where one doesnt exist, should failed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.SUBSTITUTE(MATCH_ID, TIME, IN_PERSON_ID, OUT_PERSON_ID)
	VALUES (1, 45, 6, 1),
		   (1, 86, 7, 2),
		   (1, 86, 8, 3),
		   (1, 86, 9, 4),
		   (1, 86, 22, 5)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[test CSUBSTITUTE_IN when person id is correct but match id doesn't exist, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.SUBSTITUTE(MATCH_ID, TIME, IN_PERSON_ID, OUT_PERSON_ID)
	VALUES (2, 45, 6, 1)
--Assert
END
GO

----------------------------------------------------------------------------------------------------------------------
--SUBSTITUTE OUT

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test SUBSTITUTE_OUT only for one player played in match and is reserve, should fail]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.SUBSTITUTE(MATCH_ID, TIME, IN_PERSON_ID, OUT_PERSON_ID)
	VALUES (1, 45, 6, 13)
--Assert
END
GO

CREATE OR ALTER PROCEDURE TRG_CHECK_ALL_EVENTS.[Test SUBSTITUTE_IN for more then one player played in match where one doesnt exist, should failed]
AS
BEGIN
	--Assemble

--Act
	EXEC [tSQLt].[ExpectException] 'Player didnt play in the assigned match'
	INSERT INTO dbo.SUBSTITUTE(MATCH_ID, TIME, IN_PERSON_ID, OUT_PERSON_ID)
	VALUES (1, 45, 6, 1),
		   (1, 86, 7, 2),
		   (1, 86, 8, 3),
		   (1, 86, 9, 4),
		   (1, 86, 10, 15)
--Assert
END
GO


EXEC tSQLt.Run[TRG_CHECK_ALL_EVENTS]