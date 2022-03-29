--https://youtu.be/FNYdBLwZ6cE
--https://techtfq.com/blog/learn-how-to-write-sql-queries-practice-complex-sql-queries#google_vignette
use DemoDb;

--create table users
--(
--user_id int primary key,
--user_name varchar(30) not null,
--email varchar(50));

--insert into users values
--(1, 'Sumit', 'sumit@gmail.com'),
--(2, 'Reshma', 'reshma@gmail.com'),
--(3, 'Farhana', 'farhana@gmail.com'),
--(4, 'Robin', 'robin@gmail.com'),
--(5, 'Robin', 'robin@gmail.com');

--select * from users;


--Q1: Write a SQL Query to fetch all the duplicate records in a table.
select * from
(
	select * , ROW_NUMBER() over(partition by email order by email) as RN
	from users
) Qry
where rn>1;

--Q2:Write a SQL query to fetch the second last record from employee table
select * from
(
	select * , ROW_NUMBER() over(order by emp_id desc) as RN
	from employee
) Qry
where rn=2

--3. Write a SQL query to display only the details of employees who either earn the highest salary or 
--the lowest salary in each department from the employee table.

select X.* from
employee E
join
(
select *, 
		MAX(salary) over(partition by dept_name) AS Max_Salary ,
		min(salary) over(partition by dept_name) AS Min_Salary from employee
) X
on e.emp_ID=x.emp_ID
and (e.SALARY=x.Max_Salary or e.SALARY=x.Min_Salary)
order by x.DEPT_NAME,x.SALARY


--4 :This question from eClink From the doctors table, fetch the details of doctors who work in the same hospital but in different speciality.
--create table doctors
--(
--id int primary key,
--name varchar(50) not null,
--speciality varchar(100),
--hospital varchar(50),
--city varchar(50),
--consultation_fee int
--);

--insert into doctors values
--(1, 'Dr. Shashank', 'Ayurveda', 'Apollo Hospital', 'Bangalore', 2500),
--(2, 'Dr. Abdul', 'Homeopathy', 'Fortis Hospital', 'Bangalore', 2000),
--(3, 'Dr. Shwetha', 'Homeopathy', 'KMC Hospital', 'Manipal', 1000),
--(4, 'Dr. Murphy', 'Dermatology', 'KMC Hospital', 'Manipal', 1500),
--(5, 'Dr. Farhana', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1700),
--(6, 'Dr. Maryam', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1500);

--select * from doctors;

select d1.name, d1.speciality,d1.hospital
from doctors d1
join doctors d2
on d1.hospital = d2.hospital and d1.speciality <> d2.speciality
and d1.id <> d2.id;

--
--create table login_details(
--login_id int primary key,
--user_name varchar(50) not null,
--login_date date);

--delete from login_details;
--insert into login_details values
--(101, 'Michael', getdate()),
--(102, 'James', getdate()),
--(103, 'Stewart', getdate()+1),
--(104, 'Stewart', getdate()+1),
--(105, 'Stewart', getdate()+1),
--(106, 'Michael', getdate()+2),
--(107, 'Michael', getdate()+2),
--(108, 'Stewart', getdate()+3),
--(109, 'Stewart', getdate()+3),
--(110, 'James', getdate()+4),
--(111, 'James', getdate()+4),
--(112, 'James', getdate()+5),
--(113, 'James', getdate()+6);

--select * from login_details;

--5: From the login_details table, fetch the users who logged in consecutively 3 or more times.
select distinct repeated_names
from (
select *,
	case when user_name = lead(user_name) over(order by login_id)
	and  user_name = lead(user_name,2) over(order by login_id)
	then user_name else null end as repeated_names
from login_details) x
	where x.repeated_names is not null;