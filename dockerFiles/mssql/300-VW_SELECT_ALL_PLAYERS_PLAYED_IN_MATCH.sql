CREATE OR ALTER VIEW [PLAYER_PLAYED_IN_MATCH] AS
	SELECT P.PLAYER_PERSON_ID, P.MATCH_ID
	FROM LINEUP P
	UNION
	SELECT PAR.PLAYER_PERSON_ID, PAR.MATCH_ID
	FROM PLAYER_AS_RESERVE_IN_MATCH PAR;
