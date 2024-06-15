-- =============================================
-- Author: Djulizah B, Raden Fakhri R, Siti Anisa M
-- Create date: 12-06-2024
-- Description:	Print messages of attendance status when data is added to tbl_attendances
-- =============================================

CREATE TRIGGER tr_insert_attendance
ON tbl_attendances
AFTER INSERT
AS
BEGIN
  DECLARE @attendTime TIME(0);

  -- Get the attendance time from inserted data
  SELECT TOP 1 @attendTime = time FROM inserted;

  IF @attendTime BETWEEN '09:00:00' AND '09:10:00'
  BEGIN
    PRINT 'Check-In Attendance succesfully recorded!';
  END
  ELSE IF @attendTime BETWEEN '17:30:00' AND '17:40:00'
  BEGIN
    PRINT 'Check-Out Attendance succesfully recorded!';
  END
  ELSE
  BEGIN
    PRINT 'Attendance not open yet!';
  END;
END;
GO
