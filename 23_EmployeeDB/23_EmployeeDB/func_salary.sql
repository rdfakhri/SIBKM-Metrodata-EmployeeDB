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

	-- Retrieve min and max salary based on @jobId
	SELECT @minSalary = min_salary, @maxSalary = max_salary
	FROM tbl_jobs 
	WHERE id = @jobId;  

	-- min_salary > salary < max_salary
	IF @salary BETWEEN @minSalary AND @maxSalary
	SET @isValid = 1;

	RETURN @isValid;
END;