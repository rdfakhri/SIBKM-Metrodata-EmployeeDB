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
-- Author:		Gemini, Harada
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE TRIGGER tr_insert_employee
  ON tbl_employees
  AFTER INSERT AS
BEGIN
  -- SET NOCOUNT ON is not necessary here
  
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
