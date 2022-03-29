/****** Script for SelectTopNRows command from SSMS  ******/
use DataWork;

--To find nth highest salary using Sub-Query
SELECT TOP 2 SALARY
FROM (
      SELECT DISTINCT TOP 2 SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC
      ) RESULT
ORDER BY SALARY desc
