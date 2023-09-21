# EXPLAIN examples

Getting a query plan in SQL:
* [EXPLAIN syntax](https://www.postgresql.org/docs/current/sql-explain.html)
* [EXPLAIN usage](https://www.postgresql.org/docs/current/using-explain.html)
* [EXPLAIN simple tutorial](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-explain/)

## Example query plans

```
EXPLAIN SELECT * FROM employee e 
JOIN department d ON e.deptno = d.deptno
ORDER BY e.name;

                                    QUERY PLAN                                     
-----------------------------------------------------------------------------------
 Sort  (cost=41.07..41.75 rows=270 width=508)
   Sort Key: e.name
   ->  Hash Join  (cost=16.75..30.17 rows=270 width=508)
         Hash Cond: (e.deptno = d.deptno)
         ->  Seq Scan on employee e  (cost=0.00..12.70 rows=270 width=268)
         ->  Hash  (cost=13.00..13.00 rows=300 width=240)
               ->  Seq Scan on department d  (cost=0.00..13.00 rows=300 width=240)
```

```
EXPLAIN SELECT * FROM employee e WHERE NOT EXISTS (
	SELECT 1 FROM project p 
	WHERE p.empno = e.empno AND p.name LIKE '%N%'
	ORDER BY p.projno	/* ignored by the db */
);

                               QUERY PLAN                               
------------------------------------------------------------------------
 Hash Anti Join  (cost=23.25..41.70 rows=135 width=268)
   Hash Cond: (e.empno = p.empno)
   ->  Seq Scan on employee e  (cost=0.00..12.70 rows=270 width=268)
   ->  Hash  (cost=16.62..16.62 rows=530 width=4)
         ->  Seq Scan on project p  (cost=0.00..16.62 rows=530 width=4)
               Filter: ((name)::text ~~ '%N%'::text)
```

```
EXPLAIN
WITH bounds AS (
	SELECT deptno, AVG(salary) * 0.6 AS upper, AVG(salary) * 0.4 as lower
	FROM employee
	GROUP BY deptno
)
SELECT COUNT(*) AS c
FROM employee e
	JOIN bounds b ON e.deptno = b.deptno
WHERE e.salary >= b.lower AND e.salary <= b.upper;

                                        QUERY PLAN                                        
------------------------------------------------------------------------------------------
 Aggregate  (cost=36.71..36.72 rows=1 width=8)
   ->  Hash Join  (cost=23.23..36.63 rows=30 width=0)
         Hash Cond: (e.deptno = b.deptno)
         Join Filter: ((e.salary >= b.lower) AND (e.salary <= b.upper))
         ->  Seq Scan on employee e  (cost=0.00..12.70 rows=270 width=20)
         ->  Hash  (cost=20.73..20.73 rows=200 width=68)
               ->  Subquery Scan on b  (cost=14.72..20.73 rows=200 width=68)
                     ->  HashAggregate  (cost=14.72..18.73 rows=200 width=68)
                           Group Key: employee.deptno
                           ->  Seq Scan on employee  (cost=0.00..12.70 rows=270 width=20)
```

```
EXPLAIN
SELECT COUNT(*) FROM employee AS e
WHERE e.empno NOT IN (SELECT empno FROM project);

                               QUERY PLAN                               
------------------------------------------------------------------------
 Aggregate  (cost=30.34..30.35 rows=1 width=8)
   ->  Seq Scan on employee e  (cost=16.62..30.00 rows=135 width=0)
         Filter: (NOT (hashed SubPlan 1))
         SubPlan 1
           ->  Seq Scan on project  (cost=0.00..15.30 rows=530 width=4)
```

