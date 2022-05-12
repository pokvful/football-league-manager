CREATE or ALTER TRIGGER trg_round_max_amount ON ROUND
AFTER INSERT
AS
BEGIN
	IF @@rowcount = 0
		RETURN
	SET NOCOUNT ON

	DECLARE @roundAmt INT = 52;

	IF EXISTS(
			SELECT 1
			FROM ROUND
			GROUP BY SEASON_NAME
			HAVING COUNT(1) > @roundAmt
	)
		THROW 50000, 'Edition has more than 52 Rounds', 1
END
GO
