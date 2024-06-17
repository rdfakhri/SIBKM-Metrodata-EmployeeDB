-- =============================================
-- Author: Djulizah B, Raden Fakhri R, Siti Anisa M
-- Create date: 12-06-2024
-- Description:	View for tbl_attendances
-- =============================================

CREATE VIEW attendance_details
AS
	SELECT a.id, CONCAT(e.first_name, ' ', e.last_name) AS 'Full Name', e.email, a.time
	FROM tbl_attendances a
	INNER JOIN tbl_employees e ON a.employee = e.id;
GO