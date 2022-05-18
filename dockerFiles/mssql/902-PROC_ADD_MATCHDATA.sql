CREATE OR ALTER PROCEDURE PROC_ADD_MATCHDATA_RED_CARD(
	@match_id g_identity,
	@time minute_in_match,
	@person_id person_id
)
AS
BEGIN
    SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO red_card (match_id, time, person_id)
		VALUES (@match_id, @time, @person_id);
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO

CREATE OR ALTER PROCEDURE PROC_ADD_MATCHDATA_YELLOW_CARD(
	@match_id g_identity,
	@time minute_in_match,
	@person_id person_id
)
AS
BEGIN
    SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO yellow_card (match_id, time, person_id)
		VALUES (@match_id, @time, @person_id);
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO

CREATE OR ALTER PROCEDURE PROC_ADD_MATCHDATA_PASS(
	@match_id g_identity,
	@time minute_in_match,
	@person_id person_id,
	@success boolean
)
AS
BEGIN
    SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO pass (match_id, time, person_id, succes)
		VALUES (@match_id, @time, @person_id, @success);
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO

CREATE OR ALTER PROCEDURE PROC_ADD_MATCHDATA_GOAL(
	@match_id g_identity,
	@time minute_in_match,
	@person_id person_id
)
AS
BEGIN
    SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO goal (match_id, time, person_id)
		VALUES (@match_id, @time, @person_id);
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO

CREATE OR ALTER PROCEDURE PROC_ADD_MATCHDATA_SHOT(
	@match_id g_identity,
	@time minute_in_match,
	@person_id person_id,
	@on_goal boolean
)
AS
BEGIN
    SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO shot (match_id, time, person_id, on_goal)
		VALUES (@match_id, @time, @person_id, @on_goal);
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO

CREATE OR ALTER PROCEDURE PROC_ADD_MATCHDATA_FOUL(
	@match_id g_identity,
	@time minute_in_match,
	@person_id person_id
)
AS
BEGIN
    SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO foul (match_id, time, person_id)
		VALUES (@match_id, @time, @person_id);
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO

CREATE OR ALTER PROCEDURE PROC_ADD_MATCHDATA_CORNER(
	@match_id g_identity,
	@time minute_in_match,
	@person_id person_id
)
AS
BEGIN
    SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO corner (match_id, time, person_id)
		VALUES (@match_id, @time, @person_id);
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO

CREATE OR ALTER PROCEDURE PROC_ADD_MATCHDATA_CORNER(
	@match_id g_identity,
	@time minute_in_match,
	@person_id person_id
)
AS
BEGIN
    SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO corner (match_id, time, person_id)
		VALUES (@match_id, @time, @person_id);
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO

CREATE OR ALTER PROCEDURE PROC_ADD_MATCHDATA_SUBSTITUTE(
	@match_id g_identity,
	@time minute_in_match,
	@in_person_id person_id,
	@out_person_id person_id
)
AS
BEGIN
    SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO substitute (match_id, time, in_person_id, out_person_id)
		VALUES (@match_id, @time, @in_person_id, @out_person_id);
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO
