SELECT [Country],Zip,	year([Date])AS[Year],sum([Revenue])TotalForZip,ROW_NUMBER() over(partition by zip order by zip,year([date])) as RowNumber
  FROM [ExcelBI].[dbo].[Sales]
  group by Country,zip,YEAR([date])