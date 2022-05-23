CREATE OR ALTER PROCEDURE GET_SCORE_EDITION 
(@season SEASON_NAME, @competition COMPETITION_NAME)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT * FROM SCORE_EDITIONS WHERE COMPETITION_NAME = @competition AND SEASON_NAME = @season
END