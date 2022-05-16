-- moet voor `PASS`, `GOAL`, `SHOT`, `FOUL`, `CORNER` en `SUBSTITUTE`
-- de speler moet bestaan met dezelfde id voor match in tabel match
-- schrijf voor substitute 2 triggers een voor in en een voor uit
CREATE OR ALTER TRIGGER TRG_PASS_ONLY_FOR_PLAYER_PLAYED_IN_MATCH
	ON dbo.PASS
	FOR INSERT, UPDATE
	AS
BEGIN
	if
		@@ROWCOUNT > 0
		BEGIN TRY
			IF EXISTS(
				SELECT I.PERSON_ID
				FROM inserted I
						 left join PLAYER_PLAYED_IN_MATCH PIM on i.PERSON_ID = PIM.PLAYER_PERSON_ID
					AND I.MATCH_ID = PIM.MATCH_ID
				where PIM.PLAYER_PERSON_ID is NULL
				)
				THROW 50001, 'Player didnt play in the assigned match', 1

		END TRY
		BEGIN CATCH
			THROW;
		END CATCH
END
GO

CREATE OR ALTER TRIGGER TRG_GOAL_ONLY_FOR_PLAYER_PLAYED_IN_MATCH
	ON dbo.GOAL
	FOR INSERT, UPDATE
	AS
BEGIN
	if
		@@ROWCOUNT > 0
		BEGIN TRY
			IF EXISTS(
				SELECT I.PERSON_ID
				FROM inserted I
						 left join PLAYER_PLAYED_IN_MATCH PIM on i.PERSON_ID = PIM.PLAYER_PERSON_ID
					AND I.MATCH_ID = PIM.MATCH_ID
				where PIM.PLAYER_PERSON_ID is NULL
				)
				THROW 50001, 'Player didnt play in the assigned match', 1

		END TRY
		BEGIN CATCH
			THROW;
		END CATCH
END
GO

CREATE OR ALTER TRIGGER TRG_SHOT_ONLY_FOR_PLAYER_PLAYED_IN_MATCH
	ON dbo.SHOT
	FOR INSERT, UPDATE
	AS
BEGIN
	if
		@@ROWCOUNT > 0
		BEGIN TRY
			IF EXISTS(
				SELECT I.PERSON_ID
				FROM inserted I
						 left join PLAYER_PLAYED_IN_MATCH PIM on i.PERSON_ID = PIM.PLAYER_PERSON_ID
					AND I.MATCH_ID = PIM.MATCH_ID
				where PIM.PLAYER_PERSON_ID is NULL
				)
				THROW 50001, 'Player didnt play in the assigned match', 1

		END TRY
		BEGIN CATCH
			THROW;
		END CATCH
END
GO

CREATE OR ALTER TRIGGER TRG_FOUL_ONLY_FOR_PLAYER_PLAYED_IN_MATCH
	ON dbo.FOUL
	FOR INSERT, UPDATE
	AS
BEGIN
	if
		@@ROWCOUNT > 0
		BEGIN TRY
			IF EXISTS(
				SELECT I.PERSON_ID
				FROM inserted I
						 left join PLAYER_PLAYED_IN_MATCH PIM on i.PERSON_ID = PIM.PLAYER_PERSON_ID
					AND I.MATCH_ID = PIM.MATCH_ID
				where PIM.PLAYER_PERSON_ID is NULL
				)
				THROW 50001, 'Player didnt play in the assigned match', 1

		END TRY
		BEGIN CATCH
			THROW;
		END CATCH
END
GO

CREATE OR ALTER TRIGGER TRG_CORNER_ONLY_FOR_PLAYER_PLAYED_IN_MATCH
	ON dbo.CORNER
	FOR INSERT, UPDATE
	AS
BEGIN
	if
		@@ROWCOUNT > 0
		BEGIN TRY
			IF EXISTS(
				SELECT I.PERSON_ID
				FROM inserted I
						 left join PLAYER_PLAYED_IN_MATCH PIM on i.PERSON_ID = PIM.PLAYER_PERSON_ID
					AND I.MATCH_ID = PIM.MATCH_ID
				where PIM.PLAYER_PERSON_ID is NULL
				)
				THROW 50001, 'Player didnt play in the assigned match', 1

		END TRY
		BEGIN CATCH
			THROW;
		END CATCH
END
GO

CREATE OR ALTER TRIGGER TRG_SUBSTITUTE_IN_ONLY_FOR_PLAYER_PLAYED_IN_MATCH
	ON dbo.SUBSTITUTE
	FOR INSERT, UPDATE
	AS
BEGIN
	if
		@@ROWCOUNT > 0
		BEGIN TRY
			IF EXISTS(
				SELECT I.IN_PERSON_ID
				FROM inserted I
						 LEFT JOIN PLAYER_AS_RESERVE_IN_MATCH PAR ON PAR.PLAYER_PERSON_ID = i.IN_PERSON_ID
									   AND I.MATCH_ID = PAR.MATCH_ID
				WHERE PAR.PLAYER_PERSON_ID IS NULL
				)
				THROW 50001, 'Player didnt play in the assigned match', 1

		END TRY
		BEGIN CATCH
			THROW;
		END CATCH
END
GO

CREATE OR ALTER TRIGGER TRG_SUBSTITUTE_OUT_ONLY_FOR_PLAYER_PLAYED_IN_MATCH
	ON dbo.SUBSTITUTE
	FOR INSERT, UPDATE
	AS
BEGIN
	if
		@@ROWCOUNT > 0
		BEGIN TRY
			IF EXISTS(
				SELECT I.IN_PERSON_ID
				FROM inserted I
						 LEFT JOIN POSITION P
								   ON P.PLAYER_PERSON_ID = i.OUT_PERSON_ID
									   AND P.MATCH_ID = i.MATCH_ID
				WHERE P.PLAYER_PERSON_ID IS NULL
				)
				THROW 50001, 'Player didnt play in the assigned match', 1

		END TRY
		BEGIN CATCH
			THROW;
		END CATCH
END
GO
