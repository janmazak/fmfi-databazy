/* ------------------------------------------------------------------------ */
/* Write and test the following queries ----------------------------------- */
/* ------------------------------------------------------------------------ */

/* 1. Print all jobs. */
SELECT DISTINCT job
FROM employee;

/* DO NOT use aggregate functions like MIN() in the following queries. */
/* Also, try avoiding ORDER BY and LIMIT to determine minimum. */
/* For now, we are practicing using WHERE NOT EXISTS on calculating minimum. */

/* 2. Print names and hiring dates of all clerks. */

/* 3. List names and jobs of employees with salary at least 2000. */

/* 4. Print names of employees who were hired between 1981 and 1982. */

/* 5. Print names and salaries of all managers and analysts. */

/* 6. Print the name of the department in which the president works. (Your query must not use a specific empno.) */

/* 7. Print jobs of employees who work in Chicago. (Your query must not use a specific deptno.) */

/* 8. For each employee, print a list of all coworkers, that is, the list all tuples [Employee_name, Location, Coworker]. */

/* 9. Print names of employees together with names of their managers. */

/* 10. Find the lowest salary in New York. */

/* 11. Print names, department names and salaries of all employees whose salary is greater than the lowest salary in department 20. */

/* 12. Which departments contain all job positions? (Your query must not rely on specific positions in the given dataset.) */

/* 13. Which departments are empty (have no employees)? */

/* 14. Which employees manage only clerks? */

/* 15. Which departments employ only salesmen? */

/* 16. Find pairs of departments such that each employee in the first department has higher salary than every employee in the second department. */

