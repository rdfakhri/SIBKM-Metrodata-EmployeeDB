-- =============================================
-- Author:		Djulizah B
-- Create date: 14-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE login (@username varchar, @password varchar)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);


  BEGIN TRY
	-- check data on tbl_employee
    IF @username = (SELECT email FROM tbl_employees where email = @username)
	AND
	-- check data on tbl_account
	@username = (SELECT username FROM tbl_accounts where username = @username)
	PRINT 'Login Success!'
	ELSE PRINT 'Account Not Registered!'
    
  END TRY

  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error login: %s', 16, 1, @errorMessage);
  END CATCH;

END;
