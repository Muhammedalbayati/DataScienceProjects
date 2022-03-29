--find highest sales for each date

use DataWork;

select * from (

select format([order date],'MM/dd/yy') orderDate,Sales,
	ROW_NUMBER() over(partition by format([order date],'MM/dd/yy') order by format([order date],'MM/dd/yy'), sales desc) row_num  
from Orders

) as qry where row_num=1




--select [Order Date],max(total_sales) from (
--SELECT [Order Date],SUM(sales) Total_sales
--  FROM [DataWork].[dbo].[Orders]
--  group by [Order Date]
--  ) qry
--  group by [Order Date]