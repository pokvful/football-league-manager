CREATE OR ALTER TRIGGER TRG_CHECK_PLAYER_COUNT
	ON POSITION
	FOR INSERT, UPDATE
	AS
BEGIN
	IF @@ROWCOUNT > 0
		BEGIN TRY
			SELECT COUNT(M.HOME_CLUB_NAME), COUNT(M.OUT_CLUB_NAME)
			FROM POSITION AS POS
			INNER JOIN MATCH AS M
				ON POS.MATCH_ID = M.MATCH_ID
			WHERE POS.MATCH_ID IN (
				SELECT MATCH_ID
				FROM INSERTED
			)
			GROUP BY POS.MATCH_ID

			IF NOT EXISTS(
					SELECT COUNT(PLAYER_PERSON_ID)
					FROM POSITION
					GROUP BY MATCH_ID
					HAVING COUNT(*) >= 7 * 2 AND COUNT(*) <= 11 * 2
				)
				THROW 50001, 'There can only be a minimum of 14 and a maximum of 22 players in a match', 1;
		END TRY
		BEGIN CATCH
			THROW
		END CATCH
END
GO
