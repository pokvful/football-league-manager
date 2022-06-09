IF NOT EXISTS(SELECT 1 FROM SYSTYPES WHERE NAME='clubNamesTable')
   CREATE TYPE clubNamesTable AS TABLE(club_name CLUB_NAME PRIMARY KEY)
GO

CREATE OR ALTER PROCEDURE START_NEW_EDITION_KO (
	@competitionname COMPETITION_NAME, -- not null
	@seasonname SEASON_NAME, -- not null
	@listofclubs clubNamesTable READONLY, -- not null
	@startDateCompetition DATE -- not null
)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO EDITION (SEASON_NAME, COMPETITION_NAME)
		VALUES (@seasonname, @competitionname);

	DECLARE @round_names VARCHAR(MAX) = "Finale,Halve finale, Kwart finale, 8ste finale";

	DECLARE @round_date DATE;
	DECLARE @round_number INT = 1;
	DECLARE @round_name VARCHAR(100);
	DECLARE cursor_round_names CURSOR FOR
		SELECT TRIM([value])
			FROM STRING_SPLIT(@round_names, ',');

	OPEN cursor_round_names;

	FETCH NEXT FROM cursor_round_names
		INTO @round_name;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @round_date = DATEADD(day, 7 * @round_number, @startDateCompetition);

		INSERT INTO [ROUND] (SEASON_NAME, COMPETITION_NAME, START_DATE, ROUND_NR, ROUND_NAME)
			VALUES (@seasonname, @competitionname, @round_date, @round_number, @round_name);

		INSERT INTO MATCHDAY (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
			VALUES (@seasonname, @competitionname, @round_date, @round_date);

		SELECT @round_number += 1;

		FETCH NEXT FROM cursor_round_names
			INTO @round_name;
	END

	DEALLOCATE cursor_round_names;

	DECLARE @club_name CLUB_NAME;
	DECLARE cursor_clubs CURSOR FOR
		SELECT club_name
			FROM @listofclubs;

	OPEN cursor_clubs;

	FETCH NEXT FROM cursor_clubs
		INTO @club_name;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO CLUB_PLAYS_IN_EDITION (CLUB_NAME, SEASON_NAME, COMPETITION_NAME)
			VALUES (@club_name, @seasonname, @competitionname);

		FETCH NEXT FROM cursor_clubs
			INTO @club_name;
	END

	DEALLOCATE cursor_clubs;

	DECLARE @stadium STADIUM_NAME;
	DECLARE @referee PERSON_ID;
	DECLARE @i INT = 0;
	DECLARE @club_count INT = (SELECT COUNT(*) FROM @listofclubs);
	DECLARE @club_name_out CLUB_NAME;
	DECLARE @club_name_home CLUB_NAME;

	WHILE @i < @club_count
	BEGIN
		SELECT @club_name_home = CLUB_NAME
			FROM @listofclubs
			ORDER BY club_name ASC
			OFFSET @i ROWS
			FETCH NEXT 1 ROWS ONLY;
		SELECT @club_name_out = CLUB_NAME
			FROM @listofclubs
			ORDER BY club_name ASC
			OFFSET @i + 1 ROWS
			FETCH NEXT 1 ROWS ONLY;
		SELECT TOP(1) @stadium = STADIUM.STADIUM_NAME
			FROM CLUB
				INNER JOIN STADIUM
					ON CLUB.STADIUM_NAME = STADIUM.STADIUM_NAME
			WHERE CLUB.CLUB_NAME = @club_name_home;
		SELECT TOP(1) @referee = PERSON_ID
			FROM REFEREE
			ORDER BY NEWID();

		INSERT INTO MATCH (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY, HOME_CLUB_NAME, OUT_CLUB_NAME, STADIUM_NAME, REFEREE_PERSON_ID, MATCH_TYPE)
			VALUES (
				@seasonname,
				@competitionname,
				@startDateCompetition,
				@startDateCompetition,
				@club_name_home,
				@club_name_out,
				@stadium,
				@referee,
				'Knockout'
			);

		SELECT @i += 2;
	END
END;
GO
