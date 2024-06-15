-- =============================================
-- Author: Raden Fakhri R
-- Create date: 05-06-2024
-- Description:	Stored procedure to update data in tbl_regions
-- =============================================

CREATE PROCEDURE updateRegion (
  @id INT,
  @new_name VARCHAR(25)
)
AS
BEGIN
  UPDATE tbl_regions
  SET name = @new_name
  WHERE id = @id;
END;