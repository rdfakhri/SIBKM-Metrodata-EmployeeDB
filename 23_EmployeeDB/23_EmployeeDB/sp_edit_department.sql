-- =============================================
-- Author: Raden Fakhri R
-- Create date: 05-06-2024
-- Description:	Stored procedure to update data in tbl_departments
-- =============================================

CREATE PROCEDURE updateDepartment (
  @id int,
  @name varchar(30),
  @location int
)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @rowsAffected INT;

  BEGIN TRY
    -- Check department existence
    SELECT @rowsAffected = COUNT(*) FROM tbl_departments WHERE id = @id;

    IF @rowsAffected = 0
    BEGIN
      SET @errorMessage = 'Department with ID ' + CAST(@id AS VARCHAR(10)) + ' does not exist.';
      RAISERROR (@errorMessage, 16, 1);
    END;

    -- Check location existence
    IF @location IS NOT NULL
    BEGIN
      SELECT @rowsAffected = COUNT(*) FROM tbl_locations WHERE id = @location;
      IF @rowsAffected = 0
      BEGIN
        SET @errorMessage = 'Location with ID ' + CAST(@location AS VARCHAR(10)) + ' does not exist.';
        RAISERROR (@errorMessage, 16, 1);
      END;
    END;

    -- Update department
    UPDATE tbl_departments
    SET name = @name,
      location = @location
    WHERE id = @id;

  END TRY
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error updating department: %s', 16, 1, @errorMessage);
  END CATCH;
END;