--this question was given to me in an interview
--4.  Which date did each salesperson make their highest total sales and what was the amount?
--Result should be salesperson, date, amount.

use DataWork;

select  max(total_sales) as highest_Sales,[order_date]  from
(
	select sum(sales) as total_sales,format([Order Date],'MM/yyyy') order_date
	from Orders
	group by format([Order Date],'MM/yyyy')
)q

group by order_date
order by highest_Sales desc,q.order_date