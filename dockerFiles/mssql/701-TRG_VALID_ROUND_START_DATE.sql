CREATE OR ALTER TRIGGER TRG_VALID_ROUND_START_DATE
ON ROUND
AFTER INSERT, UPDATE
AS
DECLARE @rowCount NUMERIC;
SET @rowCount = @@ROWCOUNT;
BEGIN TRY
    IF @rowCount > 0

        IF EXISTS (
            SELECT START_DATE
            FROM ROUND
            WHERE START_DATE < (SELECT START_DATE FROM MATCHDAY)
                AND ROUND.SEASON_NAME = SEASON_NAME
        )

        RAISERROR (
            'The start date of a round must be inside the date of a season',
            16,
            1
        )

END TRY

BEGIN CATCH
    THROW;
END CATCH
