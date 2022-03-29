Select 'For ' + cast(sh.OrderDate as nvarchar(20)) + ' there are '+ CAST(count(*) as varchar(5)) + ' Orders' as SalesOrder
from Sales.SalesOrderHeader SH
group by sh.OrderDate 
