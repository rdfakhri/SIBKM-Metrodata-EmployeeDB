-- =============================================
-- Author:		Raden Fakhri R
-- Create date: 05-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE AddRegion (
  @name VARCHAR(25)
)
AS
BEGIN
  INSERT INTO tbl_regions (name)
  VALUES (@name);
END;