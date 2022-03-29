use DemoDb;
go

-- Write the SQL query to get the third maximum salary of an employee from a table named employees.

--select  top(1) * from 
--(select top(3) * from employee  order by SALARY desc) as Emp
--order by SALARY asc


--select distinct SALARY from (
--select  *, DENSE_RANK() over(order by salary desc) dr from employee
--) X
--where x.dr=3




--Here we copy all rows to a new tabel just to test the duplicate example below
-- *** all rows ***
--select * into employee2 from employee 
-- *** just one row **
--insert into employee2 
--select * from employee e where e.emp_ID=101 

-- How to remove duplicate rows in SQL

--with data as
--(
--select *,ROW_NUMBER() over(partition by emp_id order by emp_id) rn from employee2
--)
--delete from data where data.rn >=2


--How to find the nth highest salary in SQL like 3rd?
--with emp as(
--select *, DENSE_RANK() over(order by salary desc) dr from employee
--)
--select * from emp where dr=3



--Select emp_Id from (Select rowno, emp_ID from employee) where mod(rowno,2)=0