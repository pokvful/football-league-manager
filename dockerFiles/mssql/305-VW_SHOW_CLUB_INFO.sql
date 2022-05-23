CREATE OR ALTER VIEW ALL_PLAYERS_EDITIONS AS
SELECT DISTINCT m.SEASON_NAME, m.COMPETITION_NAME, pp.PLAYER_PERSON_ID 
FROM MATCH m 
JOIN [PLAYER_PLAYED_IN_MATCH]  pp ON m.MATCH_ID = pp.MATCH_ID

GO
CREATE OR ALTER VIEW CLUB_INFORMATION AS
SELECT	CLUB_NAME, 
		CITY_NAME, 
		COUNTRY_NAME, 
		c.STADIUM_NAME, 
		s.CAPACITY as CAPACITY_STADIUM,
		COACH_PERSON_ID as COACH
FROM CLUB c 
JOIN STADIUM s ON s.STADIUM_NAME = c.STADIUM_NAME

