-- =============================================
-- Author:		Djulizah B
-- Create date: 12-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE FUNCTION isValidEmail(@email varchar(255))
RETURNS bit AS
BEGIN
  DECLARE @isValid bit;
  SET @isValid = 0; -- Initialize to false

  -- Check for presence of "@" and "." symbols
  IF (CHARINDEX('@', @email) > 0 AND CHARINDEX('.', @email) > CHARINDEX('@', @email)) 
  BEGIN
    SET @isValid = 1; -- Potentially valid if "@" and "." are present in correct positions
  END;

  RETURN @isValid;
END;
GO