/****** Script for SelectTopNRows command from SSMS  ******/
use [AdventureWorks2019];
go

with qry1 as(
SELECT StoreID, COUNT(*) as count
  FROM [AdventureWorks2019].[Sales].[Customer]
  group by  StoreID
  )
  select * from qry1 order by count desc