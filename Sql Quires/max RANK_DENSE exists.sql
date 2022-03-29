use DataWork;
go

select top 3 [Order Date],Sales from SalesData
order by Sales desc
go

with qry as
(
select [Order Date],Sales,DENSE_RANK() over(order by sales desc) DenseRank 
from SalesData
)
select * from qry
where DenseRank <10

go


select [Order Date],Sales from
SalesData
where  exists (
select [Order Date], MAX(sales) from SalesData
group by [Order Date]
)
order by Sales desc