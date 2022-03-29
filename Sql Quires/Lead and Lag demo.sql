use DemoDb;

-- find max salary for each department
--select DEPT_NAME,MAX(salary) 
--from employee
--group by DEPT_NAME

-- To improve the query above will use window function to show all columns 
--select 
--e.*,
--MAX(salary) over(partition by dept_name) Max_Salary
--from
--employee e

-- show only first two employees for each department 
--select * from
--(
--	select 
--	e.*,
--	ROW_NUMBER() over(partition by dept_name order by e.emp_id) AS rn
--	from
--	employee e
--) x
--where x.rn<3


-- disply higher, lower or equal to previous employee salary

select e.* ,
	lag(e.salary) over(partition by dept_name order by emp_id) as prev_salary,
	case 
	when e.SALARY > LAG(salary) over(partition by dept_name order by emp_id) then cast(salary as varchar(10))+' Higher than previous employee'
	when e.SALARY < LAG(salary) over(partition by dept_name order by emp_id) then cast(salary as varchar(10))+ ' Lower than previous employee'
	when e.SALARY = LAG(salary) over(partition by dept_name order by emp_id) then cast(salary as varchar(10))+' Same as previous employee'
	end as salary_range
from employee e



