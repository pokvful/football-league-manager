IF NOT EXISTS(SELECT 1 FROM systypes WHERE NAME='StringList')
   CREATE TYPE StringList AS TABLE(string SYSNAME)
GO
IF NOT EXISTS(SELECT 1 FROM systypes WHERE NAME = 'ColumnTable')
	CREATE TYPE ColumnTable AS TABLE(nameColumn SYSNAME NOT NULL, typeColumn SYSNAME, nullable SYSNAME)
GO
	CREATE OR ALTER FUNCTION FUNC_TURN_COLUMN_TABLE_INTO_STRING
	(@processTable ColumnTable NULL READONLY)
	RETURNS VARCHAR(MAX)
	BEGIN
		DECLARE @returnValue VARCHAR(MAX) = ' '
			SELECT @returnValue = CONCAT( @returnValue, ' , ', 
			UPPER(nameColumn), '	', UPPER(typeColumn), '	', UPPER(nullable))
			FROM @processTable
		RETURN @returnValue
	END
GO

-- Warning this will overwrite existings tables!
CREATE OR ALTER PROCEDURE ADD_NEW_EVENT_TYPE(
@newEventName varchar(MAX),
@extraColumns ColumnTable NULL READONLY)
AS
BEGIN
SET NOCOUNT ON
DECLARE @savepoint VARCHAR(128) =	CAST(OBJECT_NAME(@@PROCID) AS VARCHAR(125)) + 
									CAST(@@NESTLEVEL AS VARCHAR(3))
DECLARE @startTranCount INT = @@TRANCOUNT;
IF @startTranCount > 0  
	SAVE TRANSACTION @savepoint
ELSE
	BEGIN TRANSACTION

BEGIN TRY
	DECLARE @generatedSqlTable varchar(MAX)
	SET @generatedSqlTable =	CONCAT('
								IF EXISTS (	SELECT 1
											FROM SYSOBJECTS
											WHERE ID = OBJECT_ID(''', 	@newEventName, ''')',
											'AND TYPE = ''U'') ',
									'DROP TABLE ', @newEventName , ' ;',

								'CREATE TABLE ', @newEventName, '( ',
									'MATCH_ID	G_IDENTITY		NOT NULL, ',
									'TIME		MINUTE_IN_MATCH	NOT NULL, ',
									'PERSON_ID	PERSON_ID		NOT NULL  ', -- IN CDM IT SAYS EVENT ALWAYS HAS A PERSON
									dbo.FUNC_TURN_COLUMN_TABLE_INTO_STRING (@extraColumns), 
								' );')

	EXEC (@generatedSqlTable)


	DECLARE @generatedSqlForeignKey varchar(MAX)
	SET @generatedSqlForeignKey = CONCAT(
	  'ALTER TABLE ', @newEventName,
		   ' ADD CONSTRAINT FK_',@newEventName,'_EVENT_HAP_MATCH FOREIGN KEY (MATCH_ID) ',
			  'REFERENCES MATCH (MATCH_ID) 
				 ON UPDATE CASCADE;')
	EXEC (@generatedSqlForeignKey)

	SET @generatedSqlForeignKey = CONCAT(
		  'ALTER TABLE ', @newEventName,
		   ' ADD CONSTRAINT FK_',@newEventName,'_PERSON_IN_PERSON FOREIGN KEY (PERSON_ID) ',
			  'REFERENCES PERSON (PERSON_ID) 
				 ON UPDATE CASCADE;')
	EXEC (@generatedSqlForeignKey)
	
	EXEC dbo.PROC_CREATE_CHECK_TIME_EVENT @newEventName

	IF @startTranCount = 0
		COMMIT TRANSACTION; 
END TRY
BEGIN CATCH
		IF XACT_STATE() = -1 OR  @startTranCount = 0
		BEGIN 
			ROLLBACK TRANSACTION
		END
		ELSE
		BEGIN
			IF XACT_STATE() = 1
			BEGIN 
				ROLLBACK TRANSACTION @savepoint;
			END;
		END;
		THROW

END CATCH
END
GO
CREATE OR ALTER PROCEDURE PROC_CREATE_CHECK_TIME_EVENT
(@table SYSNAME)
AS
BEGIN
SET NOCOUNT ON
DECLARE @savepoint VARCHAR(128) =	CAST(OBJECT_NAME(@@PROCID) AS VARCHAR(125)) + 
									CAST(@@NESTLEVEL AS VARCHAR(3))
DECLARE @startTranCount INT = @@TRANCOUNT;
IF @startTranCount > 0  
	SAVE TRANSACTION @savepoint
ELSE
	BEGIN TRANSACTION

BEGIN TRY
	DECLARE @generatedSqlCheck varchar(MAX) = CONCAT( 
		'ALTER TABLE ', @table,
		' ADD CONSTRAINT CHK_VALID_MINUTE_IN_MATCH_', @table, ' CHECK (TIME >= 0);')

	EXEC (@generatedSqlCheck)
END TRY
BEGIN CATCH
		IF XACT_STATE() = -1 OR  @startTranCount = 0
		BEGIN 
			ROLLBACK TRANSACTION
		END
		ELSE
		BEGIN
			IF XACT_STATE() = 1
			BEGIN 
				ROLLBACK TRANSACTION @savepoint;
			END;
		END;
		THROW
END CATCH
END

GO
