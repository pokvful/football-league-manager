EXECUTE tSQLt.NewTestClass 'test_TRG_MAX_16_CLUBS_KNOCKOUT';
GO

CREATE OR ALTER PROCEDURE test_TRG_MAX_16_CLUBS_KNOCKOUT.SETUP -- {{{
AS
BEGIN
	EXECUTE tSQLt.FakeTable 'dbo.COMPETITION';
	EXECUTE tSQLt.FakeTable 'dbo.CLUB_PLAYS_IN_EDITION';

	INSERT INTO dbo.COMPETITION (COMPETITION_NAME, COMPETITION_TYPE)
		VALUES ('MooieCompetitie', 'Knockout'),
			('AndereMooieCompetitie', 'Knockout'),
			('GeenKnockoutCompetitie', 'Iets Anders');

	EXECUTE tSQLt.ApplyTrigger 'dbo.CLUB_PLAYS_IN_EDITION', 'TRG_MAX_16_CLUBS_KNOCKOUT';
END
GO --}}}

CREATE OR ALTER PROCEDURE test_TRG_MAX_16_CLUBS_KNOCKOUT.[test TRG_MAX_16_CLUBS_KNOCKOUT does not block club insertion on 16 per club] -- {{{
AS
BEGIN
	EXECUTE tSQLt.ExpectNoException;

	INSERT INTO CLUB_PLAYS_IN_EDITION (CLUB_NAME, COMPETITION_NAME, SEASON_NAME)
		VALUES
			('Club1',  'MooieCompetitie',       'SEAS1'),
			('Club2',  'MooieCompetitie',       'SEAS1'),
			('Club3',  'MooieCompetitie',       'SEAS1'),
			('Club4',  'MooieCompetitie',       'SEAS1'),
			('Club5',  'MooieCompetitie',       'SEAS1'),
			('Club6',  'MooieCompetitie',       'SEAS1'),
			('Club7',  'MooieCompetitie',       'SEAS1'),
			('Club8',  'MooieCompetitie',       'SEAS1'),
			('Club9',  'MooieCompetitie',       'SEAS1'),
			('Club10', 'MooieCompetitie',       'SEAS1'),
			('Club11', 'MooieCompetitie',       'SEAS1'),
			('Club12', 'MooieCompetitie',       'SEAS1'),
			('Club13', 'MooieCompetitie',       'SEAS1'),
			('Club14', 'MooieCompetitie',       'SEAS1'),
			('Club15', 'MooieCompetitie',       'SEAS1'),
			('Club16', 'MooieCompetitie',       'SEAS1'),
			('Club1',  'AndereMooieCompetitie', 'SEAS2'),
			('Club2',  'AndereMooieCompetitie', 'SEAS2'),
			('Club3',  'AndereMooieCompetitie', 'SEAS2'),
			('Club4',  'AndereMooieCompetitie', 'SEAS2'),
			('Club5',  'AndereMooieCompetitie', 'SEAS2'),
			('Club6',  'AndereMooieCompetitie', 'SEAS2'),
			('Club7',  'AndereMooieCompetitie', 'SEAS2'),
			('Club8',  'AndereMooieCompetitie', 'SEAS2'),
			('Club9',  'AndereMooieCompetitie', 'SEAS2'),
			('Club10', 'AndereMooieCompetitie', 'SEAS2'),
			('Club11', 'AndereMooieCompetitie', 'SEAS2'),
			('Club12', 'AndereMooieCompetitie', 'SEAS2'),
			('Club13', 'AndereMooieCompetitie', 'SEAS2'),
			('Club14', 'AndereMooieCompetitie', 'SEAS2'),
			('Club15', 'AndereMooieCompetitie', 'SEAS2'),
			('Club16', 'AndereMooieCompetitie', 'SEAS2');

END;
GO -- }}}

CREATE OR ALTER PROCEDURE test_TRG_MAX_16_CLUBS_KNOCKOUT.[test TRG_MAX_16_CLUBS_KNOCKOUT does block club insertion on 16 per club] -- {{{
AS
BEGIN
	EXECUTE tSQLt.ExpectException 'Can only insert 16 clubs per Knockout competition';

	INSERT INTO CLUB_PLAYS_IN_EDITION (CLUB_NAME, COMPETITION_NAME, SEASON_NAME)
		VALUES
			('Club1',  'MooieCompetitie',       'SEAS1'),
			('Club2',  'MooieCompetitie',       'SEAS1'),
			('Club3',  'MooieCompetitie',       'SEAS1'),
			('Club4',  'MooieCompetitie',       'SEAS1'),
			('Club5',  'MooieCompetitie',       'SEAS1'),
			('Club6',  'MooieCompetitie',       'SEAS1'),
			('Club7',  'MooieCompetitie',       'SEAS1'),
			('Club8',  'MooieCompetitie',       'SEAS1'),
			('Club9',  'MooieCompetitie',       'SEAS1'),
			('Club10', 'MooieCompetitie',       'SEAS1'),
			('Club11', 'MooieCompetitie',       'SEAS1'),
			('Club12', 'MooieCompetitie',       'SEAS1'),
			('Club13', 'MooieCompetitie',       'SEAS1'),
			('Club14', 'MooieCompetitie',       'SEAS1'),
			('Club15', 'MooieCompetitie',       'SEAS1'),
			('Club16', 'MooieCompetitie',       'SEAS1'),
			('Club1',  'AndereMooieCompetitie', 'SEAS2'),
			('Club2',  'AndereMooieCompetitie', 'SEAS2'),
			('Club3',  'AndereMooieCompetitie', 'SEAS2'),
			('Club4',  'AndereMooieCompetitie', 'SEAS2'),
			('Club5',  'AndereMooieCompetitie', 'SEAS2'),
			('Club6',  'AndereMooieCompetitie', 'SEAS2'),
			('Club7',  'AndereMooieCompetitie', 'SEAS2'),
			('Club8',  'AndereMooieCompetitie', 'SEAS2'),
			('Club9',  'AndereMooieCompetitie', 'SEAS2'),
			('Club10', 'AndereMooieCompetitie', 'SEAS2'),
			('Club11', 'AndereMooieCompetitie', 'SEAS2'),
			('Club12', 'AndereMooieCompetitie', 'SEAS2'),
			('Club13', 'AndereMooieCompetitie', 'SEAS2'),
			('Club14', 'AndereMooieCompetitie', 'SEAS2'),
			('Club15', 'AndereMooieCompetitie', 'SEAS2'),
			('Club16', 'AndereMooieCompetitie', 'SEAS2'),
			('Club17', 'AndereMooieCompetitie', 'SEAS2'),
			('Club18', 'AndereMooieCompetitie', 'SEAS2');
END;
GO -- }}}

CREATE OR ALTER PROCEDURE test_TRG_MAX_16_CLUBS_KNOCKOUT.[test TRG_MAX_16_CLUBS_KNOCKOUT does not block club insertion when competition is not a Knockout] -- {{{
AS
BEGIN
	EXECUTE tSQLt.ExpectNoException;

	INSERT INTO CLUB_PLAYS_IN_EDITION (CLUB_NAME, COMPETITION_NAME, SEASON_NAME)
		VALUES
			('Club1', 'GeenKnockoutCompetitie', 'SEAS1'),
			('Club2', 'GeenKnockoutCompetitie', 'SEAS1'),
			('Club1', 'GeenKnockoutCompetitie', 'SEAS2'),
			('Club2', 'GeenKnockoutCompetitie', 'SEAS2'),
			('Club3', 'GeenKnockoutCompetitie', 'SEAS2'),
			('Club4', 'GeenKnockoutCompetitie', 'SEAS2');
END
GO -- }}}

EXECUTE tSQLt.Run 'test_TRG_MAX_16_CLUBS_KNOCKOUT';
GO
