CREATE or ALTER TRIGGER TRG_NO_UPDATES_ON_CURRENT_EDITION_CLUB ON CLUB
AFTER UPDATE, DELETE ,INSERT
AS
BEGIN
	IF @@rowcount = 0
		RETURN
	SET NOCOUNT ON

	IF EXISTS(
		SELECT 1
		FROM inserted i
		JOIN CLUB_PLAYS_IN_EDITION CPIE on i.CLUB_NAME = CPIE.CLUB_NAME
		JOIN EDITION E on CPIE.SEASON_NAME = E.SEASON_NAME and CPIE.COMPETITION_NAME = E.COMPETITION_NAME
		JOIN SEASON S on E.SEASON_NAME = S.SEASON_NAME
		WHERE S.END_DATE < GETDATE()
	)
		THROW 50000, 'Season is still active, cannot update data', 1

    IF EXISTS(
		SELECT 1
		FROM deleted d
		JOIN CLUB_PLAYS_IN_EDITION CPIE on d.CLUB_NAME = CPIE.CLUB_NAME
		JOIN EDITION E on CPIE.SEASON_NAME = E.SEASON_NAME and CPIE.COMPETITION_NAME = E.COMPETITION_NAME
		JOIN SEASON S on E.SEASON_NAME = S.SEASON_NAME
		WHERE S.END_DATE < GETDATE()
	)
		THROW 50000, 'Season is still active, cannot delete data', 1
END
GO