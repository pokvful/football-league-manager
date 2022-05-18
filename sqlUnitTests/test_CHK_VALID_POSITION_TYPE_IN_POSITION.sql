EXEC TSQLT.NewTestClass @ClassName = test_CHK_VALID_POSITION_TYPE_IN_POSITION

GO

CREATE OR ALTER PROCEDURE test_CHK_VALID_POSITION_TYPE_IN_POSITION.SETUP
AS
BEGIN
	EXEC TSQLT.FakeTable 'dbo.POSITION'

	EXEC TSQLT.ApplyConstraint
		 @TableName = 'dbo.POSITION', @ConstraintName = 'CHK_VALID_POSITION_TYPE_IN_POSITION'
END

GO

CREATE OR ALTER PROCEDURE test_CHK_VALID_POSITION_TYPE_IN_POSITION.[test_CHK_VALID_POSITION_TYPE_IN_POSITION_ATTACKER_SUCCESS]
AS
BEGIN
	EXEC TSQLT.ExpectNoException

	INSERT INTO dbo.POSITION(PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES (1, 1, 'ATTACKER')
END

GO

CREATE OR ALTER PROCEDURE test_CHK_VALID_POSITION_TYPE_IN_POSITION.[test_CHK_VALID_POSITION_TYPE_IN_POSITION_KEEPER_SUCCESS]
AS
BEGIN
	EXEC TSQLT.ExpectNoException

	INSERT INTO dbo.POSITION(PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES (1, 1, 'KEEPER')
END

GO

CREATE OR ALTER PROCEDURE test_CHK_VALID_POSITION_TYPE_IN_POSITION.[test_CHK_VALID_POSITION_TYPE_IN_POSITION_MIDFIELDER_SUCCESS]
AS
BEGIN
	EXEC TSQLT.ExpectNoException

	INSERT INTO dbo.POSITION(PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES (1, 1, 'MIDFIELDER')
END

GO

CREATE OR ALTER PROCEDURE test_CHK_VALID_POSITION_TYPE_IN_POSITION.[test_CHK_VALID_POSITION_TYPE_IN_POSITION_DEFENDER_SUCCESS]
AS
BEGIN
	EXEC TSQLT.ExpectNoException

	INSERT INTO dbo.POSITION(PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES (1, 1, 'DEFENDER')
END

GO

CREATE OR ALTER PROCEDURE test_CHK_VALID_POSITION_TYPE_IN_POSITION.[test_CHK_VALID_POSITION_TYPE_IN_POSITION_DEFENDER_FAILS]
AS
BEGIN
	EXEC TSQLT.ExpectException

	INSERT INTO dbo.POSITION(PLAYER_PERSON_ID, MATCH_ID, POSITION_TYPE)
	VALUES (1, 1, 'BANAAN')
END

GO

TSQLT.Run test_CHK_VALID_POSITION_TYPE_IN_POSITION