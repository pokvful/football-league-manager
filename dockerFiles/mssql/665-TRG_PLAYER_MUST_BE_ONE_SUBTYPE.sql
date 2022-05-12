CREATE OR ALTER TRIGGER TRG_PLAYER_MUST_BE_ONE_SUBTYPE_ON_COACH
ON COACH
FOR INSERT, UPDATE
AS
BEGIN
DECLARE @rows int = @@ROWCOUNT
IF @rows > 0 AND UPDATE(PERSON_ID)
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM inserted i 
					WHERE EXISTS (SELECT 1 FROM REFEREE r WHERE r.PERSON_ID = i.PERSON_ID) 
					OR EXISTS (SELECT 1 FROM PLAYER p WHERE p.PERSON_ID = i.PERSON_ID))
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
		IF EXISTS (SELECT 1 FROM inserted i 
					WHERE EXISTS (SELECT 1 FROM COACH c WHERE c.PERSON_ID = i.PERSON_ID) 
					OR EXISTS (SELECT 1 FROM PLAYER p WHERE p.PERSON_ID = i.PERSON_ID))
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
		IF EXISTS (SELECT 1 FROM inserted i 
					WHERE EXISTS (SELECT 1 FROM COACH c WHERE c.PERSON_ID = i.PERSON_ID) 
					OR EXISTS (SELECT 1 FROM REFEREE r WHERE r.PERSON_ID = i.PERSON_ID))
			THROW 50001, 'Person can only be one subtype', 1
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END