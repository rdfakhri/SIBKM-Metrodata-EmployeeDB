-- =============================================
-- Author:		Djulizah B
-- Create date: 13-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE deleteCountry (
  @id INT
)
AS
BEGIN
  DELETE FROM tbl_countries
  WHERE id = @id;
END;