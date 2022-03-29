--How to find n consecutive date records | Sales for at least n consecutive days
--https://youtu.be/OFtYnnl15Qs
with t1 as
(
SELECT 
	[Customer ID]
	,[Order ID]
	,[Order Date]
	,ROW_NUMBER() over(partition by [customer id] order by [order date] asc) rn
	,dateadd(d, -ROW_NUMBER() over(partition by [customer id] order by [order date] asc),[Order Date]) col1
  FROM [DataWork].[dbo].[Orders2]
  )
  select COUNT(*) as cnt, MIN([order date]) 'start',max([order date]) 'end' 
  from t1
  group by col1
  having COUNT(*)>1



