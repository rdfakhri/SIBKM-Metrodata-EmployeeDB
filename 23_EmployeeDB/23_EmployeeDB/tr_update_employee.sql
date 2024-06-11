-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
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