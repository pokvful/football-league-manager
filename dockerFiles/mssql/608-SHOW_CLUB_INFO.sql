--CREATE OR ALTER VIEW MATCHES_INFO AS
--	SELECT	*,
--			(SELECT COUNT(*) FROM GOAL g WHERE m.MATCH_ID = g.MATCH_ID)			AS [amount of goals],
--			(SELECT COUNT(*) FROM CORNER c WHERE m.MATCH_ID = c.MATCH_ID)		AS [amount of corners],
--			(SELECT COUNT(*) FROM FOUL f WHERE m.MATCH_ID = f.MATCH_ID)			AS [amount of fouls],
--			(SELECT COUNT(*) FROM PASS p WHERE m.MATCH_ID = p.MATCH_ID)			AS [amount of passess],
--			(SELECT COUNT(*) FROM YELLOW_CARD yc WHERE m.MATCH_ID = yc.MATCH_ID)AS [amount of yellow cards],
--			(SELECT COUNT(*) FROM RED_CARD rc WHERE m.MATCH_ID = rc.MATCH_ID)	AS [amount of red cards],
--			(SELECT COUNT(*) FROM SHOT s WHERE m.MATCH_ID = s.MATCH_ID)			AS [amount of shots],
--			(SELECT COUNT(*) FROM SUBSTITUTE sub WHERE m.MATCH_ID= sub.MATCH_ID)AS [amount of substitutions]
--	FROM MATCH m
--GO
--CREATE OR ALTER PROCEDURE SHOW_MATCH_INFO
--(@match_id G_IDENTITY = NULL,
--@season SEASON_NAME = NULL,
--@competition COMPETITION_NAME = NULL,
--@start_date _DATE_ = NULL,
--@match_day _DATE_ = NULL,
--@home_club CLUB_NAME = NULL,
--@out_club CLUB_NAME = NULL)
--AS
--BEGIN
--IF @match_id IS NOT NULL
--BEGIN
--	SELECT * FROM MATCHES_INFO WHERE MATCH_ID = @match_id
--END
--ELSE
--	IF @season IS NOT NULL AND @competition IS NOT NULL AND @competition IS NOT NULL AND @start_date IS NOT NULL AND @match_day IS NOT NULL AND @home_club IS NOT NULL AND @out_club IS NOT NULL
--	BEGIN
--		SELECT * FROM MATCHES_INFO WHERE MATCH_ID = (SELECT MATCH_ID FROM MATCH WHERE SEASON_NAME = @season AND COMPETITION_NAME = @competition AND MATCH_DAY = @match_day AND START_DATE = @start_date AND HOME_CLUB_NAME = @home_club AND @out_club = OUT_CLUB_NAME)
--	END
--	ELSE
--	BEGIN
--		;THROW 50001, 'Invalid input either only @match_id IS NULL or only @match_id IS NOT NULL', 1
--	END
--END

/*  Ik moet een proc schrijven die alle spelers van een club ophaalt, 
	Ook moet er een proc komen die de gemiddelde positie ophaalt en tot aant goals*/

