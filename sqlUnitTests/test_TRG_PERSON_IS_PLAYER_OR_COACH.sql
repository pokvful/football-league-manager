EXEC tSQLt.NewTestClass 'test_TRG_PERSON_IS_PLAYER_OR_COACH';

CREATE OR ALTER PROCEDURE [test_TRG_PERSON_IS_PLAYER_OR_COACH].[test_TRG_PERSON_IS_PLAYER_OR_COACH_Exception]
AS
BEGIN
	-- Assemble:
	EXEC tSQLt.FakeTable 'PERSON';
	EXEC tSQLt.FakeTable 'REFEREE';
	EXEC tSQLt.FakeTable 'YELLOW_CARD';

	INSERT INTO PERSON([PERSON_ID], [COUNTRY_NAME], [FIRST_NAME], [LAST_NAME], [MIDDLE_NAME], [BIRTH_DATE])
	VALUES (1, 'Nederland', 'Oktay', 'Soyturk', null, '1999-05-24'),
		   (2, 'Nederland', 'Yatko', 'Krutyos', null, '1999-05-31');

	INSERT INTO REFEREE([PERSON_ID])
	VALUES (1);

	EXEC tSQLt.ApplyTrigger 'YELLOW_CARD', 'TRG_PERSON_IS_PLAYER_OR_COACH';

	-- Expect:
	EXEC tSQLt.ExpectException @ExpectedMessage = 'Referee can not have a yellow card!';

	-- Act:
	INSERT INTO YELLOW_CARD([MATCH_ID], [TIME], [PERSON_ID])
	VALUES (1, 15, 1);
END
GO

EXEC tSQLt.Run [test_TRG_PERSON_IS_PLAYER_OR_COACH.test_TRG_PERSON_IS_PLAYER_OR_COACH_Exception]
GO

CREATE OR ALTER PROCEDURE [test_TRG_PERSON_IS_PLAYER_OR_COACH].[test_TRG_PERSON_IS_PLAYER_OR_COACH_NoException]
AS
BEGIN
	-- Assemble:
	EXEC tSQLt.FakeTable 'PERSON';
	EXEC tSQLt.FakeTable 'REFEREE';
	EXEC tSQLt.FakeTable 'YELLOW_CARD';

	INSERT INTO PERSON([PERSON_ID], [COUNTRY_NAME], [FIRST_NAME], [LAST_NAME], [MIDDLE_NAME], [BIRTH_DATE])
	VALUES (1, 'Nederland', 'Oktay', 'Soyturk', null, '1999-05-24'),
		   (2, 'Nederland', 'Yatko', 'Krutyos', null, '1999-05-31');

	INSERT INTO REFEREE([PERSON_ID])
	VALUES (1);

	EXEC tSQLt.ApplyTrigger 'YELLOW_CARD', 'TRG_PERSON_IS_PLAYER_OR_COACH';

	-- Expect:
	EXEC tSQLt.ExpectNoException;

	-- Act:
	INSERT INTO YELLOW_CARD([MATCH_ID], [TIME], [PERSON_ID])
	VALUES (1, 15, 2); -- Test with Yatko
END
GO

EXEC tSQLt.Run [test_TRG_PERSON_IS_PLAYER_OR_COACH.test_TRG_PERSON_IS_PLAYER_OR_COACH_NoException]
GO
