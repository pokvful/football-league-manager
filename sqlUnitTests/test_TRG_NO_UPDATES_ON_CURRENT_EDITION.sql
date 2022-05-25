EXEC tSQLt.NewTestClass 'test_IR16_CurrentEditionChanges'
GO

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in season during a current edition FAILING]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('21/22', DATEADD(year, -1, GETDATE()), DATEADD(year, 1, GETDATE()))

	EXEC tSQLt.ApplyTrigger 'dbo.SEASON', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_SEASON';

	EXEC tSQLt.ExpectException;

	UPDATE SEASON
	SET SEASON_NAME = '50/51'
	WHERE SEASON_NAME = '21/22'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in season during a current edition FAILING]'
GO

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in season during a current edition PASSING]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('19/20', DATEADD(year, -6, GETDATE()), DATEADD(year, -7, GETDATE()))

	EXEC tSQLt.ApplyTrigger 'SEASON', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_SEASON';

	EXEC tSQLt.ExpectNoException;

	UPDATE SEASON
	SET SEASON_NAME = '50/51'
	WHERE SEASON_NAME = '19/20'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in season during a current edition PASSING]'
GO

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in CLUB during a current edition FAILING]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.CLUB';
	EXEC tSQLt.FakeTable @TableName='dbo.CLUB_PLAYS_IN_EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';

	INSERT INTO CLUB (CLUB_NAME, STADIUM_NAME)
	VALUES ('Ajax', 'Amsterdam ArenA')

	INSERT INTO CLUB_PLAYS_IN_EDITION (CLUB_NAME, SEASON_NAME, COMPETITION_NAME)
	VALUES ('Ajax', '21/22', 'Eredivisie')

	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
	VALUES ('21/22', 'Eredivisie')

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('21/22', DATEADD(year, -1, GETDATE()), DATEADD(year, 1, GETDATE()))

	EXEC tSQLt.ApplyTrigger 'dbo.CLUB', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_CLUB';

	EXEC tSQLt.ApplyConstraint 'dbo.CLUB_PLAYS_IN_EDITION', 'FK_CLUB_PLA_CLUB_PLAY_CLUB'
	EXEC tSQLt.ApplyConstraint 'dbo.CLUB_PLAYS_IN_EDITION', 'FK_CLUB_PLA_CLUB_PLAY_EDITION'
	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_I_SEASON'

	EXEC tSQLt.ExpectException;

	UPDATE CLUB
    SET STADIUM_NAME = 'Johan Cruyf Arena'
    WHERE CLUB_NAME = 'Ajax'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in CLUB during a current edition FAILING]'
GO

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in CLUB during a current edition PASSING]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.CLUB';
	EXEC tSQLt.FakeTable @TableName='dbo.CLUB_PLAYS_IN_EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';

	INSERT INTO CLUB (CLUB_NAME, STADIUM_NAME)
	VALUES ('Ajax', 'Amsterdam ArenA')

	INSERT INTO CLUB_PLAYS_IN_EDITION (CLUB_NAME, SEASON_NAME, COMPETITION_NAME)
	VALUES ('Ajax', '24/25', 'Eredivisie')

	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
	VALUES ('24/25', 'Eredivisie')

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('24/25', '01-01-2024', '01-01-2025')

	EXEC tSQLt.ApplyTrigger 'dbo.CLUB', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_CLUB';

	EXEC tSQLt.ApplyConstraint 'dbo.CLUB_PLAYS_IN_EDITION', 'FK_CLUB_PLA_CLUB_PLAY_CLUB'
	EXEC tSQLt.ApplyConstraint 'dbo.CLUB_PLAYS_IN_EDITION', 'FK_CLUB_PLA_CLUB_PLAY_EDITION'
	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_I_SEASON'

	EXEC tSQLt.ExpectNoException;

	UPDATE CLUB
    SET STADIUM_NAME = 'Johan Cruyf Arena'
    WHERE CLUB_NAME = 'Ajax'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in CLUB during a current edition PASSING]'
GO

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in MATCH during a current edition PASSING CURRENT SEASON]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.MATCH';
	EXEC tSQLt.FakeTable @TableName='dbo.MATCHDAY';
	EXEC tSQLt.FakeTable @TableName='dbo.ROUND';
	EXEC tSQLt.FakeTable @TableName='dbo.EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';

	INSERT INTO MATCH (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY, HOME_CLUB_NAME, STADIUM_NAME)
	VALUES ('99/99', 'Eredivisie', '09-09-2099', '09-09-2099', 'Ajax', 'ArenA')

	INSERT INTO MATCHDAY (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
	VALUES ('99/99', 'Eredivisie', '09-09-2099', '09-09-2099')

	INSERT INTO ROUND (SEASON_NAME, COMPETITION_NAME, START_DATE)
	VALUES ('99/99', 'Eredivisie', '09-09-2099')

	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
	VALUES ('99/99', 'Eredivisie')

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('99/99', DATEADD(year, 98, GETDATE()), DATEADD(year, 99, GETDATE()))

	EXEC tSQLt.ApplyTrigger 'dbo.MATCH', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_MATCH';

	EXEC tSQLt.ApplyConstraint 'dbo.MATCH', 'FK_MATCH_MATCH_IN__MATCHDAY'
	EXEC tSQLt.ApplyConstraint 'dbo.MATCHDAY', 'FK_MATCHDAY_MATCHDAY__ROUND'
	EXEC tSQLt.ApplyConstraint 'dbo.ROUND', 'FK_ROUND_ROUND_IN__EDITION'
	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_I_SEASON'

	EXEC tSQLt.ExpectNoException;

	UPDATE MATCH
    SET STADIUM_NAME = 'Grolsch Veste'
    WHERE HOME_CLUB_NAME = 'Ajax'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in MATCH during a current edition PASSING CURRENT SEASON]'
GO

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in MATCH during a current edition FAILING CURRENT SEASON]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.MATCH';
	EXEC tSQLt.FakeTable @TableName='dbo.MATCHDAY';
	EXEC tSQLt.FakeTable @TableName='dbo.ROUND';
	EXEC tSQLt.FakeTable @TableName='dbo.EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';

	INSERT INTO MATCH (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY, HOME_CLUB_NAME, STADIUM_NAME)
	VALUES ('22/23', 'Eredivisie', '02-02-2022', '02-02-2022', 'Ajax', 'ArenA')

	INSERT INTO MATCHDAY (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
	VALUES ('22/23', 'Eredivisie', '02-02-2022', '02-02-2022')

	INSERT INTO ROUND (SEASON_NAME, COMPETITION_NAME, START_DATE)
	VALUES ('22/23', 'Eredivisie', '02-02-2022')

	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
	VALUES ('22/23', 'Eredivisie')

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('22/23', DATEADD(year, -1, GETDATE()), DATEADD(year, 1, GETDATE()))

	EXEC tSQLt.ApplyTrigger 'dbo.MATCH', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_MATCH';

	EXEC tSQLt.ApplyConstraint 'dbo.MATCH', 'FK_MATCH_MATCH_IN__MATCHDAY'
	EXEC tSQLt.ApplyConstraint 'dbo.MATCHDAY', 'FK_MATCHDAY_MATCHDAY__ROUND'
	EXEC tSQLt.ApplyConstraint 'dbo.ROUND', 'FK_ROUND_ROUND_IN__EDITION'
	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_I_SEASON'

	EXEC tSQLt.ExpectException;

	UPDATE MATCH
    SET STADIUM_NAME = 'Grolsch Veste'
    WHERE HOME_CLUB_NAME = 'Ajax'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in MATCH during a current edition FAILING CURRENT SEASON]'
GO

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in MATCH during a current edition PASSING ALTERABLE COLUMN]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.MATCH';
	EXEC tSQLt.FakeTable @TableName='dbo.MATCHDAY';
	EXEC tSQLt.FakeTable @TableName='dbo.ROUND';
	EXEC tSQLt.FakeTable @TableName='dbo.EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';


	INSERT INTO MATCH (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY, HOME_CLUB_NAME, BALL_POSSESSION_HOME)
	VALUES ('21/22', 'Eredivisie', '02-02-2021', '02-02-2021', 'Ajax', null)

	INSERT INTO MATCHDAY (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
	VALUES ('21/22', 'Eredivisie', '02-02-2021', '02-02-2021')

	INSERT INTO ROUND (SEASON_NAME, COMPETITION_NAME, START_DATE)
	VALUES ('21/22', 'Eredivisie', '02-02-2021')

	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
	VALUES ('21/22', 'Eredivisie')

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('21/22', DATEADD(YEAR, -1, GETDATE()), DATEADD(YEAR, 1, GETDATE()))

	EXEC tSQLt.ApplyTrigger 'dbo.MATCH', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_MATCH';

	EXEC tSQLt.ApplyConstraint 'dbo.MATCH', 'FK_MATCH_MATCH_IN__MATCHDAY'
	EXEC tSQLt.ApplyConstraint 'dbo.MATCHDAY', 'FK_MATCHDAY_MATCHDAY__ROUND'
	EXEC tSQLt.ApplyConstraint 'dbo.ROUND', 'FK_ROUND_ROUND_IN__EDITION'
	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_I_SEASON'

	EXEC tSQLt.ExpectNoException;

	UPDATE MATCH
    SET BALL_POSSESSION_HOME = 50
    WHERE HOME_CLUB_NAME = 'Ajax'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in MATCH during a current edition PASSING ALTERABLE COLUMN]'
GO

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in MATCH during a current edition FAILING ON DELETE]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.MATCH';
	EXEC tSQLt.FakeTable @TableName='dbo.MATCHDAY';
	EXEC tSQLt.FakeTable @TableName='dbo.ROUND';
	EXEC tSQLt.FakeTable @TableName='dbo.EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';


	INSERT INTO MATCH (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY, HOME_CLUB_NAME)
	VALUES ('21/22', 'Eredivisie', '02-02-2021', '02-02-2021', 'Ajax')

	INSERT INTO MATCHDAY (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
	VALUES ('21/22', 'Eredivisie', '02-02-2021', '02-02-2021')

	INSERT INTO ROUND (SEASON_NAME, COMPETITION_NAME, START_DATE)
	VALUES ('21/22', 'Eredivisie', '02-02-2021')

	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
	VALUES ('21/22', 'Eredivisie')

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('21/22', DATEADD(YEAR, -1, GETDATE()), DATEADD(YEAR, 1, GETDATE()))

	EXEC tSQLt.ApplyTrigger 'dbo.MATCH', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_MATCH';

	EXEC tSQLt.ApplyConstraint 'dbo.MATCH', 'FK_MATCH_MATCH_IN__MATCHDAY'
	EXEC tSQLt.ApplyConstraint 'dbo.MATCHDAY', 'FK_MATCHDAY_MATCHDAY__ROUND'
	EXEC tSQLt.ApplyConstraint 'dbo.ROUND', 'FK_ROUND_ROUND_IN__EDITION'
	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_I_SEASON'

	EXEC tSQLt.ExpectException;

	DELETE FROM MATCH WHERE HOME_CLUB_NAME = 'Ajax'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in MATCH during a current edition FAILING ON DELETE]'
GO

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in MATCH during a current edition FAILING ON UPDATE]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.MATCH';
	EXEC tSQLt.FakeTable @TableName='dbo.MATCHDAY';
	EXEC tSQLt.FakeTable @TableName='dbo.ROUND';
	EXEC tSQLt.FakeTable @TableName='dbo.EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';


	INSERT INTO MATCH (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY, HOME_CLUB_NAME, BALL_POSSESSION_HOME)
	VALUES ('21/22', 'Eredivisie', '02-02-2021', '02-02-2021', 'Ajax', 50)

	INSERT INTO MATCHDAY (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
	VALUES ('21/22', 'Eredivisie', '02-02-2021', '02-02-2021')

	INSERT INTO ROUND (SEASON_NAME, COMPETITION_NAME, START_DATE)
	VALUES ('21/22', 'Eredivisie', '02-02-2021')

	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
	VALUES ('21/22', 'Eredivisie')

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('21/22', DATEADD(YEAR, -1, GETDATE()), DATEADD(YEAR, 1, GETDATE()))

	EXEC tSQLt.ApplyTrigger 'dbo.MATCH', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_MATCH';

	EXEC tSQLt.ApplyConstraint 'dbo.MATCH', 'FK_MATCH_MATCH_IN__MATCHDAY'
	EXEC tSQLt.ApplyConstraint 'dbo.MATCHDAY', 'FK_MATCHDAY_MATCHDAY__ROUND'
	EXEC tSQLt.ApplyConstraint 'dbo.ROUND', 'FK_ROUND_ROUND_IN__EDITION'
	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_I_SEASON'

	EXEC tSQLt.ExpectException;

	UPDATE MATCH
	SET BALL_POSSESSION_HOME = 20
	WHERE HOME_CLUB_NAME = 'Ajax'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in MATCH during a current edition FAILING ON UPDATE]'
GO

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in COMPETITION during a current edition FAILING]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.COMPETITION'
	EXEC tSQLt.FakeTable @TableName='dbo.EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';

	INSERT INTO COMPETITION (COMPETITION_NAME)
	VALUES ('Eredivisie')

	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
	VALUES ('21/22', 'Eredivisie')

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('21/22', DATEADD(year, -1, GETDATE()), DATEADD(year, 1, GETDATE()))

	EXEC tSQLt.ApplyTrigger 'dbo.COMPETITION', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_COMPETITION';

	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_O_COMPETIT'
	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_I_SEASON'

	EXEC tSQLt.ExpectException;

	UPDATE COMPETITION
    SET COMPETITION_NAME = 'Jupiler League'
    WHERE COMPETITION_NAME = 'Eredivisie'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in COMPETITION during a current edition FAILING]'
GO

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in COMPETITION during a current edition PASSING]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.COMPETITION'
	EXEC tSQLt.FakeTable @TableName='dbo.EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';

	INSERT INTO COMPETITION (COMPETITION_NAME)
	VALUES ('Eredivisie')

	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
	VALUES ('99/99', 'Eredivisie')

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('99/99', DATEADD(year, 80, GETDATE()), DATEADD(year, 81, GETDATE()))

	EXEC tSQLt.ApplyTrigger 'dbo.COMPETITION', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_COMPETITION';

	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_O_COMPETIT'
	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_I_SEASON'

	EXEC tSQLt.ExpectNoException;

	UPDATE COMPETITION
    SET COMPETITION_NAME = 'Jupiler League'
    WHERE COMPETITION_NAME = 'Eredivisie'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in COMPETITION during a current edition PASSING]'
GO 

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in CLUB_PLAYS_IN_EDITION during a current edition PASSING]
AS
BEGIN

	EXEC tSQLt.FakeTable @TableName='dbo.CLUB_PLAYS_IN_EDITION'
	EXEC tSQLt.FakeTable @TableName='dbo.EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';

	INSERT INTO CLUB_PLAYS_IN_EDITION (CLUB_NAME, SEASON_NAME, COMPETITION_NAME)
	VALUES ('Ajax', '99/99', 'Eredivisie')

	INSERT INTO [EDITION] (SEASON_NAME, COMPETITION_NAME)
	VALUES ('99/99', 'Eredivisie')

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('99/99', DATEADD(year, 80, GETDATE()), DATEADD(year, 81, GETDATE()))

	EXEC tSQLt.ApplyTrigger 'dbo.CLUB_PLAYS_IN_EDITION', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_CIE';

	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_I_SEASON'
	EXEC tSQLt.ApplyConstraint 'dbo.CLUB_PLAYS_IN_EDITION', 'FK_CLUB_PLA_CLUB_PLAY_EDITION'

	EXEC tSQLt.ExpectNoException;

	UPDATE CLUB_PLAYS_IN_EDITION
    SET CLUB_NAME = 'PSV'
    WHERE CLUB_NAME = 'Ajax'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in CLUB_PLAYS_IN_EDITION during a current edition PASSING]'
GO 

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in CLUB_PLAYS_IN_EDITION during a current edition FAILING]
AS
BEGIN

	EXEC tSQLt.FakeTable @TableName='dbo.CLUB_PLAYS_IN_EDITION'
	EXEC tSQLt.FakeTable @TableName='dbo.EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';

	INSERT INTO CLUB_PLAYS_IN_EDITION (CLUB_NAME, SEASON_NAME, COMPETITION_NAME)
	VALUES ('Ajax', '21/22', 'Eredivisie')

	INSERT INTO [EDITION] (SEASON_NAME, COMPETITION_NAME)
	VALUES ('21/22', 'Eredivisie')

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('21/22', DATEADD(year, -1, GETDATE()), DATEADD(year, 1, GETDATE()))

	EXEC tSQLt.ApplyTrigger 'dbo.CLUB_PLAYS_IN_EDITION', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_CIE';

	EXEC tSQLt.ApplyConstraint 'dbo.EDITION', 'FK_EDITION_EDITION_I_SEASON'
	EXEC tSQLt.ApplyConstraint 'dbo.CLUB_PLAYS_IN_EDITION', 'FK_CLUB_PLA_CLUB_PLAY_EDITION'

	EXEC tSQLt.ExpectException;

	UPDATE CLUB_PLAYS_IN_EDITION
    SET CLUB_NAME = 'PSV'
    WHERE CLUB_NAME = 'Ajax'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in CLUB_PLAYS_IN_EDITION during a current edition FAILING]'
GO 

