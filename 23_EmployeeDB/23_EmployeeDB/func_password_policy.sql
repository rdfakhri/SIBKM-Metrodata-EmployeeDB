-- =============================================
-- Author: Djulizah B
-- Create date: 12-06-2024
-- Description:	Function to check password requirements
-- =============================================

CREATE FUNCTION isValidPassword(@password varchar(255))
RETURNS bit AS
BEGIN
  DECLARE @isValid bit;
  SET @isValid = 0;

  -- Check minimum length
  IF LEN(@password) < 8
  BEGIN
    RETURN @isValid; -- Password too short
  END;

  -- Check for at least one uppercase letter
  DECLARE @hasUppercase bit;
  SET @hasUppercase = 0;
  DECLARE @char int = 1;

  WHILE @char <= LEN(@password) 
  BEGIN
    IF ASCII(SUBSTRING(@password, @char, 1)) >= 65 AND ASCII(SUBSTRING(@password, @char, 1)) <= 90
    BEGIN
      SET @hasUppercase = 1;
      BREAK;
    END;
    SET @char = @char + 1;
  END;

  IF @hasUppercase = 0
  BEGIN
    RETURN @isValid;
  END;

  -- Check for at least one lowercase letter
  DECLARE @hasLowercase bit;
  SET @hasLowercase = 0;
  SET @char = 1; -- Reset counter

  WHILE @char <= LEN(@password)
  BEGIN
    IF ASCII(SUBSTRING(@password, @char, 1)) >= 97 AND ASCII(SUBSTRING(@password, @char, 1)) <= 122
    BEGIN
      SET @hasLowercase = 1;
      BREAK;
    END;
    SET @char = @char + 1;
  END;

  IF @hasLowercase = 0
  BEGIN
    RETURN @isValid;
  END;

    -- Check for at least one number (digit)
  DECLARE @hasNumber bit;
  SET @hasNumber = 0;
  SET @char = 1;

  WHILE @char <= LEN(@password)
  BEGIN
    IF ASCII(SUBSTRING(@password, @char, 1)) >= 48 AND ASCII(SUBSTRING(@password, @char, 1)) <= 57
    BEGIN
      SET @hasNumber = 1;
      BREAK;
    END;
    SET @char = @char + 1;
  END;

  IF @hasNumber = 0
    BEGIN
      RETURN @isValid;
    END;

	-- Check for at least one symbol
  DECLARE @hasSymbol bit;
  SET @hasSymbol = 0;
  SET @char = 1;

  WHILE @char <= LEN(@password)
  BEGIN
    -- Check for any character that is not a letter, number, or underscore
    IF (ASCII(SUBSTRING(@password, @char, 1)) < 48 OR ASCII(SUBSTRING(@password, @char, 1)) > 57) AND 
       (ASCII(SUBSTRING(@password, @char, 1)) < 65 OR ASCII(SUBSTRING(@password, @char, 1)) > 90) AND 
       (ASCII(SUBSTRING(@password, @char, 1)) < 97 OR ASCII(SUBSTRING(@password, @char, 1)) > 122) AND
       ASCII(SUBSTRING(@password, @char, 1)) <> 95  -- Exclude underscore
    BEGIN
      SET @hasSymbol = 1;
      BREAK;
    END;
    SET @char = @char + 1;
  END;

  IF @hasSymbol = 0
    BEGIN
      RETURN @isValid;
    END;

  -- All criteria met
  SET @isValid = 1;
  RETURN @isValid;
END;
GO