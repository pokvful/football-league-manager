CREATE OR ALTER TRIGGER TRG_ONE_COACH_PER_CLUB
    ON CLUB
    FOR INSERT, UPDATE
    AS
BEGIN
    IF @@ROWCOUNT = 0
        RETURN
    SET NOCOUNT ON

    BEGIN TRY
        IF EXISTS(
                SELECT COACH_PERSON_ID, COUNT(COACH_PERSON_ID)
                FROM CLUB
                GROUP BY COACH_PERSON_ID
                HAVING COUNT(COACH_PERSON_ID) > 1
            )
            THROW 50001, 'Coach may only have one team!', 1;
    END TRY
    BEGIN CATCH
        THROW
    END CATCH
END
GO
