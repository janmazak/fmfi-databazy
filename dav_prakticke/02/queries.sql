/* ------------------------------------------------------------------------ */
/* Write and test the following queries ----------------------------------- */
/* ------------------------------------------------------------------------ */

/* 1. Print all jobs. */
SELECT DISTINCT job
FROM employee;

/* DO NOT use aggregate functions like MIN() in the following queries. */
/* Also, avoid ORDER BY and LIMIT to determine minimum. */
/* For now, we are practicing using WHERE NOT EXISTS on calculating minimum. */

/* 2. List names of all employees together with the location where they work. */

/* 3. Print the name of the department in which the president works. (Your query must not use a specific empno.) */

/* 4. Print jobs of employees who work in Chicago. (Avoid repetition. Your query must not use a specific deptno.) */

/* 5. (1 point) For each employee, list all his/her subordinates (those that have him/her as the superior).
Use an outer join so that your list contains every employee, even those without subordinates. */

/* 6. Which departments are empty (have no employees)? */

/* 7. Find the lowest salary in New York. (Remember: no LIMIT, no MIN. Use NOT EXISTS.) */

/* 8. (1 point) Which departments employ only salesmen? */

/* 9. Which employees manage only clerks? (Interpretation: at least one clerk and only clerks.) */

/* 10. (1 point) Which departments have an employee for every job in the database? (Your query must not rely on specific jobs in the given dataset.) */

/* 11. Print names, department names and salaries of all employees whose salary is greater than the lowest salary in department 20. */
