CREATE OR ALTER TRIGGER TRG_PERSON_IS_PLAYER_OR_COACH_YELLOW
	ON yellow_card
	FOR INSERT, UPDATE
	AS
BEGIN
	IF @@ROWCOUNT = 0
		RETURN
	SET NOCOUNT ON

	BEGIN TRY
		IF EXISTS(
			SELECT inserted.PERSON_ID
			FROM inserted
					 JOIN referee ON inserted.PERSON_ID = referee.PERSON_ID
			)
			THROW 50001, 'Referee can not have a yellow card!', 1;

		IF NOT EXISTS(
			SELECT 1
			FROM inserted, (SELECT player_person_id as person_id
				  FROM player_played_in_match, inserted
				  WHERE player_played_in_match.MATCH_ID = inserted.MATCH_ID
				  UNION
				  SELECT coach_person_id
				  FROM club
				  WHERE club_name = (SELECT out_club_name
									 FROM match, inserted
									 WHERE match.MATCH_ID = inserted.MATCH_ID)
					 OR club_name = (SELECT home_club_name
									 FROM match, inserted
									 WHERE match.MATCH_ID = inserted.MATCH_ID)) AS check_if_player_exists_in_match
			WHERE check_if_player_exists_in_match.PERSON_ID = inserted.PERSON_ID
			)
			THROW 50001, 'Player/coach is not available in match!', 1;
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO

CREATE OR ALTER TRIGGER TRG_PERSON_IS_PLAYER_OR_COACH_RED
	ON red_card
	FOR INSERT, UPDATE
	AS
BEGIN
	IF @@ROWCOUNT = 0
		RETURN
	SET NOCOUNT ON

	BEGIN TRY
		IF EXISTS(
			SELECT inserted.PERSON_ID
			FROM inserted
					 JOIN referee ON inserted.PERSON_ID = referee.PERSON_ID
			)
			THROW 50001, 'Referee can not have a red card!', 1;

		IF NOT EXISTS(
			SELECT 1
			FROM inserted, (SELECT player_person_id as person_id
				  FROM player_played_in_match, inserted
				  WHERE player_played_in_match.MATCH_ID = inserted.MATCH_ID
				  UNION
				  SELECT coach_person_id
				  FROM club
				  WHERE club_name = (SELECT out_club_name
									 FROM match, inserted
									 WHERE match.MATCH_ID = inserted.MATCH_ID)
					 OR club_name = (SELECT home_club_name
									 FROM match, inserted
									 WHERE match.MATCH_ID = inserted.MATCH_ID)) AS check_if_player_exists_in_match
			WHERE check_if_player_exists_in_match.PERSON_ID = inserted.PERSON_ID
			)
			THROW 50001, 'Player/coach is not available in match!', 1;
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO
