-- =============================================
-- Author: Djulizah B, Raden Fakhri R, Siti Anisa M
-- Create date: 12-06-2024
-- Description:	Stored procedure to add data in tbl_attendance
-- =============================================

CREATE PROCEDURE addAttendance (
	@employee int, 
	@email varchar(25)
)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @employeeId int;

  BEGIN TRY
    -- Check if employee exists using EXISTS operator
    SELECT TOP 1 @employeeId = id
    FROM tbl_employees
    WHERE id = @employee;

    IF @employeeId IS NULL
    BEGIN
      SET @errorMessage = 'Employee ID does not exist.';
      RAISERROR ('Error adding attendance: %s', 16, 1, @errorMessage);
      RETURN; 
    END;

    -- Insert attendance data
    INSERT INTO tbl_attendances (employee, email)
    VALUES (@employee, @email);
  END TRY

  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error adding attendance: %s', 16, 1, @errorMessage);
  END CATCH;
END;