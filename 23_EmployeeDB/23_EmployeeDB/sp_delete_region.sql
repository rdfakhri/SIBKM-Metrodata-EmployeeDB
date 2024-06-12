-- =============================================
-- Author:		Raden Fakhri R
-- Create date: 05-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE DeleteRegion (
  @id INT
)
AS
BEGIN
  DELETE FROM tbl_regions
  WHERE id = @id;
END;