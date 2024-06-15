-- =============================================
-- Author: Raden Fakhri R
-- Create date: 05-06-2024
-- Description:	Stored procedure to add data in tbl_regions
-- =============================================

CREATE PROCEDURE addRegion (
  @name VARCHAR(25)
)
AS
BEGIN
  INSERT INTO tbl_regions (name)
  VALUES (@name);
END;