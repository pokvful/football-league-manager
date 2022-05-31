
EXEC TSQLT.NEWTESTCLASS 'TEST_TRG_VALID_PLAYER_COUNT'

GO

CREATE OR ALTER PROCEDURE TEST_TRG_VALID_PLAYER_COUNT.[TEST_TRG_VALID_PLAYER_COUNT_SUCCEEDS_WITH_MINIMUM]
AS
BEGIN

	EXEC TSQLT.FAKETABLE 'dbo.POSITION'

	EXEC TSQLT.ApplyTrigger
		 @TableName = 'dbo.POSITION', @TriggerName = 'TRG_CHECK_PLAYER_COUNT'

	EXEC TSQLT.ExpectNoException

	INSERT INTO POSITION (PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES (1, 1, 'Positie'),
		   (2, 1, 'Positie'),
		   (3, 1, 'Positie'),
		   (4, 1, 'Positie'),
		   (5, 1, 'Positie'),
		   (6, 1, 'Positie'),
		   (7, 1, 'Positie'),
		   (8, 1, 'Positie'),
		   (9, 1, 'Positie'),
		   (10, 1, 'Positie'),
		   (11, 1, 'Positie'),
		   (12, 1, 'Positie'),
		   (13, 1, 'Positie'),
		   (14, 1, 'Positie')
END

GO

CREATE OR ALTER PROCEDURE TEST_TRG_VALID_PLAYER_COUNT.[TEST_TRG_VALID_PLAYER_COUNT_FAILS_WITH_TOO_MANY_POSITIONS]
AS
BEGIN

	EXEC TSQLT.FAKETABLE 'dbo.POSITION'

	EXEC TSQLT.ApplyTrigger
		 @TableName = 'dbo.POSITION', @TriggerName = 'TRG_CHECK_PLAYER_COUNT'

	EXEC TSQLT.ExpectException

	INSERT INTO POSITION (PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES (1, 1, 'Positie'),
		   (2, 1, 'Positie'),
		   (3, 1, 'Positie'),
		   (4, 1, 'Positie'),
		   (5, 1, 'Positie'),
		   (6, 1, 'Positie'),
		   (7, 1, 'Positie'),
		   (8, 1, 'Positie'),
		   (9, 1, 'Positie'),
		   (10, 1, 'Positie'),
		   (11, 1, 'Positie'),
		   (12, 1, 'Positie'),
		   (13, 1, 'Positie'),
		   (14, 1, 'Positie'),
		   (15, 1, 'Positie'),
		   (16, 1, 'Positie'),
		   (17, 1, 'Positie'),
		   (18, 1, 'Positie'),
		   (19, 1, 'Positie'),
		   (20, 1, 'Positie'),
		   (21, 1, 'Positie'),
		   (22, 1, 'Positie'),
		   (23, 1, 'Positie'),
		   (24, 1, 'Positie'),
		   (25, 1, 'Positie')
END

GO

EXEC TSQLT.Run[TEST_TRG_VALID_PLAYER_COUNT]
XEC TSQLT.Run[TEST_TRG_VALID_PLAYER_COUNT]
