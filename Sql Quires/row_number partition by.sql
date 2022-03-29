use AdventureWorks2019;

with qry
as(
SELECT [Country],Zip,	year([Date])AS[Year],sum([Revenue])TotalForZip
  FROM [ExcelBI].[dbo].[Sales]
  group by Country,zip,YEAR([date])
  )
  select *, cast(([year]) as varchar(10))+'-'+ cast( ROW_NUMBER() over(partition by zip order by zip, [year]) as nvarchar(10))Seq from qry