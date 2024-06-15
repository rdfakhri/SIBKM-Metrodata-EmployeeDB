-- =============================================
-- Author: Siti Anisa M
-- Create date: 07-06-2024
-- Description:	Stored procedure to add data in tbl_roles
-- =============================================

CREATE PROCEDURE addRole (
    @name varchar(50)
)
AS
BEGIN
    DECLARE @errorMessage nvarchar(500);

    BEGIN TRY
        INSERT INTO tbl_roles (name)
        VALUES (@name);
    END TRY
    BEGIN CATCH
        SET @errorMessage = ERROR_MESSAGE();
        RAISERROR ('Error adding role: %s', 16, 1, @errorMessage);
    END CATCH;
END;