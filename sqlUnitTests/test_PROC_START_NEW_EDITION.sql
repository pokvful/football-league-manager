EXECUTE tSQLt.NewTestClass 'test_START_NEW_EDITION_KO';
GO

CREATE OR ALTER PROCEDURE test_START_NEW_EDITION_KO.SETUP -- {{{
AS
BEGIN
	EXECUTE tSQLt.FakeTable 'dbo.SEASON';
	EXECUTE tSQLt.FakeTable 'dbo.COMPETITION';
	EXECUTE tSQLt.FakeTable 'dbo.EDITION';
	EXECUTE tSQLt.FakeTable 'dbo.ROUND';
	EXECUTE tSQLt.FakeTable 'dbo.MATCHDAY';
	EXECUTE tSQLt.FakeTable 'dbo.CLUB_PLAYS_IN_EDITION';
	EXECUTE tSQLt.FakeTable 'dbo.MATCH';
	EXECUTE tSQLt.FakeTable 'dbo.REFEREE';

	CREATE TABLE test_START_NEW_EDITION_KO.expected (
		MATCH_ID G_IDENTITY identity,
		SEASON_NAME SEASON_NAME,
		COMPETITION_NAME COMPETITION_NAME,
		START_DATE _DATE_,
		MATCH_DAY _DATE_,
		HOME_CLUB_NAME CLUB_NAME,
		OUT_CLUB_NAME CLUB_NAME,
		STADIUM_NAME STADIUM_NAME,
		REFEREE_PERSON_ID PERSON_ID,
		BRACKET_RIGHT G_IDENTITY,
		BRACKET_LEFT G_IDENTITY,
		MATCH_TYPE COMPETITION_TYPE,
		BALL_POSSESSION_HOME PERCENTAGE,
		BALL_POSSESSION_OUT PERCENTAGE,
		SPECTATORS [COUNT]
	);

	INSERT INTO SEASON (SEASON_NAME, SEASON_START, SEASON_END)
		VALUES ('22/23', '2022-01-01', '2022-10-01');

	INSERT INTO COMPETITION (COMPETITION_NAME, COMPETITION_TYPE)
		VALUES ('MooieCompetitie', 'Knockout');
END
GO -- }}}

CREATE OR ALTER PROCEDURE test_START_NEW_EDITION_KO.[test all matches get created] -- {{{
AS
BEGIN
	DECLARE @expected_count INT = 8;

	DECLARE @club_list clubNamesTable;

	INSERT INTO @club_list (club_name)
		VALUES
			('Club1'),
			('Club2'),
			('Club3'),
			('Club4'),
			('Club5'),
			('Club6'),
			('Club7'),
			('Club8'),
			('Club9'),
			('Club10'),
			('Club11'),
			('Club12'),
			('Club13'),
			('Club14'),
			('Club15'),
			('Club16');

	EXECUTE START_NEW_EDITION_KO
		@competitionname = 'MooieCompetitie',
		@seasonname = '2022-01-01',
		@listofclubs = @club_list,
		@startDateCompetition = '2022-01-01';

	DECLARE @actual_count INT = (SELECT COUNT(*) FROM MATCH);

	EXECUTE tSQLt.AssertEquals @expected_count, @actual_count;
END
GO -- }}}

EXECUTE tSQLt.Run 'test_START_NEW_EDITION_KO';
GO

