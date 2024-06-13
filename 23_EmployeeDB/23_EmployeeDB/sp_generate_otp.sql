-- =============================================
-- Author:		Djulizah B
-- Create date: 14-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE generateOtp (@email varchar)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);

  BEGIN TRY
    -- check data on tbl_employee
	-- email validation
	-- generate otp
	UPDATE tbl_accounts
	SET otp = 999,
		is_used = 0,
		is_expired = GETDATE() --add 10 minutes
	WHERE email = @email;
	--print otp
  END TRY
  
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error deleting department: %s', 16, 1, @errorMessage);
END CATCH;

END;