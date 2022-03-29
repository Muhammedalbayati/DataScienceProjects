use DemoDb;
select
	order_date,
	sum(case when seq=1 then 1 else 0 end) over (order by order_date) cum_count
	from
	(
		select O.*,
				row_number() over (partition by cust_id order by order_date) as seq
		from Orders O
	) t