CREATE OR ALTER TRIGGER TRG_MINIMUM_PLAYERS_IN_CLUB
	ON PLAYER
	FOR INSERT, UPDATE
	AS
BEGIN
	DECLARE @minimalPlayer int

	set @minimalPlayer = 11
	IF @@ROWCOUNT = 0
		RETURN
	SET NOCOUNT ON
	BEGIN TRY
		IF EXISTS(
			SELECT totalPlayer.CLUB_NAME,
				   COUNT(*)
			FROM (SELECT *
				  FROM PLAYER P
				  UNION
				  SELECT *
				  FROM inserted I) AS totalPlayer
			GROUP BY CLUB_NAME
			HAVING COUNT(*) < @minimalPlayer)
			THROW 50001, 'There must be at least 11 players in a club', 1
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END
GO