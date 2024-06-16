-- =============================================
-- Author: Raden Fakhri R
-- Create date: 03-06-2024
-- Description:	View for tbl_roles
-- =============================================

CREATE VIEW role_details
AS
SELECT
    id AS role_id,
    name AS role_name
FROM tbl_roles;