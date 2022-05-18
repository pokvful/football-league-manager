CREATE OR ALTER TRIGGER TRG_MINIMUM_PLAYERS_IN_CLUB
	ON PLAYER
	FOR INSERT, UPDATE
	AS
BEGIN
	DECLARE @minimalPlayer int

	set @minimalPlayer = 11
	if @@rowcount > 0
		BEGIN TRY
		    IF EXISTS(
		    	SELECT COUNT(*)
				FROM PLAYER P
				inner join inserted I on P.PERSON_ID = I.PERSON_ID
				GROUP BY P.CLUB_NAME
		        HAVING COUNT(*) < @minimalPlayer)
				THROW 50001, 'There must be at least 11 players in a club', 1
		END TRY
		BEGIN CATCH
			THROW;
		END CATCH
END
GO