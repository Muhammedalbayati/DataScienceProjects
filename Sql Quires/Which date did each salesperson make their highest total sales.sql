--Which date did each salesperson make their highest total sales
use DataWork

SELECT s.[Order Date],e.ID,e.FirstName,s.Sales
  FROM [DataWork].[dbo].[SalesData] S
	join Employees E on s.[Employee ID]=e.ID
					 where s.Sales=(
						 select max(Sales) from SalesData 
						 where [Employee ID]=e.ID
					 )
		order by Sales desc