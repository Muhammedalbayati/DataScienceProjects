--Write a query that returns a list of company names with a ranking of their place in a list of highest TotalDue values from 
--the SalesOrderHeader table. Make sure to use the aliases provided, and default column names elsewhere.

-- select CompanyName and TotalDue columns
SELECT CompanyName ,TotalDue AS Revenue,
       -- get ranking and order by appropriate column
       rank() OVER (ORDER BY TotalDue DESC) AS RankByRevenue
FROM Sales.SalesOrderHeader AS SOH
-- use appropriate join on appropriate table
join Sales.Customer AS C
ON SOH.CustomerID = C.CustomerID;