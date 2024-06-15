-- =============================================
-- Author: Djulizah B
-- Create date: 10-04-2024
-- Description:	Add "Resign" status to tbl_job_histories when data in tbl_employee is deleted
-- =============================================

CREATE TRIGGER tr_delete_employee
  ON tbl_employees
  AFTER DELETE AS
BEGIN
  DECLARE @employeeId int;
  
  SELECT @employeeId = (SELECT TOP 1 deleted.id FROM deleted);

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
    'Resign',
    deleted.job,
    deleted.department
  FROM deleted;  

END;
GO