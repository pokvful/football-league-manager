ALTER TABLE PLAYER
ADD CONSTRAINT CHK_VALID_JERSEY CHECK (JERSEY > 0 AND JERSEY < 100)
GO
