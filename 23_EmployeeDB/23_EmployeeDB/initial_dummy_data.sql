-- =============================================
-- Author: Djulizah B
-- Create date: 06-06-2024
-- Description:	Inserting dummy data to tables using their designated Stored Procedures
-- =============================================

-- tbl_permissions
EXEC dbo.addPermission @name = 'Add Employee';
EXEC dbo.addPermission @name = 'Edit Employee';
EXEC dbo.addPermission @name = 'Delete Employee';
EXEC dbo.addPermission @name = 'View Employee Detail';
EXEC dbo.addPermission @name = 'Add Job';
EXEC dbo.addPermission @name = 'Edit Job';
EXEC dbo.addPermission @name = 'Delete Job';
EXEC dbo.addPermission @name = 'View Job Detail';
EXEC dbo.addPermission @name = 'Add Department';
EXEC dbo.addPermission @name = 'Edit Department';
EXEC dbo.addPermission @name = 'Delete Department';
EXEC dbo.addPermission @name = 'View Department Detail';
EXEC dbo.addPermission @name = 'Add Location';
EXEC dbo.addPermission @name = 'Edit Location';
EXEC dbo.addPermission @name = 'Delete Location';
EXEC dbo.addPermission @name = 'View Location Detail';
EXEC dbo.addPermission @name = 'Add Country';
EXEC dbo.addPermission @name = 'Edit Country';
EXEC dbo.addPermission @name = 'Delete Country';
EXEC dbo.addPermission @name = 'View Country Detail';
EXEC dbo.addPermission @name = 'Add Region';
EXEC dbo.addPermission @name = 'Edit Region';
EXEC dbo.addPermission @name = 'Delete Region';
EXEC dbo.addPermission @name = 'View Region Detail';
EXEC dbo.addPermission @name = 'Add Role';
EXEC dbo.addPermission @name = 'Edit Role';
EXEC dbo.addPermission @name = 'Delete Role';
EXEC dbo.addPermission @name = 'View Role Detail';
EXEC dbo.addPermission @name = 'Add Permission';
EXEC dbo.addPermission @name = 'Edit Permission';
EXEC dbo.addPermission @name = 'Delete Permission';
EXEC dbo.addPermission @name = 'View Permission Detail';
EXEC dbo.addPermission @name = 'Edit Profile';
EXEC dbo.addPermission @name = 'View Profile Detail';
EXEC dbo.addPermission @name = 'Edit Password';
EXEC dbo.addPermission @name = 'Add Attendance';
EXEC dbo.addPermission @name = 'View Attendance Detail';

-- tbl_roles
EXEC dbo.addRole @name = 'Super Admin';
EXEC dbo.addRole @name = 'Admin';
EXEC dbo.addRole @name = 'Manager';
EXEC dbo.addRole @name = 'Employee';

-- tbl_role_permissions //no SP

-- tbl_regions
EXEC dbo.addRegion @name = 'SouthEast Asia';
EXEC dbo.addRegion @name = 'South Asia';
EXEC dbo.addRegion @name = 'East Asia';
EXEC dbo.addRegion @name = 'Central Asia';
EXEC dbo.addRegion @name = 'West Asia';

-- tbl_countries
EXEC dbo.addCountry @id = 'IDN', @name = 'Indonesia', @region = 1;
EXEC dbo.addCountry @id = 'SGP', @name = 'Singapore', @region = 1;
/*
INSERT INTO tbl_countries VALUES ('NPL', 'Nepal', 2);
INSERT INTO tbl_countries VALUES ('MDV', 'Maldives', 2);
INSERT INTO tbl_countries VALUES ('JPN', 'Japan', 3);
INSERT INTO tbl_countries VALUES ('MNG', 'Mongolia', 3);
INSERT INTO tbl_countries VALUES ('UZB', 'Uzbekistan', 4);
INSERT INTO tbl_countries VALUES ('KAZ', 'Kazakhstan', 4);
INSERT INTO tbl_countries VALUES ('PSE', 'Palestine', 5);
INSERT INTO tbl_countries VALUES ('QAT', 'Qatar', 5);
*/

-- tbl_locations
EXEC dbo.addLocation @street_address = '123 Jalan Merdeka Selatan',
					@postal_code = '10001',
					@city = 'Jakarta',
					@state_province = 'DKI Jakarta',
					@country = 'IDN';
EXEC dbo.addLocation @street_address = '456 Orchard Road',
					@postal_code = '238888',
					@city = 'Singapore City',
					@state_province = 'Singapore',
					@country = 'SGP';
/*
INSERT INTO tbl_locations VALUES (3, '789 Dubar Marg','44618','Kathmadu','Bagmati','NPL');
INSERT INTO tbl_locations VALUES (4, '1011 Male Boduthakurufaanu Magu','20000','Male','Male Atoll','MDV');
INSERT INTO tbl_locations VALUES (5, '1213 Shibuya Crossing','150-0002','Tokyo','Tokyo Prefecture','JPN');
INSERT INTO tbl_locations VALUES (6, '456 Chinggis Khaan Avenue','15160','Ulaanbaatar','Capital','MNG');
INSERT INTO tbl_locations VALUES (7, '789 Tashkent Metro','100000','Tashkent','Toshkent Region','UZB');
INSERT INTO tbl_locations VALUES (8, '1011 Nur-Sultan City Center','010000','Nur-Sultan','Akmola Region','KAZ');
INSERT INTO tbl_locations VALUES (9, '1213 Al-Manara Road','','Jerusalem','Jerussalem','PSE');
INSERT INTO tbl_locations VALUES (10, '456 Al Corniche Street','44160','Doha','Doha Municipality','QAT');
*/

-- tbl_departments
EXEC dbo.addDepartment @name = 'Customer Service', @location = 1;
EXEC dbo.addDepartment @name = 'Marketing', @location = 2;
/*
INSERT INTO tbl_departments VALUES (3, 'Research and Development', 5);
INSERT INTO tbl_departments VALUES (4, 'Finance', 10);
*/

-- tbl_jobs
EXEC dbo.addJob @id = 'CSR', 
				@title = 'Customer Service Representative',
				@min_salary = 35000,
				@max_salary = 50000;
EXEC dbo.addJob @id = 'TSP', 
				@title = 'Technical Support Specialist',
				@min_salary = 40000,
				@max_salary = 60000;
/*
INSERT INTO tbl_jobs VALUES ('CSM','Customer Success Manager', 50000, 75000); -- 1
INSERT INTO tbl_jobs VALUES ('DMS','Digital Marketing Specialist', 40000, 60000); -- 2
INSERT INTO tbl_jobs VALUES ('SMMM','Social Media Marketing Manager', 50000, 75000); -- 2
INSERT INTO tbl_jobs VALUES ('MRA','Market Research Analyst', 55000, 80000); -- 2
INSERT INTO tbl_jobs VALUES ('SE','Software Engineer', 60000, 90000); -- 3
INSERT INTO tbl_jobs VALUES ('DS','Data Scientist', 70000, 100000); -- 3
INSERT INTO tbl_jobs VALUES ('FA','Financial Analyst', 50000, 70000); -- 4
INSERT INTO tbl_jobs VALUES ('ACC','Accountant', 45000, 65000); -- 4
*/

-- tbl_employees
EXEC dbo.addEmployee @firstName = 'Alice', 
					@lastName = 'Tanaka', 
					@gender = 'Female', 
					@email = 'alicetanaka@metrodata.co', 
					@phone = '6512345678', 
					@hireDate = '2023-01-01', 
					@salary = 40000, 
					@managerId = NULL, 
					@jobId = 'CSR', 
					@departmentId = 1,
					@password = 'Csr_1234',
					@confirmPassword = 'Csr_1234';
					SELECT * FROM tbl_job_histories
EXEC dbo.addEmployee @firstName = 'Ben', 
					@lastName = 'Lee', 
					@gender = 'Male', 
					@email = 'benlee@metrodata.co', 
					@phone = '85287654321', 
					@hireDate = '2022-06-15', 
					@salary = 48000, 
					@managerId = 1, 
					@jobId = 'CSR', 
					@departmentId = 1,
					@password = 'Csr_1234',
					@confirmPassword = 'Csr_1234';
/*
INSERT INTO tbl_employees VALUES (3, 'Charlie','Wong','Male','charliewong@metrodata.co','+886 9876 5432','2024-02-01',52000,NULL,'DMS',2);
INSERT INTO tbl_employees VALUES (4, 'Diana','Kim','Female','dianakim@metrodata.co','+82 1111 2222','2023-08-15',60000,3,'SMMM',2);
INSERT INTO tbl_employees VALUES (5, 'Ethan','Garcia','Male','ethangarcia@metrodata.co','+63 9087 6543','2022-12-01',45000,1,'CSM',1);
INSERT INTO tbl_employees VALUES (6, 'Fiona','Matsumoto','Female','fionamt@metrodata.co','+81 3333 4444','2024-05-15',70000,NULL,'SE',3);
INSERT INTO tbl_employees VALUES (7, 'Gabriel','Zhang','Male','gabrielzh@metrodata.co','+86 2222 1111','2023-03-01',85000,6,'SE',3);
INSERT INTO tbl_employees VALUES (8, 'Hannah','Khan','Female','hannahkhan@metrodata.co','+91 7654 3210','2022-09-01',62000,NULL,'FA',4);
INSERT INTO tbl_employees VALUES (9, 'Isaac','Nguyen','Male','isaacnguyen@metrodata.co','+84 2468 1012','2024-04-01',50000,8,'ACC',4);
INSERT INTO tbl_employees VALUES (10, 'Jasmine','Malhotra','Female','jasminemal@metrodata.co','+92 5555 6666','2023-10-01',42000,2,'DMS',2);
*/

-- tbl_job_histories //no SP -> Trigger Usage
-- tbl_accounts //within addEmployee SP
-- tbl_account_roles //within addEmployee SP

-- tbl_attendances
EXEC dbo.addAttendance
	@employee = 1, 
	@email = 'alicetanaka@metrodata.co'