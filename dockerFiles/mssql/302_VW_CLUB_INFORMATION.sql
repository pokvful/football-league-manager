CREATE OR ALTER VIEW MATCHES_INFO AS
	SELECT	*,
			(SELECT COUNT(*) FROM GOAL g WHERE m.MATCH_ID = g.MATCH_ID)			AS [amount of goals],
			(SELECT COUNT(*) FROM CORNER c WHERE m.MATCH_ID = c.MATCH_ID)		AS [amount of corners],
			(SELECT COUNT(*) FROM FOUL f WHERE m.MATCH_ID = f.MATCH_ID)			AS [amount of fouls],
			(SELECT COUNT(*) FROM PASS p WHERE m.MATCH_ID = p.MATCH_ID)			AS [amount of passess],
			(SELECT COUNT(*) FROM YELLOW_CARD yc WHERE m.MATCH_ID = yc.MATCH_ID)AS [amount of yellow cards],
			(SELECT COUNT(*) FROM RED_CARD rc WHERE m.MATCH_ID = rc.MATCH_ID)	AS [amount of red cards],
			(SELECT COUNT(*) FROM SHOT s WHERE m.MATCH_ID = s.MATCH_ID)			AS [amount of shots],
			(SELECT COUNT(*) FROM SUBSTITUTE sub WHERE m.MATCH_ID= sub.MATCH_ID)AS [amount of substitutions]
	FROM MATCH m
GO
CREATE OR ALTER VIEW [PLAYER_PLAYED_IN_MATCH] AS
	SELECT P.PLAYER_PERSON_ID, P.MATCH_ID
	FROM POSITION P
	UNION
	SELECT PAR.PLAYER_PERSON_ID, PAR.MATCH_ID
	FROM PLAYER_AS_RESERVE_IN_MATCH PAR;
GO
CREATE OR ALTER VIEW GOALS_MATCHES AS
WITH goalsClub AS (SELECT MATCH_ID, CLUB_NAME
				   FROM GOAL g
							JOIN PLAYER p ON g.PERSON_ID = p.PERSON_ID)
SELECT MATCH_ID,
	   SEASON_NAME,
	   COMPETITION_NAME,
	   MATCH_DAY,
	   HOME_CLUB_NAME,
	   OUT_CLUB_NAME,
	   (SELECT COUNT(*)
		FROM goalsClub gc
		WHERE gc.MATCH_ID = m.MATCH_ID
		  AND gc.CLUB_NAME = m.HOME_CLUB_NAME) as home_goals,
	   (SELECT COUNT(*)
		FROM goalsClub gc
		WHERE gc.MATCH_ID = m.MATCH_ID
		  AND gc.CLUB_NAME = m.OUT_CLUB_NAME)  as out_goals
FROM MATCH m
WHERE MATCH_DAY <= GETDATE()

GO

CREATE OR ALTER VIEW VW_GET_PLAYROUND_DATA AS
SELECT dbo.ROUND.SEASON_NAME,
	   dbo.ROUND.COMPETITION_NAME,
	   dbo.ROUND.START_DATE,
	   dbo.MATCH.HOME_CLUB_NAME,
	   dbo.MATCH.OUT_CLUB_NAME,
	   dbo.GOALS_MATCHES.home_goals AS Home_goals,
	   dbo.GOALS_MATCHES.out_goals  AS Out_goals
FROM dbo.ROUND
		 INNER JOIN dbo.MATCH ON dbo.ROUND.START_DATE = dbo.MATCH.START_DATE
		 INNER JOIN dbo.GOAL ON dbo.MATCH.MATCH_ID = dbo.GOAL.MATCH_ID
		 INNER JOIN dbo.PERSON ON dbo.GOAL.PERSON_ID = dbo.PERSON.PERSON_ID
		 INNER JOIN dbo.PLAYER ON dbo.PERSON.PERSON_ID = dbo.PLAYER.PERSON_ID
		 INNER JOIN dbo.GOALS_MATCHES ON dbo.GOALS_MATCHES.MATCH_ID = dbo.MATCH.MATCH_ID
		 INNER JOIN dbo.CLUB ON dbo.PLAYER.CLUB_NAME = dbo.CLUB.CLUB_NAME
GROUP BY dbo.ROUND.SEASON_NAME, dbo.ROUND.COMPETITION_NAME, dbo.ROUND.START_DATE, dbo.MATCH.HOME_CLUB_NAME,
		 dbo.MATCH.OUT_CLUB_NAME, dbo.GOALS_MATCHES.home_goals, dbo.GOALS_MATCHES.out_goals

GO