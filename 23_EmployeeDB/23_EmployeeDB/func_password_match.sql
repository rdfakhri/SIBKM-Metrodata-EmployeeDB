-- =============================================
-- Author: Djulizah B
-- Create date: 10-06-2024
-- Description:	Function to match password and confirmation password field
-- =============================================

CREATE FUNCTION isPasswordMatch (@password VARCHAR(255), @confirmPassword VARCHAR(255))
RETURNS BIT
AS
BEGIN
	DECLARE @isValid BIT;
	SET @isValid = 0;
	
	IF (@password = @confirmPassword)
	SET @isValid = 1;
	
	RETURN @isValid;
END;