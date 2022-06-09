SET NOCOUNT ON;

-- Tables names separated by a `;`. If the event doesn't use `PERSON_ID` as a
-- person person id column, then you can use a `|` to specify a different
-- column, e.g. `SOME_TABLE|DIFFERENT_COLUMN`
DECLARE @event_tables VARCHAR(MAX) = 'RED_CARD;YELLOW_CARD;PASS;GOAL;SHOT;FOUL;CORNER;SUBSTITUTE|OUT_PERSON_ID';
DECLARE @result TABLE (
	code VARCHAR(MAX) NOT NULL
);

WITH tables
AS (
	SELECT
	CASE WHEN CHARINDEX('|', value) <= 0
		THEN value
		ELSE LEFT( value, CHARINDEX('|', value) - 1 )
	END AS 'table_name',
	CASE WHEN CHARINDEX('|', value) <= 0
		THEN 'PERSON_ID'
		ELSE RIGHT( value, LEN(value) - CHARINDEX('|', value) )
	END AS 'column_name'
	FROM STRING_SPLIT(@event_tables, ';')
)
INSERT INTO @result (code)
	SELECT
		'CREATE OR ALTER VIEW [VW_TOP_LIST_' + table_name + ']
		AS
		SELECT
			DENSE_RANK() OVER( ORDER BY COUNT(E.MATCH_ID) DESC ) AS ''RANK'',
			E.[' + column_name + '] AS PERSON_ID,
			C.COMPETITION_TYPE,
			COUNT(E.MATCH_ID) AS ''COUNT''
			FROM [' + table_name + '] E
			JOIN MATCH M on M.MATCH_ID = E.MATCH_ID
			JOIN COMPETITION C on C.COMPETITION_NAME = M.COMPETITION_NAME
			GROUP BY [' + column_name + '], C.COMPETITION_TYPE;'
		FROM tables;

DECLARE @code VARCHAR(MAX);
DECLARE cursor_result CURSOR FOR
	SELECT code
		FROM @result;

OPEN cursor_result;

FETCH NEXT FROM cursor_result
	INTO @code;

WHILE @@FETCH_STATUS = 0
BEGIN
	EXECUTE (@code);

	FETCH NEXT FROM cursor_result
		INTO @code;
END
