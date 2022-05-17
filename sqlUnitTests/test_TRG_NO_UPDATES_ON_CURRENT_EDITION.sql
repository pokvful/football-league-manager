EXEC tSQLt.NewTestClass 'test_IR16_CurrentEditionChanges'
GO

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges ].[Test that checks if changes get prevented in season during a current edition FAILING]
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

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges ].[Test that checks if changes get prevented in season during a current edition PASSING]
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

CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges ].[Test that checks if changes get prevented in CLUB during a current edition FAILING]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.CLUB';
	EXEC tSQLt.FakeTable @TableName='dbo.CLUB_PLAYS_IN_EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.EDITION';
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';

	INSERT INTO CLUB (CLUB_NAME, STADIUM_NAME)
	VALUES ('Ajax', 'Amsterdam ArenA')

	INSERT INTO CLUB_PLAYS_IN_EDITION (CLUB_NAME, SEASON_NAME)
	VALUES ('Ajax', '21/22')

	INSERT INTO EDITION (SEASON_NAME)
	VALUES ('21/22')

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

