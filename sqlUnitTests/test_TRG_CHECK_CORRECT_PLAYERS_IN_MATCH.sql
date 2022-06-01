EXEC TSQLT.NEWTESTCLASS 'test_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_PLAYER_AS_RESERVE_IN_MATCH'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_PLAYER_AS_RESERVE_IN_MATCH.SETUP
AS
BEGIN
	EXEC TSQLT.FAKETABLE 'dbo.PLAYER_AS_RESERVE_IN_MATCH'
	EXEC TSQLT.FAKETABLE 'dbo.MATCH'
	EXEC TSQLT.FAKETABLE 'dbo.PLAYER'

	INSERT INTO [MATCH] (MATCH_ID, HOME_CLUB_NAME, OUT_CLUB_NAME)
	VALUES (1, 'home_club', 'out_club')

	EXEC TSQLT.APPLYTRIGGER @TableName = 'dbo.PLAYER_AS_RESERVE_IN_MATCH', @TriggerName = 'TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_PLAYER_AS_RESERVE_IN_MATCH'
END
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_PLAYER_AS_RESERVE_IN_MATCH.[test trigger player from home_club]
AS
BEGIN
	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME)
	VALUES (22, 'home_club')
	
	EXEC TSQLT.EXPECTNOEXCEPTION

	INSERT INTO PLAYER_AS_RESERVE_IN_MATCH (PLAYER_PERSON_ID, MATCH_ID)
	VALUES (22, 1)
END
GO
EXEC TSQLT.RUN 'TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_PLAYER_AS_RESERVE_IN_MATCH.[test trigger player from home_club]'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_PLAYER_AS_RESERVE_IN_MATCH.[test trigger player from out_club]
AS
BEGIN
	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME)
	VALUES (22, 'out_club')
	
	EXEC TSQLT.EXPECTNOEXCEPTION

	INSERT INTO PLAYER_AS_RESERVE_IN_MATCH (PLAYER_PERSON_ID, MATCH_ID)
	VALUES (22, 1)
END
GO
EXEC TSQLT.RUN 'TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_PLAYER_AS_RESERVE_IN_MATCH.[test trigger player from out_club]'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_PLAYER_AS_RESERVE_IN_MATCH.[test trigger player not from a club]
AS
BEGIN
	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME)
	VALUES (22, null)
	
	EXEC TSQLT.EXPECTEXCEPTION @ExpectedMessage = 'Player must be member of home_club or out_club'

	INSERT INTO PLAYER_AS_RESERVE_IN_MATCH (PLAYER_PERSON_ID, MATCH_ID)
	VALUES (22, 1)

	EXEC TSQLT.ASSERTEMPTYTABLE 'dbo.PLAYER_AS_RESERVE_IN_MATCH'
END
GO
EXEC TSQLT.RUN 'TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_PLAYER_AS_RESERVE_IN_MATCH.[test trigger player not from a club]'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_PLAYER_AS_RESERVE_IN_MATCH.[test trigger player not from right club]
AS
BEGIN
	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME)
	VALUES (22, 'verkeerde')
	
	EXEC TSQLT.EXPECTEXCEPTION @ExpectedMessage = 'Player must be member of home_club or out_club'

	INSERT INTO PLAYER_AS_RESERVE_IN_MATCH (PLAYER_PERSON_ID, MATCH_ID)
	VALUES (22, 1)

	EXEC TSQLT.ASSERTEMPTYTABLE 'dbo.PLAYER_AS_RESERVE_IN_MATCH'
END
GO
EXEC TSQLT.RUN 'TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_PLAYER_AS_RESERVE_IN_MATCH.[test trigger player not from right club]'
GO


EXEC TSQLT.NEWTESTCLASS 'test_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_LINEUP'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_LINEUP.SETUP
AS
BEGIN
	EXEC TSQLT.FAKETABLE 'dbo.LINEUP'
	EXEC TSQLT.FAKETABLE 'dbo.MATCH'
	EXEC TSQLT.FAKETABLE 'dbo.PLAYER'

	INSERT INTO [MATCH] (MATCH_ID, HOME_CLUB_NAME, OUT_CLUB_NAME)
	VALUES (1, 'home_club', 'out_club')

	EXEC TSQLT.APPLYTRIGGER @TableName = 'dbo.LINEUP', @TriggerName = 'TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_LINEUP'
END
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_LINEUP.[test trigger player from home_club]
AS
BEGIN
	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME)
	VALUES (22, 'home_club')
	
	EXEC TSQLT.EXPECTNOEXCEPTION

	INSERT INTO LINEUP (PLAYER_PERSON_ID, MATCH_ID)
	VALUES (22, 1)
END
GO
EXEC TSQLT.RUN 'TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_PLAYER_AS_RESERVE_IN_MATCH.[test trigger player from home_club]'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_LINEUP.[test trigger player from out_club]
AS
BEGIN
	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME)
	VALUES (22, 'out_club')
	
	EXEC TSQLT.EXPECTNOEXCEPTION

	INSERT INTO LINEUP (PLAYER_PERSON_ID, MATCH_ID)
	VALUES (22, 1)
END
GO
EXEC TSQLT.RUN 'TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_LINEUP.[test trigger player from out_club]'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_LINEUP.[test trigger player not from a club]
AS
BEGIN
	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME)
	VALUES (22, null)
	
	EXEC TSQLT.EXPECTEXCEPTION @ExpectedMessage = 'Player must be member of home_club or out_club'

	INSERT INTO LINEUP (PLAYER_PERSON_ID, MATCH_ID)
	VALUES (22, 1)

	EXEC TSQLT.ASSERTEMPTYTABLE 'dbo.LINEUP'
END
GO
EXEC TSQLT.RUN 'TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_LINEUP.[test trigger player not from a club]'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_LINEUP.[test trigger player not from right club]
AS
BEGIN
	INSERT INTO PLAYER (PERSON_ID, CLUB_NAME)
	VALUES (22, 'verkeerde')
	
	EXEC TSQLT.EXPECTEXCEPTION @ExpectedMessage = 'Player must be member of home_club or out_club'

	INSERT INTO LINEUP (PLAYER_PERSON_ID, MATCH_ID)
	VALUES (22, 1)

	EXEC TSQLT.ASSERTEMPTYTABLE 'dbo.LINEUP'
END
GO
EXEC TSQLT.RUN 'TEST_TRG_CHECK_CORRECT_PLAYERS_IN_MATCH_FOR_LINEUP.[test trigger player not from right club]'
