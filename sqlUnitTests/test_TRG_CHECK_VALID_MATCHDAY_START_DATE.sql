EXEC tSQLt.NewTestClass'test_TRG_CHECK_VALID_MATCHDAY_START_DATE' -- 13:05
GO
CREATE OR ALTER PROCEDURE test_TRG_CHECK_VALID_MATCHDAY_START_DATE.SetUp
AS
BEGIN
	EXEC tSQLt.FakeTable 'dbo.MATCHDAY'
	EXEC tSQLt.FakeTable 'dbo.ROUND'

	INSERT INTO ROUND (COMPETITION_NAME, SEASON_NAME, START_DATE) VALUES 
	('compe', '00/01', '2002-05-05'),
	('compe', '00/01', '2002-05-10'),
	('compe', '01/02', '2002-05-10'),
	('compe', '00/01', '2002-05-20'),
	('compe', '00/01', '2002-06-02')

	EXEC tSQLt.ApplyTrigger @TableName = 'dbo.MATCHDAY', @TriggerName = 'TRG_CHECK_VALID_MATCHDAY_START_DATE'
END
GO
CREATE OR ALTER PROCEDURE test_TRG_CHECK_VALID_MATCHDAY_START_DATE.[test meerdere valide matchday worden toegevoegd]
AS
BEGIN
	EXEC tSQLt.ExpectNoException

	INSERT INTO MATCHDAY (MATCH_DAY, COMPETITION_NAME, SEASON_NAME, START_DATE) VALUES 
	('2002-05-06', 'compe', '00/01', '2002-05-05'),
	('2002-05-11', 'compe', '00/01', '2002-05-10'),
	('2002-05-10', 'compe', '00/01', '2002-05-10')
END
GO
EXEC tSQLt.Run 'test_TRG_CHECK_VALID_MATCHDAY_START_DATE.[test meerdere valide matchday worden toegevoegd]'
GO
CREATE OR ALTER PROCEDURE test_TRG_CHECK_VALID_MATCHDAY_START_DATE.[test matchday voor de gekozen ronde]
AS
BEGIN
	EXEC tSQLt.ExpectException 'match_day needs to be higher or equal than startdate dependent round and smaller then the next round startdate'

	INSERT INTO MATCHDAY (MATCH_DAY, COMPETITION_NAME, SEASON_NAME, START_DATE) 
	VALUES  ('2002-05-19', 'compe', '00/01', '2002-05-20')

	EXEC tSQLt.AssertEmptyTable 'dbo.MATCHDAY'
END
GO
EXEC tSQLt.Run 'test_TRG_CHECK_VALID_MATCHDAY_START_DATE.[test matchday voor de gekozen ronde]'
GO
CREATE OR ALTER PROCEDURE test_TRG_CHECK_VALID_MATCHDAY_START_DATE.[test matchday in last round]
AS
BEGIN
	EXEC tSQLt.ExpectNoException

	INSERT INTO MATCHDAY (MATCH_DAY, COMPETITION_NAME, SEASON_NAME, START_DATE) 
	VALUES ('2002-07-01' ,'compe', '00/01', '2002-06-02')
END
GO
EXEC tSQLt.Run 'test_TRG_CHECK_VALID_MATCHDAY_START_DATE.[test matchday in last round]'
GO
CREATE OR ALTER PROCEDURE test_TRG_CHECK_VALID_MATCHDAY_START_DATE.[test error matchday is on the startdate of next round]
AS
BEGIN
	EXEC tSQLt.ExpectException @ExpectedMessage = 'match_day needs to be higher or equal than startdate dependent round and smaller then the next round startdate'

	INSERT INTO MATCHDAY (MATCH_DAY, COMPETITION_NAME, SEASON_NAME, START_DATE) 
	VALUES ('2002-05-20' ,'compe', '00/01', '2002-05-10') -- Volgende ronde is '2002-05-20'
END
GO
EXEC tSQLt.Run 'test_TRG_CHECK_VALID_MATCHDAY_START_DATE.[test error matchday is on the startdate of next round]'
GO
CREATE OR ALTER PROCEDURE test_TRG_CHECK_VALID_MATCHDAY_START_DATE.[test works on MATCH_DAY update]
AS
BEGIN
	INSERT INTO MATCHDAY (MATCH_DAY, COMPETITION_NAME, SEASON_NAME, START_DATE)
	VALUES ('2002-05-11', 'compe', '00/01', '2002-05-10')

	EXEC tSQLt.ExpectException 'match_day needs to be higher or equal than startdate dependent round and smaller then the next round startdate'

	UPDATE MATCHDAY
	SET MATCH_DAY = '2002-05-22'
	WHERE MATCH_DAY = '2002-05-11'
END
GO
EXEC tSQLt.Run 'test_TRG_CHECK_VALID_MATCHDAY_START_DATE.[test works on MATCH_DAY update]'
GO
CREATE OR ALTER PROCEDURE test_TRG_CHECK_VALID_MATCHDAY_START_DATE.[test works on START_DATE update]
AS
BEGIN
	INSERT INTO MATCHDAY (MATCH_DAY, COMPETITION_NAME, SEASON_NAME, START_DATE)
	VALUES ('2002-05-11', 'compe', '00/01', '2002-05-10')

	EXEC tSQLt.ExpectException 'match_day needs to be higher or equal than startdate dependent round and smaller then the next round startdate'

	UPDATE MATCHDAY
	SET START_DATE = '2002-05-20'
	WHERE START_DATE = '2002-05-10'
END
GO
EXEC tSQLt.Run 'test_TRG_CHECK_VALID_MATCHDAY_START_DATE.[test works on START_DATE update]'
