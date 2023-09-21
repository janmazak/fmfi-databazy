/* ------------------------------------------------------------------------ */
/* Do not edit this part ---------------------------------------------------*/
/* ------------------------------------------------------------------------ */
:- consult('emp.pl').
:- consult('query.pl').

% emp(Employee Number, Name, Job, Superior, Employed from, Salary, Department Number)
% dept(Department Number, Name, Location)

/* ------------------------------------------------------------------------ */
/* Write and test the following queries ----------------------------------- */
/* ------------------------------------------------------------------------ */


/* 1. List names and jobs of employees with salary at least 2000. */

/* 2. Print names and salaries of all managers and analysts. */

/* 3. Print the name of the department in which the president works. */

/* 4. Print jobs of employees who work in Chicago. */

/* 5. Print names of employees together with names of their managers. */

/* 6. Find the lowest salary in New York. */

/* 7. Print names, department names and salaries of all employees whose salary is greater than the lowest salary in department 20. */



/* Check whether all the rules you have used so far are safe. Really, do it, and first make sure you understand what a safe rule is:
"p(Z) :- q(X, Y), Y < Z." is not safe; neither is "p(Z) :- q(Z), \+ r(Z, _)."
Note that about half of the solutions submitted in 2020 contained several unsafe rules. */



/* 8. Which departments contain all job positions? */

/* 9. Which departments are empty (have no employees)? */

/* 10. Find names of all employees who are subordinates of Blake (both direct and indirect). */

/* 11. For each employee, print a list of all coworkers, that is, list all tuples [Employee name, Location, Coworker]. */

/* 12. Which employees manage only clerks? */

/* 13. Print names of employees who were hired between 1995 and 1998. */

/* 14. Which departments employ no salesmen? */

/* 15. Determine if all the departments have a pair of employees earning the same wage. */

/* 16. Determine if all the departments have exactly two possible salary grades (the set of all salaries has two elements). */



/* Check whether all the rules you have used are safe. */
