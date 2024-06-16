-- =============================================
-- Author: Djulizah B
-- Create date: 13-06-2024
-- Description:	Stored procedure to add data in tbl_country
-- =============================================

CREATE PROCEDURE addCountry (
  @id CHAR(3),
  @name VARCHAR(40),
  @region INT
)
AS
BEGIN
  DECLARE @errorMessage NVARCHAR(500);

  BEGIN TRY
    -- Check if region exists
    IF NOT EXISTS (SELECT 1 FROM tbl_regions WHERE id = @region)
    BEGIN
      SET @errorMessage = 'Region with ID ' + CAST(@region AS VARCHAR(10)) + ' does not exist.';
      RAISERROR (@errorMessage, 16, 1); 
    END;

    -- Insert country if region exists
    INSERT INTO tbl_countries(id, name, region)
    VALUES (@id, @name, @region);
  END TRY
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error adding country: %s', 16, 1, @errorMessage);
  END CATCH;
END;