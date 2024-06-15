-- =============================================
-- Author: Djulizah B
-- Create date: 10-06-2024
-- Description:	Add "Active" status to tbl_job_histories when data in tbl_employee is inserted
-- =============================================

CREATE TRIGGER tr_insert_employee
  ON tbl_employees
  AFTER INSERT AS
BEGIN
  
  INSERT INTO tbl_job_histories (
    employee,
    start_date,
    end_date,
    status,
    job,
    department
  )
  SELECT
    inserted.id,
    GETDATE(),
    DATEADD(month, 10, GETDATE()),
    'Active',
    inserted.job,
    inserted.department
  FROM inserted;

END;
GO
