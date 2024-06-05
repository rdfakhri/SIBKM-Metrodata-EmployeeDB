SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:        <Your Name>
-- Create date:    <Date Created>
-- Description:   <Brief Description of Procedure>
-- =============================================
CREATE PROCEDURE [ProcedureName] (  -- Replace with your desired procedure name
  -- Add the parameters for the stored procedure here
  [@Param1] [Datatype_For_Param1] = [Default_Value_For_Param1],
  [@Param2] [Datatype_For_Param2] = [Default_Value_For_Param2],
  ...
)
AS
BEGIN
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;

  -- Insert your procedure logic here
  SELECT *
  FROM tbl_employees

END
GO
