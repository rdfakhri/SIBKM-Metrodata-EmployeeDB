-- =============================================
-- Author: Raden Fakhri R
-- Create date: 05-06-2024
-- Description:	Stored procedure to delete data in tbl_locations
-- =============================================

CREATE PROCEDURE deleteLocation (
  @id INT
)
AS
BEGIN
  DECLARE @rowsAffected INT;
  DECLARE @errorMessage NVARCHAR(500);

  BEGIN TRY
    -- Check if location exists
    SELECT @rowsAffected = COUNT(*) FROM tbl_locations WHERE id = @id;

    IF @rowsAffected = 0
    BEGIN
      SET @errorMessage = 'Location with ID ' + CAST(@id AS VARCHAR(10)) + ' does not exist.';
      RAISERROR (@errorMessage, 16, 1);  -- Raise error with severity 16
    END;

    -- Delete location
    DELETE FROM tbl_locations
    WHERE id = @id;
  END TRY
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error deleting location: %s', 16, 1, @errorMessage);
  END CATCH;
END;