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

/* 1. Print all jobs. */
job(J) :- emp(_, _, J, _, _, _, _).

/* 2. Print names and hiring years of all clerks. */

/* 3. List names and jobs of all employees. */

/* 4. List all employees; for each of them, include his name and the name of his department. */

/* 5. List clerks with salary above 1000. */

/* Check whether all the rules you have used are safe. */
