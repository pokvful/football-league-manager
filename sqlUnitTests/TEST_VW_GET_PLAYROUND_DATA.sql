EXEC TSQLT.NewTestClass 'test_VW_GET_PLAYGROUND_DATA';

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

CREATE OR ALTER PROCEDURE test_VW_GET_PLAYGROUND_DATA.[test if view gives back correct data]
AS
BEGIN

	EXEC TSQLT.ExpectNoException;

	DECLARE @actual TABLE
					(
						Season           VARCHAR(128),
						Competition_name VARCHAR(128),
						Start_date       DATE,
						Club_home        VARCHAR(128),
						Club_out         VARCHAR(128),
						Home_goals       INT,
						Out_goals        INT
					);

	DECLARE @expected TABLE
					  (
						  Season      VARCHAR(128),
						  Competition VARCHAR(128),
						  Start_date  DATE,
						  Club_home   VARCHAR(128),
						  Club_out    VARCHAR(128),
						  Home_goals  INT,
						  Out_goals   INT
					  );

	EXEC TSQLT.FakeTable 'dbo.MATCH';
	EXEC TSQLT.FakeTable 'dbo.MATCHDAY';
	EXEC TSQLT.FakeTable 'dbo.ROUND';
	EXEC TSQLT.FakeTable 'dbo.GOAL';
	EXEC TSQLT.FakeTable 'dbo.PERSON';
	EXEC TSQLT.FakeTable 'dbo.PLAYER';
	EXEC TSQLT.FakeTable 'dbo.CLUB';

	INSERT INTO dbo.CLUB (CLUB_NAME, STADIUM_NAME, COUNTRY_NAME, CITY_NAME, COACH_PERSON_ID)
	VALUES ('AJAX', 'Stadium', 'The Netherlands', 'Amsterdam', 1),
		   ('Vitesse', 'Gelredome', 'The Netherlands', 'Arnhem', 1);

	INSERT INTO dbo.PLAYER (PERSON_ID, CLUB_NAME, JERSEY)
	VALUES (1, 'AJAX', 1),
		   (2, 'VITESSE', 2);

	INSERT INTO dbo.MATCH(MATCH_ID, COMPETITION_NAME, START_DATE, MATCH_DAY, HOME_CLUB_NAME, OUT_CLUB_NAME,
						  STADIUM_NAME, REFEREE_PERSON_ID, BALL_POSSESSION_HOME, BALL_POSSESSION_OUT, SPECTATORS)
	VALUES (1, 'Eredivisie', '2000-12-12', '2000-12-12', 'AJAX', 'VITESSE', 'Ziggo Dome', 1, 20, 50,
			20000);

	INSERT INTO dbo.MATCHDAY (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
	VALUES ('B', 'B', '2000-12-12', '2000-12-12');

	INSERT INTO dbo.ROUND (SEASON_NAME, COMPETITION_NAME, START_DATE)
	VALUES ('20', 'Eredivisie', '2000-12-12')

	INSERT INTO dbo.GOAL (MATCH_ID, TIME, PERSON_ID)
	VALUES (1, 10, 1),
		   (1, 11, 2),
		   (1, 12, 2),
		   (1, 13, 2),
		   (2, 14, 1)

	INSERT INTO dbo.PERSON (PERSON_ID, COUNTRY_NAME, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BIRTH_DATE)
	VALUES (1, 'The Netherlands', 'Bob', 'Banaan', 'van', '1990-12-12')

	INSERT INTO @expected (Season, Competition, Start_date, Club_home, Club_out, Home_goals, Out_goals)
	VALUES (20, 'Eredivisie', '2000-12-12', 'AJAX', 'VITESSE', 1, 3)

	INSERT INTO @actual
	SELECT dbo.ROUND.SEASON_NAME,
		   dbo.ROUND.COMPETITION_NAME,
		   dbo.ROUND.START_DATE,
		   dbo.MATCH.HOME_CLUB_NAME,
		   dbo.MATCH.OUT_CLUB_NAME,
		   (SELECT home_goals FROM GOALS_MATCHES),
		   (SELECT out_goals FROM GOALS_MATCHES)
	FROM dbo.ROUND
			 INNER JOIN dbo.MATCH ON dbo.ROUND.START_DATE = dbo.MATCH.START_DATE
			 INNER JOIN dbo.GOAL
						ON dbo.MATCH.MATCH_ID = dbo.GOAL.MATCH_ID
			 INNER JOIN dbo.PERSON ON dbo.GOAL.PERSON_ID = dbo.PERSON.PERSON_ID
			 INNER JOIN dbo.PLAYER ON dbo.PERSON.PERSON_ID = dbo.PLAYER.PERSON_ID
			 INNER JOIN dbo.CLUB ON dbo.PLAYER.CLUB_NAME = dbo.CLUB.CLUB_NAME
	GROUP BY dbo.ROUND.SEASON_NAME, dbo.ROUND.COMPETITION_NAME, dbo.ROUND.START_DATE, dbo.MATCH.HOME_CLUB_NAME,
			 dbo.MATCH.OUT_CLUB_NAME

	EXEC TSQLT.AssertEqualsTable @expected, @actual

END

GO

TSQLT.Run 'test_VW_GET_PLAYGROUND_DATA';

