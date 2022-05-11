CREATE OR ALTER TRIGGER TRG_MINIMUM_PLAYERS_IN_CLUB
	ON PLAYER
	FOR INSERT, UPDATE
	AS
BEGIN
	if @@rowcount > 0
--		SET NOCOUNT ON;
		BEGIN TRY

--		if ((SELECT COUNT(*)
--			 from PLAYER P
--					  inner join inserted I on P.PERSON_ID = I.PERSON_ID
--			 WHERE p.CLUB_NAME = i.CLUB_NAME) < 11)
--			THROW 50000, 'There must be at least 11 players in a club', 1

			IF EXISTS(
				SELECT COUNT(*)
				FROM PLAYER P
				GROUP BY P.CLUB_NAME
				HAVING COUNT(*) < 11)
				THROW 50000, 'There must be at least 11 players in a club', 1
		END TRY
		BEGIN CATCH
			THROW;
		END CATCH
END
GO