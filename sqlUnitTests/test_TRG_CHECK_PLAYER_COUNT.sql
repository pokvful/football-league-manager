
EXEC TSQLT.NEWTESTCLASS 'TEST_TRG_VALID_PLAYER_COUNT'

GO

CREATE OR ALTER PROCEDURE TEST_TRG_VALID_PLAYER_COUNT.SETUP
AS
BEGIN 
	EXEC TSQLT.FAKETABLE 'dbo.POSITION'
	EXEC TSQLT.FAKETABLE 'dbo.MATCH'
	EXEC TSQLT.fAKETABLE 'dbo.PLAYER'

	EXEC TSQLT.ApplyTrigger
		 @TableName = 'dbo.POSITION', @TriggerName = 'TRG_CHECK_PLAYER_COUNT'

	INSERT INTO MATCH (MATCH_ID, SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY, HOME_CLUB_NAME, OUT_CLUB_NAME, STADIUM_NAME, REFEREE_PERSON_ID, BALL_POSSESSION_HOME, BALL_POSSESSION_OUT, SPECTATORS)
	VALUES 
		(0,	18/19,	'Bundesliga',	'2000-01-01',	'2000-01-01', 'Voonte',	'Tavu',	'Triple Vitamin Drops with Fluoride',		163,	55.00,	45.00,	38413),
		(1,	18/19,	'Bundesliga',	'2000-01-01',	'2000-01-01', 'Voonte',	'Eadel',	'Triple Vitamin Drops with Fluoride',	164,	67.00,	33.00,	14673),
		(2,	18/19,	'Bundesliga', '2000-01-01',	'2000-01-01',	'Voonte',	'Quimm',	'Triple Vitamin Drops with Fluoride',	165,	86.00,	14.00,	39232)

	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME)
	VALUES 
	(1, 'Voonte'),
	(2, 'Voonte'),
	(3, 'Voonte'),
	(4, 'Voonte'),
	(5, 'Voonte'),
	(6, 'Voonte'),
	(7, 'Voonte'),
	(8, 'Voonte'),
	(9, 'Voonte'),
	(10, 'Voonte'),
	(11, 'Voonte'),
	(12, 'Voonte'),
	(13, 'Voonte'),
	(14, 'Voonte'),
	(15, 'Voonte'),
	(16, 'Voonte'),
	(17, 'Voonte'),
	(18, 'Voonte'),
	(19, 'Voonte'),
	(20, 'Voonte'),
	(21, 'Voonte'),
	(22, 'Voonte'),
	(23, 'Voonte'),
	(24, 'Quimm'),
	(25, 'Quimm'),
	(26, 'Quimm'),
	(27, 'Quimm'),
	(28, 'Quimm'),
	(29, 'Quimm'),
	(30, 'Quimm'),
	(31, 'Quimm'),
	(32, 'Quimm'),
	(33, 'Quimm'),
	(34, 'Quimm'),
	(35, 'Quimm'),
	(36, 'Quimm'),
	(37, 'Quimm'),
	(38, 'Quimm'),
	(39, 'Quimm'),
	(40, 'Quimm'),
	(41, 'Quimm'),
	(42, 'Quimm'),
	(43, 'Quimm')
END

GO

CREATE OR ALTER PROCEDURE TEST_TRG_VALID_PLAYER_COUNT.[TEST_TRG_VALID_PLAYER_COUNT_SUCCEEDS_WITH_7]
AS
BEGIN

	EXEC TSQLT.ExpectNoException

	INSERT INTO POSITION (PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES (1, 1, 'Positie'),
		   (2, 1, 'Positie'),
		   (3, 1, 'Positie'),
		   (4, 1, 'Positie'),
		   (5, 1, 'Positie'),
		   (6, 1, 'Positie'),
		   (7, 1, 'Positie')
END

GO

CREATE OR ALTER PROCEDURE TEST_TRG_VALID_PLAYER_COUNT.[TEST_TRG_VALID_PLAYER_COUNT_SUCCEEDS_WITH_22]
AS
BEGIN

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
		   (12, 2, 'Positie'),
		   (13, 2, 'Positie'),
		   (14, 2, 'Positie'),
		   (15, 2, 'Positie'),
		   (16, 2, 'Positie'),
		   (17, 2, 'Positie'),
		   (18, 2, 'Positie'),
		   (19, 2, 'Positie'),
		   (20, 2, 'Positie'),
		   (21, 2, 'Positie'),
		   (22, 2, 'Positie')
END

GO

CREATE OR ALTER PROCEDURE TEST_TRG_VALID_PLAYER_COUNT.[TEST_TRG_VALID_PLAYER_COUNT_FAILS_WITH_13]
AS
BEGIN
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
		   (13, 1, 'Positie')
END

GO

CREATE OR ALTER PROCEDURE TEST_TRG_VALID_PLAYER_COUNT.[TEST_TRG_VALID_PLAYER_COUNT_FAILS_WITH_23]
AS
BEGIN
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
		   (23, 1, 'Positie')
END

GO

CREATE OR ALTER PROCEDURE TEST_TRG_VALID_PLAYER_COUNT.[TEST_TRG_VALID_PLAYER_COUNT_FAILS_WITH_10_AND_4]
AS
BEGIN
	EXEC TSQLT.ExpectException

	INSERT INTO POSITION (PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES  (1, 1, 'Positie'),
			(2, 1, 'Positie'),
			(3, 1, 'Positie'),
			(4, 1, 'Positie'),
			(5, 1, 'Positie'),
			(6, 1, 'Positie'),
			(7, 1, 'Positie'),
			(8, 1, 'Positie'),
			(9, 1, 'Positie'),
			(10, 1, 'Positie'),
			(11, 2, 'Positie'),
			(12, 2, 'Positie'),
			(13, 2, 'Positie'),
			(14, 2, 'Positie')

END

GO

CREATE OR ALTER PROCEDURE TEST_TRG_VALID_PLAYER_COUNT.[TEST_TRG_VALID_PLAYER_COUNT_FAILS_WITH_14_AND_4]
AS
BEGIN

	EXEC TSQLT.ExpectException

	INSERT INTO POSITION (PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES  (1, 1, 'Positie'),
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
			(15, 2, 'Positie'),
			(16, 2, 'Positie'),
			(17, 2, 'Positie'),
			(18, 2, 'Positie')

END

GO

EXEC TSQLT.Run[TEST_TRG_VALID_PLAYER_COUNT]
