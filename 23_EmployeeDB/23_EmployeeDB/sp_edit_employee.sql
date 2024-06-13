-- =============================================
-- Author:		Djulizah B
-- Create date:	14-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE editEmployee (
	@id int,
	@firstName varchar(25),
	@lastName varchar(25),
	@gender varchar(10),
	@email varchar(25),
	@phone varchar(20),
	@hireDate date,
	@salary int,
	@managerId int,
	@jobId varchar(10), 
	@departmentId int
)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);

  BEGIN TRY
    UPDATE tbl_employees
	SET first_name = @firstName,
		last_name = @lastName,
		gender = @gender,
		email = @email,
		phone = @phone,
		hire_date = @hireDate,
		salary = @salary,
		manager = @managerId,
		job = @jobId,
		department = @departmentId
    WHERE id = @id;
  END TRY

  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
  END CATCH;

END;
