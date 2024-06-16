-- =============================================
-- Author: Raden Fakhri R
-- Create date: 05-06-2024
-- Description:	Stored procedure to add data in tbl_locations
-- =============================================

CREATE PROCEDURE addLocation (
  @street_address VARCHAR(40),
  @postal_code VARCHAR(12),
  @city VARCHAR(30),
  @state_province VARCHAR(25),
  @country CHAR(3)
)
AS
BEGIN
  DECLARE @rowsAffected INT;
  DECLARE @errorMessage NVARCHAR(500);

  BEGIN TRY
    -- Check if country exists
    SELECT @rowsAffected = COUNT(*) FROM tbl_countries WHERE id = @country;

    IF @rowsAffected = 0
    BEGIN
      SET @errorMessage = 'Country with ID ' + CAST(@country AS VARCHAR(10)) + ' does not exist.';
      RAISERROR (@errorMessage, 16, 1);
    END;

    -- Insert location
    INSERT INTO tbl_locations (street_address, postal_code, city, state_province, country)
    VALUES (@street_address, @postal_code, @city, @state_province, @country);
  END TRY
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error adding location: %s', 16, 1, @errorMessage);
  END CATCH;
END;
