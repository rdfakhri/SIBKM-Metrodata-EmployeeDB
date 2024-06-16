-- =============================================
-- Author: Djulizah B
-- Create date: 14-06-2024
-- Description:	Stored procedure when employee forgots password
-- =============================================

CREATE PROCEDURE forgotPassword (
  @email varchar(25),
  @newPassword varchar(255),
  @confirmPassword varchar(255),
  @otp int
)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @userId int;

  BEGIN TRY
    -- Check email exists in tbl_employees
    SELECT @userId = id FROM tbl_employees WHERE email = @email;

    IF @userId IS NULL
    BEGIN
      SET @errorMessage = 'Email not found';
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
      ELSE
      BEGIN
        -- Check OTP details in tbl_accounts linked to user
        DECLARE @isOtpValid bit, @isOtpUsed bit, @isOtpExpired bit;

        SELECT @isOtpValid = CASE WHEN otp = @otp THEN 1 ELSE 0 END,
               @isOtpUsed = is_used,
               @isOtpExpired = CASE WHEN GETDATE() > is_expired THEN 1 ELSE 0 END
        FROM tbl_accounts
        WHERE id = @userId;

        IF @isOtpValid = 0
        BEGIN
          SET @errorMessage = 'Invalid OTP';
          RAISERROR ('Error: %s', 16, 1, @errorMessage);
        END
        ELSE
        IF @isOtpUsed = 1
        BEGIN
          SET @errorMessage = 'OTP already used';
          RAISERROR ('Error: %s', 16, 1, @errorMessage);
        END
        ELSE
        IF @isOtpExpired = 1
        BEGIN
          SET @errorMessage = 'OTP expired';
          RAISERROR ('Error: %s', 16, 1, @errorMessage);
        END
        ELSE
        BEGIN
          UPDATE tbl_accounts
          SET password = @newPassword,
              is_used = 1
          WHERE id = @userId;
        END
      END
    END
  END TRY
  
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error resetting password: %s', 16, 1, @errorMessage);
  END CATCH;
END;