CREATE or ALTER TRIGGER trg_round_max_amount ON ROUND
AFTER INSERT
AS
BEGIN
	if @@rowcount = 0
		return
	set nocount on

	DECLARE @roundAmt int;
	SET @roundAmt = 52;

	if exists(
			SELECT SEASON_NAME
			FROM ROUND
			GROUP BY SEASON_NAME
			HAVING COUNT(SEASON_NAME) > @roundAmt
	)
		THROW 50000, 'Edition has more than 52 rounds', 1
END
GO
