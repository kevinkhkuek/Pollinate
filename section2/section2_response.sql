
-- Section 2

-- Question 1
select *
from dbo.CITY
where ID = 1661
;

-- Question 2
select name
from dbo.Employee
where
  salary > 2000
  and months < 10
order by
  employee_id asc
;

-- Question 3
select Name + '(' + SUBSTRING(Occupation, 1, 1) + ')' as derivedname
from dbo.OCCUPATIONS
order by 1 asc
;

select 'There are a total of ' + CAST( count(*) as varchar(5)) + ' ' + lower(Occupation) + 's'
from dbo.OCCUPATIONS
group by Occupation
order by count(*) asc, Occupation asc
;

--Question 4
WITH print_star(r, outstar)
AS (
  select 1, cast('*' as varchar(50))
  
  UNION ALL

  select r + 1, cast(outstar + '*' as varchar(50)) 
  from print_star
  where r < 3

)
select outstar
from print_star
;

--Question 5
WITH print_star(r, outstar)
AS (
  select 5, cast(REPLICATE('*', 5) as varchar(50))
  
  UNION ALL

  select r - 1, cast(REPLICATE('*', r - 1) as varchar(50))
  from print_star
  where r - 1 > 0

)
select outstar
from print_star
;


--Question 6
--Create table Projects
--   (
--      ProjectID  int
--      ,[ProjectedMonth] Date
--      ,Labor Int
--     ,Equipment int
--   )
--Insert into  Projects values (1,'2021-09-01', 500, 0)
-- , (1,'2021-10-01', 250,250)
-- , (1,'2021-11-01', 100,50)
-- , (2,'2021-11-01', 100,50)
-- , (2,'2021-12-01', 100,50)
--;

SELECT title, [2021-09-01], [2021-10-01], [2021-11-01]  
FROM   
   (
	select ProjectedMonth, Labor, Equipment
	from Projects
	where ProjectID = 1
   ) p  
UNPIVOT (
	cost FOR title 
	IN   
      (Labor, Equipment)  
)AS unpvt

PIVOT (
	SUM(cost) FOR ProjectedMonth
	IN
	  ([2021-09-01], [2021-10-01], [2021-11-01], [2021-12-01])
)AS pvt
; 
