use AdventureWorks2019;

SELECT [Country],	year([Date])AS[Year],sum([Revenue]) TotalRevenue
  FROM [ExcelBI].[dbo].[Sales]
  where Zip=78758
  group by rollup([Country],year([Date]))

  -- grouping_id
  SELECT
	IIF(GROUPING_ID(Country)=1,'Total','Subtoal') as [Level],
	[Country],	year([Date])AS[Year],sum([Revenue]) TotalRevenue
  FROM [ExcelBI].[dbo].[Sales]
  where Zip=78758
  group by rollup([Country],year([Date]))

-- the query below give same result as the above
  SELECT [Country],	year([Date])AS[Year],sum([Revenue]) TotalRevenue
  FROM [ExcelBI].[dbo].[Sales]
  where Zip=78758
  group by Country,YEAR(date) with rollup