-- F-06: func_salary 
CREATE FUNCTION func_salary (@salary INT)
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