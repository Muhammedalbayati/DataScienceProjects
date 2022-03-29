use AdventureWorks2019;
go
--Solutions to Exercise 5-6: Isolating Aggregate Query Logic
--4. Display the CustomerID, SalesOrderID, and OrderDate for each Sales.SalesOrderHeader row as
--long as the customer has placed at least five orders. Use any of the techniques from this section to
--come up with the query.

--sub query
select CustomerID, SalesOrderID, OrderDate
from Sales.SalesOrderHeader
where CustomerID in
(
select CustomerID
from Sales.SalesOrderHeader
group by CustomerID
having COUNT(*)>4
)

go

--CTE
WITH X as (
select CustomerID
from Sales.SalesOrderHeader
group by CustomerID
having COUNT(*)>4
) 
select sh.CustomerID, SalesOrderID, OrderDate
from Sales.SalesOrderHeader as SH
join x on sh.CustomerID=x.customerid

go

select sh.CustomerID, SalesOrderID, OrderDate
from Sales.SalesOrderHeader sh
join 
(
select CustomerID
from Sales.SalesOrderHeader
group by CustomerID
having COUNT(*)>4
) x on x.CustomerID=sh.CustomerID

