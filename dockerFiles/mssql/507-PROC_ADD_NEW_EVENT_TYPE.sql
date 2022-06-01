IF NOT EXISTS(SELECT 1 FROM systypes WHERE NAME='StringList')
   CREATE TYPE StringList AS TABLE(string SYSNAME)
GO
IF NOT EXISTS(SELECT 1 FROM systypes WHERE NAME = 'ColumnTable')
	CREATE TYPE ColumnTable AS TABLE(nameColumn SYSNAME NOT NULL, typeColumn SYSNAME, nullable SYSNAME)
GO
	CREATE OR ALTER FUNCTION FUNC_TURN_COLUMN_TABLE_INTO_STRING
	(@processTable ColumnTable READONLY)
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
@whichPersonTypes StringList READONLY,
@extraColumns ColumnTable READONLY)
AS
BEGIN
SET NOCOUNT ON
DECLARE @savepoint VARCHAR(128) =	CAST(OBJECT_NAME(@@PROCID) AS VARCHAR(125)) + 
									CAST(@@NESTLEVEL AS VARCHAR(3))
DECLARE @startTranCount INT = @@TRANCOUNT;
BEGIN TRY
	SAVE TRAN @savepoint
	DECLARE @generatedSqlTable varchar(MAX)
	SET @generatedSqlTable =	CONCAT('
								IF EXISTS (	SELECT 1
											FROM SYSOBJECTS
											WHERE ID = OBJECT_ID(''', 	@newEventName, ''')',
											'AND TYPE = ''U'')',
									'DROP TABLE ', @newEventName , ' ;',

								'CREATE TABLE ', @newEventName, '( ',
									'MATCH_ID	G_IDENTITY		NOT NULL, ',
									'TIME		MINUTE_IN_MATCH	NOT NULL, ',
									'PERSON_ID	PERSON_ID		NOT NULL  ', -- IN CDM IT SAYS EVENT ALWAYS HAS A PERSON
									dbo.FUNC_TURN_COLUMN_TABLE_INTO_STRING (@extraColumns), 
								' );')

	EXEC (@generatedSqlTable)
/*
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SHOT') and o.name = 'FK_SHOT_EVENT_HAP_MATCH')
alter table SHOT
   drop constraint FK_SHOT_EVENT_HAP_MATCH


   alter table SHOT
   add constraint FK_SHOT_EVENT_HAP_MATCH foreign key (MATCH_ID)
      references MATCH (MATCH_ID)
         on update cascade
*/
END TRY
BEGIN CATCH
		IF XACT_STATE() = -1 AND @startTranCount = 0
		BEGIN 
			ROLLBACK TRANSACTION
		END
		ELSE
		BEGIN
			IF XACT_STATE() = 1
			BEGIN 
				ROLLBACK TRANSACTION @savepoint;
				COMMIT TRANSACTION;
			END;
		END;
END CATCH
END

/*
if exists (select 1
            from  sysobjects
           where  id = object_id('SHOT')
            and   type = 'U')
   drop table SHOT
go
*/
/* create table SHOT (
   MATCH_ID             G_IDENTITY           not null,
   TIME                 MINUTE_IN_MATCH      not null,
   PERSON_ID            PERSON_ID            not null,
   ON_GOAL              BOOLEAN              not null,
   constraint PK_SHOT primary key (MATCH_ID, TIME)
)
go*/



EXEC dbo.ADD_NEW_EVENT_TYPE 'yo'