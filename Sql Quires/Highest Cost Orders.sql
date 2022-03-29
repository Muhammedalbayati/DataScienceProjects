--Highest Cost Orders
--Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. 
--If customer had more than one order on a certain day, sum the order costs on daily basis. 
--Output their first name, total cost of their items, and the date.
-- For simplicity, you can assume that every first name in the dataset is unique.

use stratascratch;
go


with data as(
	select cust_id,first_name,order_date,SUM(total_order_cost) total_order_cost
	from Customers c
	join Orders o on c.id=o.cust_id
	where order_date between '2019-02-01' and '2019-05-01'
	group by cust_id,first_name,order_date
)
,
x as
(
	select cust_id,first_name,order_date,total_order_cost,
	DENSE_RANK() over(order by total_order_cost desc) dr 
	--DENSE_RANK() over(partition by cust_id order by total_order_cost desc) dr --for highest cost for each user
	from data
)
select first_name,	total_order_cost,	order_date from x
where x.dr=1
--order by total_order_cost desc --for highest cost for each user



