-- =============================================
-- Author:		Siti Anisa M
-- Create date: 07-06-2024
-- Description:	<Description,,>
-- =============================================

--SP DELETE DATA ROLES
CREATE PROCEDURE DeleteRole (@id int)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @rowsAffected int;

  BEGIN TRY
    DELETE FROM tbl_roles
    WHERE id = @id;

    SET @rowsAffected = @@ROWCOUNT;

    IF @rowsAffected = 0
      BEGIN
        RAISERROR ('Role with ID %d not found.', 10, 1, @id);
      END;
  END TRY
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error deleting role: %s', 16, 1, @errorMessage);
  END CATCH;
END;

--USE SP DELETE DATA ROLES
EXEC DeleteRole @id = 5;

-- RESULT SP DELETE DATA ROLES
SELECT * FROM tbl_roles;