-- =============================================
-- Author:		Djulizah B, Raden Fakhri R, Siti Anisa M
-- Create date: 12-06-2024
-- Description:	<Description,,>
-- =============================================

CREATE TRIGGER tr_insert_absen
ON tbl_attendance
AFTER INSERT
AS
BEGIN
  DECLARE @jamAbsen TIME(0);

  -- Get the attendance time from inserted data
  SELECT TOP 1 @jamAbsen = time FROM inserted;

  IF @jamAbsen BETWEEN '09:00:00' AND '09:10:00'
  BEGIN
    PRINT 'Absen masuk berhasil';
  END
  ELSE IF @jamAbsen BETWEEN '17:30:00' AND '17:40:00'
  BEGIN
    PRINT 'Absen Keluar berhasil';
  END
  ELSE
  BEGIN
    PRINT 'Absen belum dibuka';
  END;
END;
GO
