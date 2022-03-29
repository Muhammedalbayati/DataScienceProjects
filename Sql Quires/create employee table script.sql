use DataWork;

Create table Employees
(
 ID int primary key identity,
 FirstName nvarchar(50),
 LastName nvarchar(50),
 Gender nvarchar(50),
 Salary int,
 department_id int
)
GO

Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000,1)
Insert into Employees values ('Mark', 'Hastings', 'Male', 60000,1)
Insert into Employees values ('Steve', 'Pound', 'Male', 45000,2)
Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000,2)
Insert into Employees values ('Philip', 'Hastings', 'Male', 45000,1)
Insert into Employees values ('Mary', 'Lambeth', 'Female', 30000,2)
Insert into Employees values ('Valarie', 'Vikings', 'Female', 35000,1)
Insert into Employees values ('John', 'Stanmore', 'Male', 80000,1)
GO