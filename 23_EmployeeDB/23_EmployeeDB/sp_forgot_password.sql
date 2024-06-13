-- =============================================
-- Author:		Djulizah B
-- Create date: 14-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE forgotPassword (
	@email varchar,
	@newPassword varchar,
	@confirmPassword varchar,
	@otp int
)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);

  BEGIN TRY
    -- check data on tbl_employees
	-- check data on tbl_accounts
	-- is Password match
	-- is otp valid
	-- is otp used
	-- is otp expired

	UPDATE tbl_accounts
	SET password = @newPassword,
		is_used = 1
	WHERE username = @email;

  END TRY
  
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error deleting department: %s', 16, 1, @errorMessage);
  END CATCH;

END;