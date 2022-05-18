tSQLt.NewTestClass @ClassName = 'test_PROC_ADD_MATCHDATA';

CREATE OR ALTER PROCEDURE test_PROC_ADD_MATCHDATA.SETUP
AS
BEGIN
	EXEC tSQLt.FakeTable @tableName = 'red_card'
	EXEC tSQLt.FakeTable @tableName = 'yellow_card'
	EXEC tSQLt.FakeTable @tableName = 'pass'
	EXEC tSQLt.FakeTable @tableName = 'goal'
	EXEC tSQLt.FakeTable @tableName = 'shot'
	EXEC tSQLt.FakeTable @tableName = 'foul'
	EXEC tSQLt.FakeTable @tableName = 'corner'
	EXEC tSQLt.FakeTable @tableName = 'substitute'
END
GO

/*
	Procedure: Add Red Card
 */
CREATE OR ALTER PROCEDURE [test_PROC_ADD_MATCHDATA].[test_PROC_ADD_MATCHDATA_Add_Red_Card_No_Exception]
AS
BEGIN
    -- Act
	EXEC PROC_ADD_MATCHDATA_RED_CARD 1, 24, 1
	EXEC tSQLt.ExpectNoException;

	CREATE TABLE expectedRedCardTable (
	    match_id g_identity,
	    time minute_in_match,
	    person_id person_id
	);

	INSERT INTO expectedRedCardTable (match_id, time, person_id)
	VALUES (1, 24, 1)

    -- Assert
	EXEC tSQLt.AssertEqualsTable @Expected='expectedRedCardTable', @Actual='red_card'
END
GO

EXEC tsqlt.run [test_PROC_ADD_MATCHDATA.test_PROC_ADD_MATCHDATA_Add_Red_Card_No_Exception]
GO


/*
	Procedure: Add Yellow Card
 */
CREATE OR ALTER PROCEDURE [test_PROC_ADD_MATCHDATA].[test_PROC_ADD_MATCHDATA_Add_Yellow_Card_No_Exception]
AS
BEGIN
    -- Act
	EXEC PROC_ADD_MATCHDATA_YELLOW_CARD 4, 61, 3
	EXEC tSQLt.ExpectNoException;

	CREATE TABLE expectedYellowCardTable (
	    match_id g_identity,
	    time minute_in_match,
	    person_id person_id
	);

	INSERT INTO expectedYellowCardTable (match_id, time, person_id)
	VALUES (4, 61, 3)

    -- Assert
	EXEC tSQLt.AssertEqualsTable @Expected='expectedYellowCardTable', @Actual='yellow_card'
END
GO

EXEC tsqlt.run [test_PROC_ADD_MATCHDATA.test_PROC_ADD_MATCHDATA_Add_Yellow_Card_No_Exception]
GO


/*
	Procedure: Add Pass
 */
CREATE OR ALTER PROCEDURE [test_PROC_ADD_MATCHDATA].[test_PROC_ADD_MATCHDATA_Add_Pass_No_Exception]
AS
BEGIN
    -- Act
	EXEC PROC_ADD_MATCHDATA_PASS 21, 41, 6, 0;
	EXEC tSQLt.ExpectNoException;

	CREATE TABLE expectedPassTable (
	    match_id g_identity,
	    time minute_in_match,
	    person_id person_id,
	    succes boolean
	);

	INSERT INTO expectedPassTable (match_id, time, person_id, succes)
	VALUES (21, 41, 6, 0)

    -- Assert
	EXEC tSQLt.AssertEqualsTable @Expected='expectedPassTable', @Actual='pass'
END
GO

EXEC tsqlt.run [test_PROC_ADD_MATCHDATA.test_PROC_ADD_MATCHDATA_Add_Pass_No_Exception]
GO


/*
	Procedure: Add Goal
 */
CREATE OR ALTER PROCEDURE [test_PROC_ADD_MATCHDATA].[test_PROC_ADD_MATCHDATA_Add_Goal_No_Exception]
AS
BEGIN
    -- Act
	EXEC PROC_ADD_MATCHDATA_GOAL 52, 77, 2;
	EXEC tSQLt.ExpectNoException;

	CREATE TABLE expectedGoalTable (
	    match_id g_identity,
	    time minute_in_match,
	    person_id person_id
	);

	INSERT INTO expectedGoalTable (match_id, time, person_id)
	VALUES (52, 77, 2)

    -- Assert
	EXEC tSQLt.AssertEqualsTable @Expected='expectedGoalTable', @Actual='goal'
END
GO

EXEC tsqlt.run [test_PROC_ADD_MATCHDATA.test_PROC_ADD_MATCHDATA_Add_Goal_No_Exception]
GO


/*
	Procedure: Add Shot
 */
CREATE OR ALTER PROCEDURE [test_PROC_ADD_MATCHDATA].[test_PROC_ADD_MATCHDATA_Add_Shot_No_Exception]
AS
BEGIN
    -- Act
	EXEC PROC_ADD_MATCHDATA_SHOT 63, 87, 41, 1;
	EXEC tSQLt.ExpectNoException;

	CREATE TABLE expectedShotTable (
	    match_id g_identity,
	    time minute_in_match,
	    person_id person_id,
	    on_goal boolean
	);

	INSERT INTO expectedShotTable (match_id, time, person_id, on_goal)
	VALUES (63, 87, 41, 1)

    -- Assert
	EXEC tSQLt.AssertEqualsTable @Expected='expectedShotTable', @Actual='shot'
END
GO

EXEC tsqlt.run [test_PROC_ADD_MATCHDATA.test_PROC_ADD_MATCHDATA_Add_Shot_No_Exception]
GO


/*
	Procedure: Add Foul
 */
CREATE OR ALTER PROCEDURE [test_PROC_ADD_MATCHDATA].[test_PROC_ADD_MATCHDATA_Add_Foul_No_Exception]
AS
BEGIN
    -- Act
	EXEC PROC_ADD_MATCHDATA_FOUL 92, 74, 63;
	EXEC tSQLt.ExpectNoException;

	CREATE TABLE expectedFoulTable (
	    match_id g_identity,
	    time minute_in_match,
	    person_id person_id
	);

	INSERT INTO expectedFoulTable (match_id, time, person_id)
	VALUES (92, 74, 63)

    -- Assert
	EXEC tSQLt.AssertEqualsTable @Expected='expectedFoulTable', @Actual='foul'
END
GO

EXEC tsqlt.run [test_PROC_ADD_MATCHDATA.test_PROC_ADD_MATCHDATA_Add_Foul_No_Exception]
GO


/*
	Procedure: Add Corner
 */
CREATE OR ALTER PROCEDURE [test_PROC_ADD_MATCHDATA].[test_PROC_ADD_MATCHDATA_Add_Corner_No_Exception]
AS
BEGIN
    -- Act
	EXEC PROC_ADD_MATCHDATA_CORNER 88, 4, 61;
	EXEC tSQLt.ExpectNoException;

	CREATE TABLE expectedCornerTable (
	    match_id g_identity,
	    time minute_in_match,
	    person_id person_id
	);

	INSERT INTO expectedCornerTable (match_id, time, person_id)
	VALUES (88, 4, 61)

    -- Assert
	EXEC tSQLt.AssertEqualsTable @Expected='expectedCornerTable', @Actual='corner'
END
GO

EXEC tsqlt.run [test_PROC_ADD_MATCHDATA.test_PROC_ADD_MATCHDATA_Add_Corner_No_Exception]
GO


/*
	Procedure: Add Substitute
 */
CREATE OR ALTER PROCEDURE [test_PROC_ADD_MATCHDATA].[test_PROC_ADD_MATCHDATA_Add_Substitute_No_Exception]
AS
BEGIN
    -- Act
	EXEC PROC_ADD_MATCHDATA_SUBSTITUTE 14, 73, 61, 77;
	EXEC tSQLt.ExpectNoException;

	CREATE TABLE expectedSubstituteTable (
	    match_id g_identity,
	    time minute_in_match,
	    in_person_id person_id,
	    out_person_id person_id
	);

	INSERT INTO expectedSubstituteTable (match_id, time, in_person_id, out_person_id)
	VALUES (14, 73, 61, 77)

    -- Assert
	EXEC tSQLt.AssertEqualsTable @Expected='expectedSubstituteTable', @Actual='substitute'
END
GO

EXEC tsqlt.run [test_PROC_ADD_MATCHDATA.test_PROC_ADD_MATCHDATA_Add_Substitute_No_Exception]
GO
