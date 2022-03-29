use DataWork;
go
with q1 as
(
SELECT id,AVG(salary) over() the_avg
  FROM [Employees] 
  )
  select e.salary,q1.the_avg,
  case 
  when e.Salary>q1.the_avg then 'higher'
  when e.Salary=q1.the_avg then 'same'
  when e.Salary<q1.the_avg then 'lower'
  end as coparison
  from Employees E
  join q1 on q1.ID=e.ID
 