-- =============================================
-- Author:	Djulizah B
-- Create date: 12-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE FUNCTION IsNumericPhoneNumber(@phoneNumber varchar(20))
RETURNS bit AS
BEGIN
  DECLARE @isValid bit;
  SET @isValid = 1; -- Assume valid initially

  -- Check if string is empty
  IF LEN(@phoneNumber) = 0
  BEGIN
    SET @isValid = 0; -- Empty string is not a valid phone number
    RETURN @isValid;
  END;

  -- Use PATINDEX to check for non-numeric characters
  IF PATINDEX('%[^0-9]%', @phoneNumber) > 0
  BEGIN
    SET @isValid = 0; -- String contains non-numeric characters
  END;

  RETURN @isValid;
END;
GO