-- =============================================
-- Author: Djulizah B
-- Create date: 15-06-2024
-- Description:	Stored procedure to edit password
-- =============================================

CREATE PROCEDURE editPassword (
  @email varchar(25),
  @password varchar,
  @newPassword varchar(255),
  @confirmPassword varchar(255)
)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @userId int;

  BEGIN TRY
    -- Check email exists in tbl_accounts
    SELECT @userId = id FROM tbl_accounts WHERE username = @email;

    IF @userId IS NULL
    BEGIN
      SET @errorMessage = 'Username not found';
      RAISERROR ('Error: %s', 16, 1, @errorMessage);
    END
    ELSE
    BEGIN
      -- Validate new password (call IsValidPassword function)
      DECLARE @isValidPassword bit;
      SET @isValidPassword = dbo.isValidPassword(@newPassword);

      IF @isValidPassword = 0
      BEGIN
        SET @errorMessage = 'Invalid new password requirements';
        RAISERROR ('Error: %s', 16, 1, @errorMessage);
      END
      ELSE IF @newPassword <> @confirmPassword
      BEGIN
        SET @errorMessage = 'New password and confirm password do not match';
        RAISERROR ('Error: %s', 16, 1, @errorMessage);
      END
      ELSE
      BEGIN
        -- Update password only if new password and confirm password match
        UPDATE tbl_accounts
        SET password = @newPassword
        WHERE id = @userId;
      END
    END
  END TRY

  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error resetting password: %s', 16, 1, @errorMessage);
  END CATCH;
END;

EXEC editPassword 
  @email = 'a@metrodata.co',
  @password =  'Csr_1234',
  @newPassword = 'cSR_1234',
  @confirmPassword = 'cSR_1234'

  select * from tbl_accounts