-- =============================================
-- Author: Raden Fakhri R
-- Create date: 05-06-2024
-- Description:	Stored procedure to add data in tbl_departments
-- =============================================

CREATE PROCEDURE addDepartment (
  @name varchar(30),
  @location int
)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @rowsAffected INT;

  BEGIN TRY
    -- Check location existence
    SELECT @rowsAffected = COUNT(*) FROM tbl_locations WHERE id = @location;

    IF @rowsAffected = 0
    BEGIN
      SET @errorMessage = 'Location with ID ' + CAST(@location AS VARCHAR(10)) + ' does not exist.';
      RAISERROR (@errorMessage, 16, 1);
    END;

    -- Insert department
    INSERT INTO tbl_departments (name, location)
    VALUES (@name, @location);
  END TRY
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error adding department: %s', 16, 1, @errorMessage);
  END CATCH;
END;