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
	PRINT 'Login Sukses'
	-- check data on tbl_account
    
  END TRY

  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error deleting department: %s', 16, 1, @errorMessage);
  END CATCH;

END;