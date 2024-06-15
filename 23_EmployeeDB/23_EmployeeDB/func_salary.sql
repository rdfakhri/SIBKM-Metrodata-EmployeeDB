-- =============================================
-- Author: Djulizah B
-- Create date: 10-04-2024
-- Description:	Function to check salary input not out of the range
-- =============================================

CREATE FUNCTION isValidSalary (@jobId VARCHAR(10), @salary INT) -- @jobId is not implemented
RETURNS BIT
AS
BEGIN
	DECLARE @isValid BIT;
	DECLARE @minSalary INT;
	DECLARE @maxSalary INT;
	SET @isValid = 0;

	-- min_salary > salary < max_salary
	IF @salary BETWEEN @minSalary AND @maxSalary
	SET @isValid = 1;

	RETURN @isValid;
END;