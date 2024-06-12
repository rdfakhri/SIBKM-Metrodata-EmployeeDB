-- =============================================
-- Author:		Djulizah B
-- Create date: 10-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE FUNCTION isValidGender (@gender VARCHAR(10))
RETURNS BIT
AS
BEGIN
	DECLARE @isValid BIT;
	SET @isValid = 0;

	IF @gender IN ('Male', 'Female')
	SET @isValid = 1;

	RETURN @isValid;
END;