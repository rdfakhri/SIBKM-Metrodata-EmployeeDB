-- =============================================
-- Author:		Siti Anisa M
-- Create date: 07-06-2024
-- Description:	<Description,,>
-- =============================================

-- SP EDIT/UPDATE DATA ROLES
CREATE PROCEDURE UpdateRole (
    @id int, 
    @name varchar(50)
)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @rowsAffected int;

  BEGIN TRY
    UPDATE tbl_roles 
    SET name = @name
    WHERE id = @id;

    SET @rowsAffected = @@ROWCOUNT;

    IF @rowsAffected = 0
      BEGIN
        RAISERROR ('Role with ID %d not found.', 10, 1, @id);
      END;
  END TRY
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error updating role: %s', 16, 1, @errorMessage);
  END CATCH;
END;

--USE SP EDIT/UPDATE DATA ROLES

EXEC UpdateRole @id = 5, @name = 'Senior Manager';

--RESULT SP EDIT/UPDATE DATA ROLES
SELECT * FROM tbl_roles;