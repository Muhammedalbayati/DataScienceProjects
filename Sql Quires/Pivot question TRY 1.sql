--/****** Script for SelectTopNRows command from SSMS  ******/
use DemoDb;

--Select 
--      [90 Days],[180 Days],[270 Days],[365 Days] from
--(
--select 
--		[OnHandQuantity]
--      ,[OnHandQuantityDelta]
--      ,[event_type]
--      ,[event_datetime]
--	  ,case 
--	  when DATEDIFF(day,min(event_datetime) over(),event_datetime)<=90  then '90 Days'
--	  when DATEDIFF(day,min(event_datetime) over(),event_datetime) between 91 and 180  then '180 Days'
--	  when DATEDIFF(day,min(event_datetime) over(),event_datetime) between 181 and 270  then '270 Days'
--	  when DATEDIFF(day,min(event_datetime) over(),event_datetime) >= 271   then '365 Days'
--	  end as Event_Days_Range

--from [warehouse]
--where [event_type]='InBound'
--) AS src
--PIVOT
--(
--	sum([OnHandQuantityDelta]) 
--	FOR Event_Days_Range IN ([90 Days],[180 Days],[270 Days],[365 Days])
--) as PVT

with 
src as
(
select 
		[OnHandQuantity]
      ,[OnHandQuantityDelta]
      ,[event_type]
      ,[event_datetime]
	  ,case 
		  when DATEDIFF(day,min(event_datetime) over(),event_datetime)<=90  then '90 Days'
		  when DATEDIFF(day,min(event_datetime) over(),event_datetime) between 91 and 180  then '180 Days'
		  when DATEDIFF(day,min(event_datetime) over(),event_datetime) between 181 and 270  then '270 Days'
		  when DATEDIFF(day,min(event_datetime) over(),event_datetime) >= 271   then '365 Days'
	  end as Event_Days_Range

from [warehouse]
order by event_datetime desc
--where [event_type]='InBound'
),
inv_90_days as
	(select isnull(sum())