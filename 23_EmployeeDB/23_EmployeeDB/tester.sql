-- =============================================
-- Author: Djulizah B, Raden Fakhri R, Siti Anisa M
-- Create date: 
-- Description:	Queries to tests SP, Functions, Triggers, etc.
-- =============================================

-- employee trigger testing
select * from tbl_job_histories
select * from tbl_employees

INSERT INTO tbl_employees VALUES (11, 'Jasmine','Malhotra','Female','testing@metrodata.co','+92 5555 6666','2023-10-01',42000,2,'DMS',2);
INSERT INTO tbl_employees VALUES (12, 'Jasmine','Malhotra','Female','test2@metrodata.co','+92 5555 6666','2023-10-01',42000,2,'DMS',2);
INSERT INTO tbl_employees VALUES (13, 'a','a','Female','test3@metrodata.co','+92 5555 6666','2023-10-01',42000,2,'DMS',2);

SELECT * FROM tbl_job_histories
SELECT * FROM tbl_employees

UPDATE tbl_employees
SET first_name = 'Radennnnn'
WHERE id=12;

DELETE FROM tbl_employees WHERE id = 13;

-- attendance trigger testing
insert into tbl_attendance (id, employee, email)
VALUES (1, 1, 'd@g.com')

insert into tbl_attendance --absen masuk coba
VALUES (2, 1,'de@g.com', '2024-06-12 09:09:00')

select * from tbl_attendance

-- view attendance testing
SELECT * FROM attendance_details

-- sp attendance testing
EXEC addAttendance
	@id = 3,
    @employee = 2, 
    @email = 'dfg@gs.com', 
    @time = '12-06-2024 17:35:00';

select * from tbl_attendance

--USE ADD DATA PERMISSIONS
EXEC AddPermission @id = 28, @name = 'Read Access';

EXEC dbo.addPermission @name = 'add employee'
select * from tbl_permissions

--RESULT ADD DATA PERMISSIONS
SELECT * FROM tbl_permissions;

-- USE SP EDIT/UPDATE DATA PERMISSIONS
EXEC UpdatePermission @id = 28, @name = 'READ ACCESS';

--RESULT SP EDIT/UPDATE DATA PERMISSIONS
SELECT * FROM tbl_permissions WHERE id = '28';

--USE SP DELETE DATA PERMISSIONS
EXEC DeletePermission @id = 28;

-- RESULT SP DELETE DATA PERMSSIONS
SELECT * FROM tbl_permissions;

-- USE ADD DATA ROLES
EXEC AddRole @id = 5, @name = 'Secretary';

--RESULT  SP DATA ROLES
SELECT * FROM tbl_roles;

--USE SP EDIT/UPDATE DATA ROLES

EXEC UpdateRole @id = 5, @name = 'Senior Manager';

--RESULT SP EDIT/UPDATE DATA ROLES
SELECT * FROM tbl_roles;

--USE SP DELETE DATA ROLES
EXEC DeleteRole @id = 5;

-- RESULT SP DELETE DATA ROLES
SELECT * FROM tbl_roles;