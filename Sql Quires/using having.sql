/****** Script for SelectTopNRows command from SSMS  ******/
SELECT Category,COUNT(*),MAX(Profit)
  FROM [DataWork].[dbo].[Orders]
  --where Category='Furniture'
  group by Category
  having COUNT(*)>2000 
   -- we can't use [where count(*)>2000], but we can use [having count(*)>2000