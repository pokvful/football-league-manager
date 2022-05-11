CREATE OR ALTER TRIGGER TRG_MINIMUM_PLAYERS_IN_CLUB
    ON PLAYER
    FOR INSERT, UPDATE
    AS
BEGIN TRY
    SET NOCOUNT ON;
        DECLARE @ClubName VARCHAR(255)

        SELECT @ClubName = I.CLUB_NAME
        from inserted I

        if ((SELECT COUNT(*)
             from PLAYER
             where CLUB_NAME = @ClubName) < 11)
        THROW 50000, 'There must be at least 11 players in a club', 1
END TRY

BEGIN CATCH
    THROW;
END CATCH

GO