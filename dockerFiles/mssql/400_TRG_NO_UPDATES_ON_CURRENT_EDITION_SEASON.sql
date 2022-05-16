CREATE or ALTER TRIGGER TRG_NO_UPDATES_ON_CURRENT_EDITION_CLUB ON SEASON
AFTER UPDATE, DELETE ,INSERT
AS
BEGIN
	IF @@rowcount = 0
		RETURN
	SET NOCOUNT ON

	IF EXISTS(
	    SELECT 1
		FROM inserted
	    WHERE END_DATE < GETDATE()
	)
		THROW 50000, 'Season is still active, cannot update data', 1

    IF EXISTS(
        SELECT 1
        FROM deleted
        WHERE END_DATE < GETDATE()
	)
		THROW 50000, 'Season is still active, cannot delete data', 1
END
GO