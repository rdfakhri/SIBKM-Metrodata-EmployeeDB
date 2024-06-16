-- =============================================
-- Author: Raden Fakhri R
-- Create date: 03-06-2024
-- Description:	View for tbl_jobs
-- =============================================

CREATE VIEW job_details AS
SELECT j.id,
       j.title,
       j.min_salary,
       j.max_salary
FROM tbl_jobs j;