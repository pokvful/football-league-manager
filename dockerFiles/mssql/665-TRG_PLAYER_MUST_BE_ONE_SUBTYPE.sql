CREATE OR ALTER TRIGGER TRG_PLAYER_MUST_BE_ONE_SUBTYPE_ON_COACH
ON COACH
FOR INSERT, UPDATE
AS
BEGIN
DECLARE @rows int = @@ROWCOUNT
IF @rows > 0 AND UPDATE(PERSON_ID)
	BEGIN TRY
		DECLARE @aantCoaches int = (SELECT COUNT(*) FROM inserted i JOIN COACH c ON i.PERSON_ID = c.PERSON_ID)
		DECLARE @aantReferees int = (SELECT COUNT(*) FROM inserted i JOIN REFEREE r ON i.PERSON_ID = r.PERSON_ID)
		DECLARE @aantPlayers int = (SELECT COUNT(*) FROM inserted i JOIN PLAYER p ON i.PERSON_ID = p.PERSON_ID)

		IF not (@rows = (@aantCoaches + @aantReferees + @aantPlayers))
			THROW 50001, 'Person can only be one subtype', 1
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO
CREATE OR ALTER TRIGGER TRG_PLAYER_MUST_BE_ONE_SUBTYPE_ON_REFEREE
ON REFEREE
FOR INSERT, UPDATE
AS
BEGIN
DECLARE @rows int = @@ROWCOUNT
IF @rows > 0 AND UPDATE(PERSON_ID)
	BEGIN TRY
		DECLARE @aantCoaches int = (SELECT COUNT(*) FROM inserted i JOIN COACH c ON i.PERSON_ID = c.PERSON_ID)
		DECLARE @aantReferees int = (SELECT COUNT(*) FROM inserted i JOIN REFEREE r ON i.PERSON_ID = r.PERSON_ID)
		DECLARE @aantPlayers int = (SELECT COUNT(*) FROM inserted i JOIN PLAYER p ON i.PERSON_ID = p.PERSON_ID)

		IF not (@rows = (@aantCoaches + @aantReferees + @aantPlayers))
			THROW 50001, 'Person can only be one subtype', 1
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO
CREATE OR ALTER TRIGGER TRG_PLAYER_MUST_BE_ONE_SUBTYPE_ON_PLAYER
ON PLAYER
FOR INSERT, UPDATE
AS
BEGIN
DECLARE @rows int = @@ROWCOUNT
IF @rows > 0 AND UPDATE(PERSON_ID)
	BEGIN TRY
		DECLARE @aantCoaches int = (SELECT COUNT(*) FROM inserted i JOIN COACH c ON i.PERSON_ID = c.PERSON_ID)
		DECLARE @aantReferees int = (SELECT COUNT(*) FROM inserted i JOIN REFEREE r ON i.PERSON_ID = r.PERSON_ID)
		DECLARE @aantPlayers int = (SELECT COUNT(*) FROM inserted i JOIN PLAYER p ON i.PERSON_ID = p.PERSON_ID)

		IF not (@rows = (@aantCoaches + @aantReferees + @aantPlayers))
			THROW 50001, 'Person can only be one subtype', 1
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
