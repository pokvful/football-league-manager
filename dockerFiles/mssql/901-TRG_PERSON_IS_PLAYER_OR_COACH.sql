CREATE OR ALTER TRIGGER trg_person_is_player_or_coach_yellow
	ON yellow_card
	FOR INSERT, UPDATE
	AS
BEGIN
	IF @@ROWCOUNT = 0
		RETURN
	SET NOCOUNT ON

	BEGIN TRY
		IF EXISTS(
			SELECT inserted.person_id
			FROM inserted
					 JOIN referee ON inserted.person_id = referee.person_id
			)
			THROW 50001, 'Referee can not have a yellow card!', 1;

		IF NOT EXISTS(
			SELECT 1
			FROM inserted, (SELECT player_person_id as person_id
				  FROM player_played_in_match, inserted
				  WHERE player_played_in_match.match_id = inserted.match_id
				  UNION
				  SELECT coach_person_id
				  FROM club
				  WHERE club_name = (SELECT out_club_name
									 FROM match, inserted
									 WHERE match.match_id = inserted.match_id)
					 OR club_name = (SELECT home_club_name
									 FROM match, inserted
									 WHERE match.match_id = inserted.match_id)) AS check_if_player_exists_in_match
			WHERE check_if_player_exists_in_match.person_id = inserted.person_id
			)
			THROW 50001, 'Player/coach is not available in match!', 1;
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO


CREATE OR ALTER TRIGGER trg_person_is_player_or_coach_red
	ON red_card
	FOR INSERT, UPDATE
	AS
BEGIN
	IF @@ROWCOUNT = 0
		RETURN
	SET NOCOUNT ON

	BEGIN TRY
		IF EXISTS(
			SELECT inserted.person_id
			FROM inserted
					 JOIN referee ON inserted.person_id = referee.person_id
			)
			THROW 50001, 'Referee can not have a red card!', 1;
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO
