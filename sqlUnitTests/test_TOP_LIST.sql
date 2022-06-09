EXECUTE tSQLt.NewTestClass 'test_TOP_LIST';
GO

CREATE OR ALTER PROCEDURE test_TOP_LIST.SETUP -- {{{
AS
BEGIN
	EXECUTE tSQLt.FakeTable 'dbo.RED_CARD';
	EXECUTE tSQLt.FakeTable 'dbo.YELLOW_CARD';
	EXECUTE tSQLt.FakeTable 'dbo.PASS';
	EXECUTE tSQLt.FakeTable 'dbo.GOAL';
	EXECUTE tSQLt.FakeTable 'dbo.SHOT';
	EXECUTE tSQLt.FakeTable 'dbo.FOUL';
	EXECUTE tSQLt.FakeTable 'dbo.CORNER';
	EXECUTE tSQLt.FakeTable 'dbo.SUBSTITUTE';
	EXECUTE tSQLt.FakeTable 'dbo.MATCH';
	EXECUTE tSQLt.FakeTable 'dbo.COMPETITION';

	INSERT INTO MATCH (MATCH_ID, COMPETITION_NAME)
		VALUES (1,'21/22'),
			(2,'21/22'),
			(3,'21/22'),
			(10,'21/22'),
			(11,'21/22'),
			(12,'21/22'),
			(20,'21/22'),
			(21,'21/22'),
			(22,'21/22'),
			(30,'21/22'),
			(31,'21/22'),
			(32,'21/22'),
			(40,'21/22'),
			(41,'21/22'),
			(42,'21/22'),
			(50,'21/22'),
			(51,'21/22'),
			(52,'21/22'),
			(60,'21/22'),
			(61,'21/22'),
			(62,'21/22'),
			(70,'21/22'),
			(71,'21/22'),
			(72,'21/22');

	INSERT INTO COMPETITION (COMPETITION_NAME, COMPETITION_TYPE)
		VALUES ('21/22', 'Nationale Competitie');

	INSERT INTO RED_CARD (MATCH_ID, PERSON_ID)
		VALUES (1, 1),
			(1, 1),
			(1, 2),
			(2, 1),
			(2, 2),
			(2, 1),
			(3, 3),
			(3, 1),
			(3, 2);

	INSERT INTO YELLOW_CARD (MATCH_ID, PERSON_ID)
		VALUES (10, 10),
			(10, 10),
			(10, 11),
			(11, 10),
			(11, 11),
			(11, 10),
			(12, 12),
			(12, 10),
			(12, 11),
			(12, 11);

	INSERT INTO PASS (MATCH_ID, PERSON_ID, SUCCES)
		VALUES (20, 20, 1),
			(20, 20, 0),
			(20, 21, 0),
			(20, 21, 1),
			(21, 20, 1),
			(21, 21, 1),
			(21, 22, 0),
			(21, 21, 0),
			(22, 22, 1),
			(22, 20, 1),
			(22, 21, 0);

	INSERT INTO GOAL (MATCH_ID, PERSON_ID)
		VALUES (30, 30),
			(30, 31),
			(30, 32),
			(31, 31),
			(31, 32),
			(31, 31),
			(32, 30),
			(32, 32),
			(32, 30),
			(32, 31);

	INSERT INTO SHOT (MATCH_ID, PERSON_ID, ON_GOAL)
		VALUES (40, 40, 1),
			(40, 41, 0),
			(40, 42, 1),
			(40, 41, 1),
			(41, 40, 0),
			(41, 42, 1),
			(42, 40, 0),
			(42, 42, 1),
			(42, 42, 0);

	INSERT INTO FOUL (MATCH_ID, PERSON_ID)
		VALUES (50, 50),
			(50, 51),
			(50, 52),
			(50, 50),
			(51, 50),
			(51, 52),
			(52, 51),
			(52, 52),
			(52, 52);

	INSERT INTO CORNER (MATCH_ID, PERSON_ID)
		VALUES (60, 60),
			(60, 61),
			(60, 62),
			(61, 60),
			(61, 61),
			(62, 60);

	INSERT INTO SUBSTITUTE (MATCH_ID, OUT_PERSON_ID)
		VALUES (70, 70),
			(70, 71),
			(70, 72),
			(71, 71),
			(71, 72),
			(72, 72);

	DROP TABLE IF EXISTS test_TOP_LIST.expected;
	DROP TABLE IF EXISTS test_TOP_LIST.actual;

	CREATE TABLE test_TOP_LIST.expected (
		[RANK] INT NOT NULL,
		PERSON_ID INT NOT NULL,
		COMPETITION_TYPE varchar(100),
		[COUNT] INT NOT NULL
	);

	CREATE TABLE test_TOP_LIST.actual (
		[RANK] INT NOT NULL,
		PERSON_ID INT NOT NULL,
		COMPETITION_TYPE varchar(100),
		[COUNT] INT NOT NULL
	);
END;
GO -- }}}

CREATE OR ALTER PROCEDURE test_TOP_LIST.[test VW_TOP_LIST_RED_CARD returns the correct values] -- {{{
AS
BEGIN
	INSERT INTO test_TOP_LIST.expected
		VALUES (1, 1, 'Nationale Competitie', 5),
			(2, 2, 'Nationale Competitie', 3),
			(3, 3, 'Nationale Competitie', 1);

	INSERT INTO test_TOP_LIST.actual
		SELECT *
		FROM VW_TOP_LIST_RED_CARD;

	EXECUTE tSQLt.AssertEqualsTable 'test_TOP_LIST.expected', 'test_TOP_LIST.actual';
END;
GO -- }}}

CREATE OR ALTER PROCEDURE test_TOP_LIST.[test VW_TOP_LIST_YELLOW_CARD returns the correct values] -- {{{
AS
BEGIN
	INSERT INTO test_TOP_LIST.expected
		VALUES (1, 10,'Nationale Competitie' , 5),
			(2, 11, 'Nationale Competitie', 4),
			(3, 12, 'Nationale Competitie', 1);

	INSERT INTO test_TOP_LIST.actual
		SELECT *
		FROM VW_TOP_LIST_YELLOW_CARD;

	EXECUTE tSQLt.AssertEqualsTable 'test_TOP_LIST.expected', 'test_TOP_LIST.actual';
END;
GO -- }}}

CREATE OR ALTER PROCEDURE test_TOP_LIST.[test VW_TOP_LIST_PASS returns the correct values] -- {{{
AS
BEGIN
	INSERT INTO test_TOP_LIST.expected
		VALUES (1, 21, 'Nationale Competitie', 5),
			(2, 20, 'Nationale Competitie', 4),
			(3, 22, 'Nationale Competitie', 2);

	INSERT INTO test_TOP_LIST.actual
		SELECT *
		FROM VW_TOP_LIST_PASS;

	EXECUTE tSQLt.AssertEqualsTable 'test_TOP_LIST.expected', 'test_TOP_LIST.actual';
END;
GO -- }}}

CREATE OR ALTER PROCEDURE test_TOP_LIST.[test VW_TOP_LIST_GOAL returns the correct values] -- {{{
AS
BEGIN
	INSERT INTO test_TOP_LIST.expected
		VALUES (1, 31, 'Nationale Competitie', 4),
			(2, 30, 'Nationale Competitie', 3),
			(2, 32, 'Nationale Competitie', 3);

	INSERT INTO test_TOP_LIST.actual
		SELECT *
		FROM VW_TOP_LIST_GOAL;

	EXECUTE tSQLt.AssertEqualsTable 'test_TOP_LIST.expected', 'test_TOP_LIST.actual';
END;
GO -- }}}

CREATE OR ALTER PROCEDURE test_TOP_LIST.[test VW_TOP_LIST_SHOT returns the correct values] -- {{{
AS
BEGIN
	INSERT INTO test_TOP_LIST.expected
		VALUES (1, 42, 'Nationale Competitie', 4),
			(2, 40, 'Nationale Competitie', 3),
			(3, 41, 'Nationale Competitie',2);

	INSERT INTO test_TOP_LIST.actual
		SELECT *
		FROM VW_TOP_LIST_SHOT;

	EXECUTE tSQLt.AssertEqualsTable 'test_TOP_LIST.expected', 'test_TOP_LIST.actual';
END;
GO -- }}}

CREATE OR ALTER PROCEDURE test_TOP_LIST.[test VW_TOP_LIST_FOUL returns the correct values] -- {{{
AS
BEGIN
	INSERT INTO test_TOP_LIST.expected
		VALUES (1, 52, 'Nationale Competitie', 4),
			(2, 50, 'Nationale Competitie', 3),
			(3, 51, 'Nationale Competitie', 2);

	INSERT INTO test_TOP_LIST.actual
		SELECT *
		FROM VW_TOP_LIST_FOUL;

	EXECUTE tSQLt.AssertEqualsTable 'test_TOP_LIST.expected', 'test_TOP_LIST.actual';
END;
GO -- }}}

CREATE OR ALTER PROCEDURE test_TOP_LIST.[test VW_TOP_LIST_CORNER returns the correct values] -- {{{
AS
BEGIN
	INSERT INTO test_TOP_LIST.expected
		VALUES (1, 60, 'Nationale Competitie', 3),
			(2, 61, 'Nationale Competitie', 2),
			(3, 62, 'Nationale Competitie', 1);

	INSERT INTO test_TOP_LIST.actual
		SELECT *
		FROM VW_TOP_LIST_CORNER;

	EXECUTE tSQLt.AssertEqualsTable 'test_TOP_LIST.expected', 'test_TOP_LIST.actual';
END;
GO -- }}}

CREATE OR ALTER PROCEDURE test_TOP_LIST.[test VW_TOP_LIST_SUBSTITUTE returns the correct values] -- {{{
AS
BEGIN
	INSERT INTO test_TOP_LIST.expected
		VALUES (1, 72, 'Nationale Competitie', 3),
			(2, 71, 'Nationale Competitie', 2),
			(3, 70, 'Nationale Competitie', 1);

	INSERT INTO test_TOP_LIST.actual
		SELECT *
		FROM VW_TOP_LIST_SUBSTITUTE;

	EXECUTE tSQLt.AssertEqualsTable 'test_TOP_LIST.expected', 'test_TOP_LIST.actual';
END;
GO -- }}}

EXECUTE tSQLt.Run 'test_TOP_LIST';
GO
