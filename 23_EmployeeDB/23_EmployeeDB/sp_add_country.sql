-- =============================================
-- Author:		Djulizah B
-- Create date: 13-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE AddCountry (
	@id CHAR(3),
	@name VARCHAR(25),
	@region INT
)
AS
BEGIN
  INSERT INTO tbl_countries(id, name, region)
  VALUES (@id, @name, @region);
END;