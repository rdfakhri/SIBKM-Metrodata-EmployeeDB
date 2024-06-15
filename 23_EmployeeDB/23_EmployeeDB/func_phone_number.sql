-- =============================================
-- Author: Djulizah B
-- Create date: 12-06-2024
-- Description:	Function to check no characters in phone number
-- =============================================

CREATE FUNCTION isNumericPhoneNumber(@phoneNumber varchar(20))
RETURNS bit AS
BEGIN
  DECLARE @isValid bit;
  SET @isValid = 1;

  -- Check if string is empty
  IF LEN(@phoneNumber) = 0
  BEGIN
    SET @isValid = 0;
    RETURN @isValid;
  END;

  -- Use PATINDEX to check for non-numeric characters
  IF PATINDEX('%[^0-9]%', @phoneNumber) > 0
  BEGIN
    SET @isValid = 0;
  END;

  RETURN @isValid;
END;
GO