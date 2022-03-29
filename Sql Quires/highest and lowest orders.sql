--highest orders with date
select [Order Date],Sales from
[DataWork].[dbo].[SalesData]
where sales =
(
	SELECT max(sales)
	FROM [DataWork].[dbo].[SalesData]
  )
go

  --highest and lowest orders with date
  select [Order Date],Sales from
[DataWork].[dbo].[SalesData]
where sales in
(
	SELECT max(sales)
		FROM [DataWork].[dbo].[SalesData]
	union
	SELECT min(sales)
		FROM [DataWork].[dbo].[SalesData]
  )