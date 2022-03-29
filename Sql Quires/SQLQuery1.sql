/****** Script for SelectTopNRows command from SSMS  ******/
select [Customer ID],COUNT(distinct [Customer ID])
from(
	SELECT  [Customer ID]
	FROM [DataWork].[dbo].Orders
  )x
  group by [Customer ID]
  having COUNT([Customer ID])>2