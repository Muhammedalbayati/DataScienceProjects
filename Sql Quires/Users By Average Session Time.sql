--Users By Average Session Time
--Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. 
--For simplicity, assume a user has only 1 session per day and if there are multiple of the same events 
--on that day, consider only the latest page_load and earliest page_exit. Output the user_id and their average session time.

use stratascratch;
go

with data as
(
SELECT s1.user_id,s1.timestamp, datediff(SECOND,s2.timestamp,s1.timestamp) as duration
  FROM [sessions] s1
  join [sessions] s2 on s1.user_id=s2.user_id
  where s1.action='page_load' and s2.action='page_exit'

  )
  select data.[user_id],AVG(data.duration) from data
  group by data.[user_id]