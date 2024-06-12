-- =============================================
-- Author:		Siti Anisa M
-- Create date: 07-06-2024
-- Description:	<Description,,>
-- =============================================

-- SP ADD DATA ROLES
CREATE PROCEDURE AddRole (
    @id int, 
    @name varchar(50)
)
AS
BEGIN
    DECLARE @errorMessage nvarchar(500);

    BEGIN TRY
        INSERT INTO tbl_roles (id, name)
        VALUES (@id, @name);
    END TRY
    BEGIN CATCH
        SET @errorMessage = ERROR_MESSAGE();
        RAISERROR ('Error adding role: %s', 16, 1, @errorMessage);
    END CATCH;
END;

-- USE ADD DATA ROLES
EXEC AddRole @id = 5, @name = 'Secretary';

--RESULT  SP DATA ROLES
SELECT * FROM tbl_roles;