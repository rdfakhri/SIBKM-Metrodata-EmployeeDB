-- =============================================
-- Author: Raden Fakhri R
-- Create date: 05-06-2024
-- Description:	Stored procedure to delete data in tbl_regions
-- =============================================

CREATE PROCEDURE deleteRegion (
  @id INT
)
AS
BEGIN
  DELETE FROM tbl_regions
  WHERE id = @id;
END;