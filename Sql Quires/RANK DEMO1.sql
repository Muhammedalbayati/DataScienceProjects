--SELECT      c.name  AS 'ColumnName'
--            ,t.name AS 'TableName'
--FROM        sys.columns c
--JOIN        sys.tables  t   ON c.object_id = t.object_id
--WHERE       c.name LIKE '%listprice%'
--ORDER BY    TableName
--            ,ColumnName;
use AdventureWorks2019;
go
--select * from Production.Product;

select top(10) ProductID,p.[name],ListPrice,c.Name as cat ,RANK() over(order by listprice desc) as RankByPrice
from Production.Product as p 
join [Production].[ProductCategory] as c 
on p.ProductSubcategoryID=c.ProductCategoryID
order by rankbyprice;

select  ProductID,p.[name],ListPrice,c.Name as cat ,
	RANK() over(partition by c.name order by listprice desc) as RankByPrice

from Production.Product as p join [Production].[ProductCategory] as c
on p.ProductSubcategoryID=c.ProductCategoryID
order by rankbyprice;