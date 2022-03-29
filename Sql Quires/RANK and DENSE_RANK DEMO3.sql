SELECT top 10  [ProductID]
      ,[Date]
      ,[Zip]
      ,[Units]
      ,[Revenue]
      ,[Country]
	  ,RANK() over(order by revenue desc) Rank_rev
  FROM [ExcelBI].[dbo].[Sales]
  --order by Revenue desc

  SELECT top 10  [ProductID]
      ,[Date]
      ,[Zip]
      ,[Units]
      ,[Revenue]
      ,[Country]
	  ,dense_RANK() over(order by revenue desc) Rank_rev
  FROM [ExcelBI].[dbo].[Sales]