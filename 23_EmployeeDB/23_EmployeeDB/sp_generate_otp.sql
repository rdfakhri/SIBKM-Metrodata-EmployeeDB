-- =============================================
-- Author:		Djulizah B
-- Create date: 14-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE generateOtp (@email varchar(25))
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @userId int;

  BEGIN TRY
    -- Check email exists in tbl_accounts
    SELECT @userId = id FROM tbl_accounts WHERE username = @email;

    IF @userId IS NOT NULL
    BEGIN
      -- Generate random 6-digit OTP (adjusted for int data type)
      DECLARE @otp int;
      SET @otp = FLOOR(1000000 * RAND()) + 1;

      -- Update tbl_accounts with OTP and expiration
      UPDATE tbl_accounts
      SET otp = @otp,
          is_used = 0,
          is_expired = DATEADD(minute, 10, GETDATE())
      WHERE id = @userId;

      -- Print OTP
      PRINT 'Generated OTP: ' + CAST(@otp AS varchar(6));

    END
    ELSE
      SET @errorMessage = 'Account Not Registered!';
      RAISERROR ('Error: %s', 16, 1, @errorMessage);
    END TRY

    BEGIN CATCH
      SET @errorMessage = ERROR_MESSAGE();
      RAISERROR ('Error generating OTP: %s', 16, 1, @errorMessage);
    END CATCH;
END;
