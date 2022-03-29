--The follwing is an interview question from Raybeam company. 6-Dec-2021
-- 4. What is the cumulative unique # of customers over time?  
-- Output should be: date, total # of unique customers 

use DemoDb;
select order_date,
       sum(sum(case when seq = 1 then 1 else 0 end)) over (order by order_date) cumulative_count
	from (
			select O.*,
					row_number() over (partition by cust_id order by order_date) as seq
			from Orders O
     ) t
group by order_date
order by order_date;