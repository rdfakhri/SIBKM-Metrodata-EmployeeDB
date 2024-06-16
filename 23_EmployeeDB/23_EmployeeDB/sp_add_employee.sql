-- =============================================
-- Author: Djulizah B
-- Create date:	14-06-2024
-- Description:	Stored procedure to add employee data
-- =============================================

CREATE PROCEDURE addEmployee (
  @firstName varchar(25),
  @lastName varchar(25),
  @gender varchar(10),
  @email varchar(25),
  @phone varchar(20),
  @hireDate date,
  @salary int,
  @managerId int,
  @jobId varchar(10),
  @departmentId int,
  @password varchar(50),
  @confirmPassword varchar(50)
)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @employeeId int;

  BEGIN TRY
    -- Validate password confirmation
    IF @password <> @confirmPassword
    BEGIN
      SET @errorMessage = 'Passwords do not match.';
      RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
      RETURN; -- Exit procedure if passwords don't match
    END;

    -- Validate data using functions (call them before insert)
    IF @gender = '' OR dbo.isValidGender(@gender) = 0
    BEGIN
      SET @errorMessage = 'Invalid gender provided.';
      RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
      RETURN;
    END;

    IF dbo.isValidEmail(@email) = 0
    BEGIN
      SET @errorMessage = 'Invalid email address.';
      RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
      RETURN;
    END;

    IF dbo.isNumericPhoneNumber(@phone) = 0
    BEGIN
      SET @errorMessage = 'Invalid phone number format.';
      RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
      RETURN;
    END;

    IF dbo.isValidSalary(@jobId, @salary) = 0 
    BEGIN
      SET @errorMessage = 'Salary is outside the allowed range.';
      RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
      RETURN;
    END;

    -- Insert employee data
    INSERT INTO tbl_employees(
      first_name,
      last_name,
      gender,
      email,
      phone,
      hire_date,
      salary,
      manager,
      job,
      department
    )
    VALUES (
      @firstName,
      @lastName,
      @gender,
      @email,
      @phone,
      @hireDate,
      @salary,
      @managerId,
      @jobId,
      @departmentId
    );

	-- Retrieve newly inserted employee ID
    SET @employeeId = SCOPE_IDENTITY();

    -- Insert account data for the new employee
    INSERT INTO tbl_accounts (
      id,
      username,
      password,
	  otp,
	  is_expired,
	  is_used
    )
    VALUES (
      @employeeId,
      @email,
      @password,
	  0, -- initialize 0
	  GETDATE(), --initialize by date created
	  0 -- initialize false
    );

    -- Give 'Employee' role to new data in tbl_account_roles
    INSERT INTO tbl_account_roles (
      account,
      role
    )
    VALUES (
      @employeeId,
      4 -- role 'Employee' id = 4
    );

	-- Update the tbl_account with actual otp
	EXEC dbo.generateOtp @email = @email; -- when addEMployee() executed -> error generating otp (null) yet all tables data are inserted
  END TRY

  BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
  END CATCH;

END;
