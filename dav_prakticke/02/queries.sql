/* ------------------------------------------------------------------------ */
/* Write and test the following queries ----------------------------------- */
/* ------------------------------------------------------------------------ */

/* 1. Print all jobs. */
SELECT DISTINCT job
FROM employee;

/* DO NOT use aggregate functions like MIN() in the following queries. */
/* Also, try avoiding ORDER BY and LIMIT to determine minimum. */
/* For now, we are practicing using WHERE NOT EXISTS on calculating minimum. */

/* 2. List names and jobs of employees with salary at least 2000. */

/* 3. Print names and salaries of all managers and analysts. */

/* 4. Print the name of the department in which the president works. (Your query must not use a specific empno.) */

/* 5. Print jobs of employees who work in Chicago. (Your query must not use a specific deptno.) */

/* 6. For each employee, print a list of all coworkers (we want the list of all tuples [Employee_name, Location, Coworker]). */

/* 7. Find the lowest salary in New York. */

/* 8. Print names, department names and salaries of all employees whose salary is greater than the lowest salary in department 20. */

/* 9. Which departments are empty (have no employees)? */

/* 10. (1 point) Which departments contain all job positions? (Your query must not rely on specific positions in the given dataset.) */

/* 11. (1 point) Which employees manage only clerks? */

/* 12. Which departments employ only salesmen? */
