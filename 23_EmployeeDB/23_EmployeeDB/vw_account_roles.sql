-- =============================================
-- Author:		Raden Fakhri R
-- Create date: 03-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE VIEW view_account_roles AS
SELECT 
  ar.id, 
  a.username AS account_username,  -- Assuming 'username' is the username column in tbl_accounts
  r.name AS role_name
FROM tbl_account_roles ar
INNER JOIN tbl_accounts a ON ar.account = a.id
INNER JOIN tbl_roles r ON ar.role = r.id;