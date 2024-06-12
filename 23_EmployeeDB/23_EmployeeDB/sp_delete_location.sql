-- =============================================
-- Author:		Raden Fakhri R
-- Create date: 05-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE DeleteLocation (
  @id INT
)
AS
BEGIN
  DELETE FROM tbl_locations
  WHERE id = @id;
END;