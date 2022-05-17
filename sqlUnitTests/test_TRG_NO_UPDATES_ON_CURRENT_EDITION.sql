EXEC tSQLt.NewTestClass 'test_IR16_CurrentEditionChanges'
GO
CREATE OR ALTER PROCEDURE [test_IR16_CurrentEditionChanges ].[Test that checks if changes get prevented in a current edition FAILING]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.SEASON';

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('21/22', '01-01-2022', '01-01-2023')

	INSERT INTO SEASON (SEASON_NAME, START_DATE, END_DATE)
	VALUES ('21/22', GETDATE(), GETDATE())

	SELECT *
	FROM dbo.SEASON

	EXEC tSQLt.ApplyTrigger 'dbo.SEASON', 'TRG_NO_UPDATES_ON_CURRENT_EDITION_SEASON';

	EXEC tSQLt.ExpectException;

	UPDATE SEASON
	SET SEASON_NAME = '50/51'
	WHERE SEASON_NAME = '21/22'
END;
GO

EXEC tSQLt.Run '[test_IR16_CurrentEditionChanges].[Test that checks if changes get prevented in a current edition FAILING]'
GO