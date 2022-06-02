EXEC tSQLt.NewTestClass 'test_TRG_ONE_COACH_PER_CLUB';
GO

CREATE OR ALTER PROCEDURE [test_TRG_ONE_COACH_PER_CLUB].[test_TRG_ONE_COACH_PER_CLUB_Exception]
AS
BEGIN
	-- Assemble:
	EXEC tSQLt.FakeTable 'Club';

	INSERT INTO Club([CLUB_NAME], [STADIUM_NAME], [COUNTRY_NAME], [CITY_NAME], [COACH_PERSON_ID])
	VALUES ('Trabzonspor', 'Senol Gunesstadion', 'Turkey', 'Trabzon', 1),
		   ('Galatasaray', 'Turk Telekom Arena', 'Turkey', 'Istanbul', 2)
	EXEC tSQLt.ApplyTrigger 'Club', 'TRG_ONE_COACH_PER_CLUB';

	-- Expect:
	EXEC tSQLt.ExpectException @ExpectedMessage = 'Coach may only have one team!'

	-- Act:
	INSERT INTO Club([CLUB_NAME], [STADIUM_NAME], [COUNTRY_NAME], [CITY_NAME], [COACH_PERSON_ID])
	VALUES ('Ajax', 'Johan Cruijff ArenA', 'The Netherlands', 'Amsterdam', 2)
END
GO

EXEC tSQLt.Run [test_TRG_ONE_COACH_PER_CLUB.test_TRG_ONE_COACH_PER_CLUB_Exception]
GO

CREATE OR ALTER PROCEDURE [test_TRG_ONE_COACH_PER_CLUB].[test_TRG_ONE_COACH_PER_CLUB_NoException]
AS
BEGIN
	-- Assemble:
	EXEC tSQLt.FakeTable 'Club';

	INSERT INTO Club([CLUB_NAME], [STADIUM_NAME], [COUNTRY_NAME], [CITY_NAME], [COACH_PERSON_ID])
	VALUES ('Trabzonspor', 'Senol Gunesstadion', 'Turkey', 'Trabzon', 1),
		   ('Galatasaray', 'Turk Telekom Arena', 'Turkey', 'Istanbul', 2)
	EXEC tSQLt.ApplyTrigger 'Club', 'TRG_ONE_COACH_PER_CLUB';

	-- Expect:
	EXEC tSQLt.ExpectNoException;

	-- Act:
	INSERT INTO Club([CLUB_NAME], [STADIUM_NAME], [COUNTRY_NAME], [CITY_NAME], [COACH_PERSON_ID])
	VALUES ('Ajax', 'Johan Cruijff ArenA', 'The Netherlands', 'Amsterdam', 3)
END
GO

EXEC tSQLt.Run [test_TRG_ONE_COACH_PER_CLUB.test_TRG_ONE_COACH_PER_CLUB_NoException]
GO
