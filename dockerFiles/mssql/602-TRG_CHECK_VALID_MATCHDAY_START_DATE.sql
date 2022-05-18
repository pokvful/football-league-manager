CREATE OR ALTER TRIGGER TRG_CHECK_VALID_MATCHDAY_START_DATE ON MATCHDAY
FOR INSERT, UPDATE
AS
BEGIN
IF @@ROWCOUNT > 0 AND (UPDATE(MATCH_DAY) OR UPDATE([START_DATE]))
	BEGIN TRY
	IF EXISTS (SELECT 1 FROM inserted i
				WHERE i.MATCH_DAY < i.START_DATE
				OR i.MATCH_DAY >= (SELECT MIN(r.START_DATE) 
									FROM [ROUND] r 
									WHERE r.COMPETITION_NAME = i.COMPETITION_NAME
									AND r.SEASON_NAME = i.SEASON_NAME
									AND r.START_DATE > i.START_DATE) -- get all the following rounds and get the next startdate.
				)
		THROW 50001, 'match_day needs to be higher or equal than startdate dependent round and smaller then the next round startdate', 1
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
