-- =============================================
-- Author:		Raden Fakhri R
-- Create date: 03-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE VIEW view_all_departments AS
SELECT d.id, d.name
FROM tbl_departments d
INNER JOIN tbl_locations l ON d.location = l.id;