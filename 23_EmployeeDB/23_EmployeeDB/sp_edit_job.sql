-- =============================================
-- Author:		Siti Anisa M
-- Create date: 07-06-2024
-- Description:	<Description,,>
-- =============================================

-- SP procedure Edit/Update Data Job
CREATE PROCEDURE UpdateJob (
    @id varchar(10), 
    @title varchar(35), 
    @min_salary int, 
    @max_salary int
)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @rowsAffected int;

  BEGIN TRY
    UPDATE tbl_jobs 
    SET title = @title,
        min_salary = @min_salary,
        max_salary = @max_salary
    WHERE id = @id;

    SET @rowsAffected = @@ROWCOUNT;

    IF @rowsAffected = 0
      BEGIN
        RAISERROR ('Job with ID %s not found.', 10, 1, @id);
      END;
  END TRY
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error updating job: %s', 16, 1, @errorMessage);
  END CATCH;
END;

-- USE SP EDIT/UPDATE JOB
EXEC UpdateJob 
    @id = 'J001', 
    @title = 'Senior Software Developer', 
    @min_salary = 60000, 
    @max_salary = 120000;

-- RESULT SP EDIT/UPDATE DATAJOB
SELECT * FROM tbl_jobs WHERE id = 'J001';