-- =============================================
-- Author:		Raden Fakhri R
-- Create date: 03-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE VIEW view_all_roles
AS
SELECT
    id AS role_id,
    name AS role_name
FROM tbl_roles;