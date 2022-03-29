USE AdventureWorks2019;
GO
--1
WITH SumSale AS
(
SELECT 
	SUM(TotalDue) AS SumTotalDue,
	CustomerID
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
)
SELECT 
	o.CustomerID, TotalDue,
	TotalDue / SumTotalDue * 100 AS PercentOfSales
FROM SumSale INNER JOIN Sales.SalesOrderHeader AS o
ON SumSale.CustomerID = o.CustomerID
ORDER BY CustomerID;

--2
--SELECT CustomerID, TotalDue,
--TotalDue / SUM(TotalDue) OVER(PARTITION BY CustomerID) * 100 AS PercentOfSales
--FROM Sales.SalesOrderHeader
--ORDER BY CustomerID;
