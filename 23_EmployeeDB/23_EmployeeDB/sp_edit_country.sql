-- =============================================
-- Author:		Djulizah B
-- Create date: 13-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE editCountry (
	@id CHAR(3),
	@new_name VARCHAR(25),
	@new_region INT
)
AS
BEGIN
  UPDATE tbl_countries
  SET name = @new_name,
	region = @new_region
  WHERE id = @id;
END;