
SELECT 
		[Country],	year([Date])AS[Year],sum([Revenue]) TotalRevenue
  FROM [ExcelBI].[dbo].[Sales]
  where Zip=78758
  group by 
  grouping sets
  (
	([Country],year([Date])),--Sum of Revenue by Country & Year
	(year([Date])),----Sum of Revenue by  Year
	([Country]),----Sum of Revenue by Country 
	()----Grand Total
  )