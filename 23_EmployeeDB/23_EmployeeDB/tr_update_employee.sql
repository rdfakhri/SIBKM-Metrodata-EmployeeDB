-- =============================================
-- Author:		Djulizah B
-- Create date: 10-04-2024
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER tr_update_employee
  ON tbl_employees
  AFTER UPDATE AS
BEGIN
  DECLARE @employeeId int;
  
  SELECT @employeeId = (SELECT TOP 1 deleted.id FROM deleted); -- Get employee ID from deleted row

  -- Insert record with "Hand Over" status for previous job
  INSERT INTO tbl_job_histories (
    employee,
    start_date,
    end_date,
    status,
    job,
    department
  )
  SELECT
    @employeeId,
    (SELECT MAX(end_date) FROM tbl_job_histories WHERE employee = @employeeId),
    GETDATE(),
    'Hand Over',
    deleted.job,
    deleted.department
  FROM deleted;  
END;
GO