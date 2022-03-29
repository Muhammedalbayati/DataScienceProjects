use DataWork
go

with a as(
select *
,DENSE_RANK() over(order by salary asc) min_dr
,DENSE_RANK() over(order by salary desc) max_dr from Employees
)
select FirstName,LastName,Salary from a
where min_dr=1 or max_dr=1

--find min and max salary 
 select min(salary) as [min],MAX(salary) [max] from Employees

--1 return employee record with highest salary
select top(1) * from Employees order by Salary desc

go

-- or
select * from Employees
where Salary=(
select max(salary) from Employees
)

 Go

--find 2nd highest salary in employee table
select MAX(salary) from Employees
where Salary not in (select MAX(salary) from Employees)

Go


 --find n highest salary 
 select top(3) Salary 
 from
 (
	 select distinct top(3) salary
	 from Employees
	 order by Salary desc
 ) AS q
 order by Salary desc

  Go

 --find n highest salary
 with query as
 (
 select *, DENSE_RANK() over (order by salary desc) as DENSRANK from Employees
 )
 select  * from query
 where query.DENSRANK=2

  Go


  --find highest salary for male and female
   with query as
 (
 select *,  row_number() over (PARTITION BY gender order by salary desc,gender desc) as rownumber 
 from Employees
 )
 select * from query
 where rownumber=1

 Go


   --find highest salary for male and female
 with query as
 (
 select *,  DENSE_RANK() over (PARTITION BY gender order by salary desc,gender desc) as rownumber 
 from Employees
 )
 select * from query
 where rownumber=1 -- put 1 to find 1st highest salary, 2 for 2nd highest salary ..etc
