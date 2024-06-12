-- =============================================
-- Author:		Siti Anisa M
-- Create date: 07-06-2024
-- Description:	<Description,,>
-- =============================================

-- SP DELETE DATA JOB
CREATE PROCEDURE DeleteJob (@id varchar(10))
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @rowsAffected int;

  BEGIN TRY
    DELETE FROM tbl_jobs
    WHERE id = @id;

    SET @rowsAffected = @@ROWCOUNT;

    IF @rowsAffected = 0
      BEGIN
        RAISERROR ('Job with ID %s not found.', 10, 1, @id);
      END;
  END TRY
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error deleting job: %s', 16, 1, @errorMessage);
  END CATCH;
END;

-- USE DELETE DATA JOB
EXEC DeleteJob 
    @id = 'J001';

--RESULT DELETE DATA JOB
SELECT * FROM tbl_jobs WHERE id = 'J001';