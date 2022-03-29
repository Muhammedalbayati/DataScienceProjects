/* Find dublicated row  */
use DataWork;
with qry as(
SELECT  [ID]
      ,[FirstName]
      ,[LastName]
      ,[Gender]
      ,[Salary]
      ,[department_id]
	  ,ROW_NUMBER() over(partition by firstname,lastname order by firstname,lastname) as RowNumber
  FROM [DataWork].[dbo].[Employees]
  ) 

  select * from qry where RowNumber>1

  go


SELECT
      [FirstName]
      ,[LastName]
      ,[Gender]
      ,[Salary]
,COUNT(*) as cnt
  FROM [DataWork].[dbo].[Employees]
  group by
        [FirstName]
      ,[LastName]
      ,[Gender]
      ,[Salary]
having COUNT(*)>1