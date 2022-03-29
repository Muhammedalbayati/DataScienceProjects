--2. The following queries each contain two calculations: percent of sales by customer and percent of
--sales by territory. Type in and execute the code to see the difference in performance. Make sure
--the Include Actual Execution Plan setting is turned on before running the code.
USE AdventureWorks2019;
GO
--1
WITH SumSale AS
(
	SELECT SUM(TotalDue) AS SumTotalDue,
	CustomerID
	FROM Sales.SalesOrderHeader
	GROUP BY CustomerID
),
TerrSales AS
(
	SELECT SUM(TotalDue) AS SumTerritoryTotalDue, TerritoryID
	FROM Sales.SalesOrderHeader
	GROUP BY TerritoryID 
)
	SELECT o.CustomerID, TotalDue,
	TotalDue / SumTotalDue * 100 AS PercentOfCustSales,
	TotalDue / SumTerritoryTotalDue * 100 AS PercentOfTerrSales
FROM SumSale
	INNER JOIN Sales.SalesOrderHeader AS o ON SumSale.CustomerID = o.CustomerID
	INNER JOIN TerrSales ON TerrSales.TerritoryID = o.TerritoryID
	ORDER BY CustomerID;


	--2
SELECT CustomerID, TotalDue,
TotalDue / SUM(TotalDue) OVER(PARTITION BY CustomerID) * 100 AS
PercentOfCustSales,
TotalDue / SUM(TotalDue) OVER(PARTITION BY TerritoryID) * 100 AS
PercentOfTerrSales
FROM Sales.SalesOrderHeader
ORDER BY CustomerID;