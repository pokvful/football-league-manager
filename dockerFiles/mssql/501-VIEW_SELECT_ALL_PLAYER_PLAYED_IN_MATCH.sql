CREATE VIEW [PLAYER_PLAYED_IN_MATCH] AS
    SELECT P.PLAYER_PERSON_ID, P.MATCH_ID
	FROM POSITION P
	UNION
	SELECT S.IN_PERSON_ID, S.MATCH_ID
	FROM SUBSTITUTE S;