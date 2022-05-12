exec TSQLT.NEWTESTCLASS 'TRG_CHECK_ALL_EVENTS'
go

CREATE
OR
ALTER PROCEDURE
[TRG_CHECK_ALL_EVENTS].[Test pass only for player played in match passed]
	AS
BEGIN
--Assemble
    EXEC tSQLt.FakeTable 'dbo', PASS;
    EXEC tSQLt.FakeTable 'dbo', POSITION;
    EXEC tSQLt.FakeTable 'dbo', SUBSTITUTE;

    INSERT INTO POSITION (PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
    VALUES (1, 1, 'ATTACK'),
           (2, 1, 'DEFFEBDER')

    INSERT INTO SUBSTITUTE (MATCH_ID, TIME, IN_PERSON_ID, OUT_PERSON_ID)
    VALUES (1, 45, 5, 2),
           (1, 86, 12, 1)

	EXEC [tSQLt].[ApplyTrigger] @tablename = 'dbo.PASS', @triggername = 'TRG_PASS_ONLY_FOR_PLAYER_PLAYED_IN_MATCH]'

--Act
	EXEC [tSQLt].[ExpectNoException]
	INSERT INTO dbo.PASS(MATCH_ID, TIME, PERSON_ID, SUCCES)
	VALUES (1, 35, 1, 'yes')
--Assert
END
GO

EXEC tSQLt.Run[TRG_CHECK_ALL_EVENTS]