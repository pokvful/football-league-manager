EXEC TSQLT.NEWTESTCLASS 'TEST_TRG_CHECK_CLUB_IN_EDITION'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CLUB_IN_EDITION.SETUP
AS
BEGIN
    EXEC TSQLT.FAKETABLE 'dbo.MATCH'
    EXEC TSQLT.FAKETABLE 'dbo.CLUB_PLAYS_IN_EDITION'

    INSERT INTO CLUB_PLAYS_IN_EDITION (CLUB_NAME, SEASON_NAME, COMPETITION_NAME)
    VALUES ('home_club', '20/21', 'competition'),
    ('out_club', '20/21', 'competition'),
    ('wrong_club', '20/21', 'wrong_comp')

    EXEC TSQLT.APPLYTRIGGER
        @TableName = 'dbo.MATCH', @TriggerName = 'TRG_CHECK_CLUB_IN_EDITION'
END
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CLUB_IN_EDITION.[test correct home_club plays home and out_club plays out]
AS
BEGIN
    EXEC TSQLT.EXPECTNOEXCEPTION

    INSERT INTO MATCH (
        HOME_CLUB_NAME, OUT_CLUB_NAME, SEASON_NAME, COMPETITION_NAME
    )
    VALUES ('home_club', 'out_club', '20/21', 'competition')
END
GO
EXEC TSQLT.RUN
    'TEST_TRG_CHECK_CLUB_IN_EDITION.[test correct home_club plays home and out_club plays out]'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CLUB_IN_EDITION.[test correct out_club plays home and home_club plays out]
AS
BEGIN
    EXEC TSQLT.EXPECTNOEXCEPTION

    INSERT INTO MATCH (
        HOME_CLUB_NAME, OUT_CLUB_NAME, SEASON_NAME, COMPETITION_NAME
    )
    VALUES ('out_club', 'home_club', '20/21', 'competition')
END
GO
EXEC TSQLT.RUN
    'TEST_TRG_CHECK_CLUB_IN_EDITION.[test correct out_club plays home and home_club plays out]'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CLUB_IN_EDITION.[test error wrong_club doesn't play in the right competition]
AS
BEGIN
    EXEC TSQLT.EXPECTEXCEPTION
        'The clubs playing in the match need to be part of the edition'

    INSERT INTO MATCH (
        HOME_CLUB_NAME, OUT_CLUB_NAME, SEASON_NAME, COMPETITION_NAME
    )
    VALUES ('wrong_club', 'home_club', '20/21', 'competition')

    EXEC TSQLT.ASSERTEMPTYTABLE 'dbo.MATCH'
END
GO
EXEC TSQLT.RUN
    'TEST_TRG_CHECK_CLUB_IN_EDITION.[test error wrong_club doesn''t play in the right competition]'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CLUB_IN_EDITION.[test error wrong season]
AS
BEGIN
    EXEC TSQLT.EXPECTEXCEPTION
        'The clubs playing in the match need to be part of the edition'

    INSERT INTO MATCH (
        HOME_CLUB_NAME, OUT_CLUB_NAME, SEASON_NAME, COMPETITION_NAME
    )
    VALUES ('home_club', 'out_club', '21/22', 'competition')

    EXEC TSQLT.ASSERTEMPTYTABLE 'dbo.MATCH'
END
GO
EXEC TSQLT.RUN 'TEST_TRG_CHECK_CLUB_IN_EDITION.[test error wrong season]'
GO
CREATE OR ALTER PROCEDURE TEST_TRG_CHECK_CLUB_IN_EDITION.[test error club doesn't exist]
AS
BEGIN
    EXEC TSQLT.EXPECTEXCEPTION
        'The clubs playing in the match need to be part of the edition'

    INSERT INTO MATCH (
        HOME_CLUB_NAME, OUT_CLUB_NAME, SEASON_NAME, COMPETITION_NAME
    )
    VALUES ('out_club', 'za', '20/21', 'competition')

    EXEC TSQLT.ASSERTEMPTYTABLE 'dbo.MATCH'
END
GO
EXEC TSQLT.RUN 'TEST_TRG_CHECK_CLUB_IN_EDITION.[test error club doesn''t exist]'
