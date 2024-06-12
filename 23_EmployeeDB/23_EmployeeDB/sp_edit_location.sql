-- =============================================
-- Author:		Raden Fakhri R
-- Create date: 05-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE UpdateLocation (
  @id INT,
  @street_address VARCHAR(40) = NULL,
  @postal_code VARCHAR(12) = NULL,
  @city VARCHAR(30) = NULL,
  @state_province VARCHAR(25) = NULL,
  @country CHAR(3) = NULL
)
AS
BEGIN
  UPDATE tbl_locations
  SET 
    street_address = ISNULL(@street_address, street_address),
    postal_code = ISNULL(@postal_code, postal_code),
    city = ISNULL(@city, city),
    state_province = ISNULL(@state_province, state_province),
    country = ISNULL(@country, country)
  WHERE id = @id;
END;