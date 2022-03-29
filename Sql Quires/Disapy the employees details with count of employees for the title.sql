use AdventureWorks2019;
go
--Solutions to Exercise 5-6:Isolating Aggregate Query Logi
--1-Write a query that joins the HumanResources.Employee table to the Person.Person table so that you
--can display the FirstName, LastName, and HireDate columns for each employee. Display the
--JobTitle along with a count of employees for the title. Use a derived table to solve this query.


--1st way - using the window function 
select p.FirstName, p.LastName,e.HireDate, e.BusinessEntityID,e.JobTitle, COUNT(* ) over(partition by e.jobtitle) CountOfTitle
from HumanResources.Employee as e
join Person.Person as p on p.BusinessEntityID=e.BusinessEntityID

go

-- 2nd way using the derived table
select p.FirstName, p.LastName,e.HireDate, e.BusinessEntityID,e.JobTitle, CountOfTitle
from HumanResources.Employee as e
join Person.Person as p on p.BusinessEntityID=e.BusinessEntityID
join 
(
SELECT COUNT(*) AS CountOfTitle, JobTitle
FROM HumanResources.Employee
GROUP BY JobTitle
) as X on x.JobTitle=e.JobTitle


go
--3rd way using CTE
WITH X as
(
SELECT COUNT(*) AS CountOfTitle, JobTitle
FROM HumanResources.Employee
GROUP BY JobTitle
)
select p.FirstName, p.LastName,e.HireDate, e.BusinessEntityID,e.JobTitle, CountOfTitle
from HumanResources.Employee as e
join Person.Person as p on p.BusinessEntityID=e.BusinessEntityID
join X on x.JobTitle=e.JobTitle
order by JobTitle