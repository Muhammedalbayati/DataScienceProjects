use DataWork;

select  x.department_name,e.firstName,x.SALARY
from employees e
join (
select e.id,e.firstName,d.department_name,e.salary,
	dense_rank() over(partition by d.department_name order by e.salary desc) rn
from Employees e
join Department d on e.department_id=d.department_id
) AS x 
on e.ID=x.ID and x.rn<4 
order by x.department_name,x.SALARY desc
