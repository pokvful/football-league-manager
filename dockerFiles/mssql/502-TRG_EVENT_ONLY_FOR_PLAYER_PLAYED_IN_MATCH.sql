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
				SELECT COUNT(i.PERSON_ID)
				FROM inserted I
			    WHERE NOT EXISTS(
					SELECT PIM.PLAYER_PERSON_ID
					FROM PLAYER_PLAYED_IN_MATCH PIM
					)
			    )
		    THROW 50001, 'Player didnt play in the asigned match', 1

		END TRY
		BEGIN CATCH
			THROW;
		END CATCH
END
GO


