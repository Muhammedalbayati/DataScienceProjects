    use DataWork;
	with a as
	(
	SELECT DISTINCT TOP 2 SALARY,'max' as col1
    FROM EMPLOYEES
    ORDER BY SALARY DESC
	)
	select * from a
	  union 
	SELECT DISTINCT TOP 2 SALARY,'min' as col1
	FROM EMPLOYEES
	ORDER BY SALARY asc