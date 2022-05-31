CREATE OR ALTER TRIGGER TRG_CHECK_PLAYER_COUNT
	ON LINEUP
	FOR INSERT, UPDATE
	AS
BEGIN
	IF @@ROWCOUNT > 0
		BEGIN TRY
			IF EXISTS(
					SELECT COUNT(PLAYER_PERSON_ID)
					FROM LINEUP
					GROUP BY MATCH_ID
					HAVING COUNT(*) > 22
				)
				THROW 50001, 'There can only be a max of 22 players in a match', 1;
		END TRY
		BEGIN CATCH
			THROW
		END CATCH
END
GO