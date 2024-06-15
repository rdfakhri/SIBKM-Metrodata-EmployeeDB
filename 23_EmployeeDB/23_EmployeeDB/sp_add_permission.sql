-- =============================================
-- Author: Siti Anisa M
-- Create date: 07-06-2024
-- Description:	Stored Procedure to add data in tbl_permissions
-- =============================================

CREATE PROCEDURE addPermission ( 
    @name varchar(100)
)
AS
BEGIN
    DECLARE @errorMessage nvarchar(500);

    BEGIN TRY
        INSERT INTO tbl_permissions (name)
        VALUES (@name);
    END TRY
    BEGIN CATCH
        SET @errorMessage = ERROR_MESSAGE();
        RAISERROR ('Error adding permission: %s', 16, 1, @errorMessage);
    END CATCH;
END;