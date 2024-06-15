-- =============================================
-- Author: Djulizah B
-- Create date: 12-06-2024
-- Description:	Function to check email format
-- =============================================

CREATE FUNCTION isValidEmail(@email varchar(25)) -- varchar size referenced from tbl_employee email
RETURNS bit AS
BEGIN
  DECLARE @isValid bit;
  SET @isValid = 0;

  -- Check for presence of "@" and "." symbols
  IF (CHARINDEX('@', @email) > 0 AND CHARINDEX('.', @email) > CHARINDEX('@', @email)) 
  BEGIN
    SET @isValid = 1;
  END;

  RETURN @isValid;
END;
GO