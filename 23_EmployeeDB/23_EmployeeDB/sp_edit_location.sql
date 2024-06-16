-- =============================================
-- Author: Raden Fakhri R
-- Create date: 05-06-2024
-- Description:	Stored procedure to update data in tbl_locations
-- =============================================

CREATE PROCEDURE updateLocation (
  @id INT,
  @street_address VARCHAR(40) = NULL,
  @postal_code VARCHAR(12) = NULL,
  @city VARCHAR(30) = NULL,
  @state_province VARCHAR(25) = NULL,
  @country CHAR(3) = NULL
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
      RAISERROR (@errorMessage, 16, 1); 
    END;

    -- Check if country exists
    IF @country IS NOT NULL  -- Only check country if provided
    BEGIN
      SELECT @rowsAffected = COUNT(*) FROM tbl_countries WHERE id = @country;
      IF @rowsAffected = 0
      BEGIN
        SET @errorMessage = 'Country with ID ' + CAST(@country AS VARCHAR(10)) + ' does not exist.';
        RAISERROR (@errorMessage, 16, 1);
      END;
    END;

    -- Update location
    UPDATE tbl_locations
    SET 
      street_address = ISNULL(@street_address, street_address),
      postal_code = ISNULL(@postal_code, postal_code),
      city = ISNULL(@city, city),
      state_province = ISNULL(@state_province, state_province),
      country = ISNULL(@country, country)
    WHERE id = @id;
  END TRY
  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error updating location: %s', 16, 1, @errorMessage);
  END CATCH;
END;