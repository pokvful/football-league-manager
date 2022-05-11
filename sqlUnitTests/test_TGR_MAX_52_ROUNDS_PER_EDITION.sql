EXEC tSQLt.NewTestClass 'test_IR4_Max52Round'
GO
CREATE OR ALTER PROCEDURE [test_IR4_Max52Round].[Test that checks if the max amount of rounds in an edition is 52 FAILING]
AS
BEGIN
	EXEC tSQLt.FakeTable @SchemaName='dbo', @TableName='ROUND';

	DECLARE @i INT = 0;
	WHILE (@i <= 52 )
	BEGIN
		INSERT INTO ROUND (SEASON_NAME, COMPETITION_NAME, START_DATE)
		VALUES	('21/22', 'Eredivisie', DATEADD(day , @i, GETDATE()));
		SET @i = @i + 1;
	END

	EXEC tSQLt.ApplyTrigger 'ROUND', 'tgr_round_max_amount';

	EXEC tSQLt.ExpectException;

	INSERT INTO ROUND (SEASON_NAME, COMPETITION_NAME, START_DATE)
	VALUES	('21/22', 'Eredivisie', GETDATE());

END;
GO

EXEC tSQLt.Run '[test_IR4_Max52Round].[Test that checks if the max amount of rounds in an edition is 52 FAILING]'
GO

CREATE OR ALTER PROCEDURE [test_IR4_Max52Round].[Test that checks if the max amount of rounds in an edition is 52 PASSING]
AS
BEGIN
	EXEC tSQLt.FakeTable @SchemaName='dbo', @TableName='ROUND';

	EXEC tSQLt.ExpectNoException;

	INSERT INTO ROUND (SEASON_NAME, COMPETITION_NAME, START_DATE)
	VALUES	('21/22', 'Eredivisie', GETDATE());
END;
GO

EXEC tSQLt.Run '[test_IR4_Max52Round].[Test that checks if the max amount of rounds in an edition is 52 PASSING]'
GO
