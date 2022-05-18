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
	   (SELECT home_goals FROM GOALS_MATCHES) AS Home_goals,
	   (SELECT out_goals FROM GOALS_MATCHES) AS Out_goals
FROM dbo.ROUND
		 INNER JOIN dbo.MATCH ON dbo.ROUND.START_DATE = dbo.MATCH.START_DATE
		 INNER JOIN dbo.GOAL ON dbo.MATCH.MATCH_ID = dbo.GOAL.MATCH_ID
		 INNER JOIN dbo.PERSON ON dbo.GOAL.PERSON_ID = dbo.PERSON.PERSON_ID
		 INNER JOIN dbo.PLAYER ON dbo.PERSON.PERSON_ID = dbo.PLAYER.PERSON_ID
		 INNER JOIN dbo.CLUB ON dbo.PLAYER.CLUB_NAME = dbo.CLUB.CLUB_NAME
GROUP BY dbo.ROUND.SEASON_NAME, dbo.ROUND.COMPETITION_NAME, dbo.ROUND.START_DATE, dbo.MATCH.HOME_CLUB_NAME,
		 dbo.MATCH.OUT_CLUB_NAME

GO

SELECT * FROM VW_GET_PLAYGROUND_DATA

