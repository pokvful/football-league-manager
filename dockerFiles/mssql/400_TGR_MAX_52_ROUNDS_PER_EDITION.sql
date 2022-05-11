CREATE or ALTER TRIGGER tgr_round_max_amount ON ROUND
AFTER INSERT
AS
BEGIN
	if @@rowcount = 0
		return
	set nocount on

	DECLARE @roundAmt int = 52;

	if exists(
			SELECT 1
			FROM ROUND
			GROUP BY SEASON_NAME
			HAVING COUNT(SEASON_NAME) > @roundAmt
	)
		THROW 50000, 'Edition has more than 52 Rounds', 1
END
GO
