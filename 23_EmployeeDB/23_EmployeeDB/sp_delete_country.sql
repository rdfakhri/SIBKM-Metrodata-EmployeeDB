-- =============================================
-- Author: Djulizah B
-- Create date: 13-06-2024
-- Description:	Stored procedure to delete data in tbl_country
-- =============================================

CREATE PROCEDURE deleteCountry (
  @id CHAR(3)
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

    -- Delete country
    DELETE FROM tbl_countries
    WHERE id = @id;
  END TRY
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error deleting country: %s', 16, 1, @errorMessage);
  END CATCH;
END;