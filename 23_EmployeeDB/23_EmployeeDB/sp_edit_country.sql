-- =============================================
-- Author: Djulizah B
-- Create date: 13-06-2024
-- Description:	Stored procedure to update data in tbl_country
-- =============================================

CREATE PROCEDURE updateCountry (
  @id CHAR(3),
  @new_name VARCHAR(40),
  @new_region INT
)
AS
BEGIN
  DECLARE @rowsAffected INT;
  DECLARE @errorMessage NVARCHAR(500);

  BEGIN TRY
    -- Check if country exists
    SELECT @rowsAffected = COUNT(*) FROM tbl_countries WHERE id = @id;

    IF @rowsAffected = 0
    BEGIN
      SET @errorMessage = 'Country with ID ' + CAST(@id AS VARCHAR(10)) + ' does not exist.';
      RAISERROR (@errorMessage, 16, 1);
    END;

    -- Check if new region exists
    IF NOT EXISTS (SELECT 1 FROM tbl_regions WHERE id = @new_region)
    BEGIN
      SET @errorMessage = 'Region with ID ' + CAST(@new_region AS VARCHAR(10)) + ' does not exist.';
      RAISERROR (@errorMessage, 16, 1);
    END;

    -- Update country
    UPDATE tbl_countries
    SET name = @new_name,
      region = @new_region
    WHERE id = @id;
  END TRY
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error editing country: %s', 16, 1, @errorMessage);
  END CATCH;
END;
