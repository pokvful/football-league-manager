CREATE OR ALTER PROCEDURE GET_MATCH_INFO
(@match_id G_IDENTITY = NULL,
@season SEASON_NAME = NULL,
@competition COMPETITION_NAME = NULL,
@start_date _DATE_ = NULL,
@match_day _DATE_ = NULL,
@home_club CLUB_NAME = NULL,
@out_club CLUB_NAME = NULL)
AS
BEGIN
IF @match_id IS NOT NULL
BEGIN
	SELECT * FROM MATCHES_INFO WHERE MATCH_ID = @match_id
END
ELSE
	IF @season IS NOT NULL AND @competition IS NOT NULL AND @competition IS NOT NULL AND @start_date IS NOT NULL AND @match_day IS NOT NULL AND @home_club IS NOT NULL AND @out_club IS NOT NULL
	BEGIN
		SELECT * FROM MATCHES_INFO WHERE MATCH_ID = (SELECT MATCH_ID FROM MATCH WHERE SEASON_NAME = @season AND COMPETITION_NAME = @competition AND MATCH_DAY = @match_day AND START_DATE = @start_date AND HOME_CLUB_NAME = @home_club AND @out_club = OUT_CLUB_NAME)
	END
	ELSE
	BEGIN
		;THROW 50001, 'Invalid input either only @match_id IS NULL or only @match_id IS NOT NULL', 1
	END
END
