/* ------------------------------------------------------------------------ */
/* Do not edit this part ---------------------------------------------------*/
/* ------------------------------------------------------------------------ */
:- consult('emp.pl').
:- consult('subtotal.pl').
:- consult('query.pl').

%Database emp:
%emp(Empno, Ename, Job, Mgr, Hiredate, Sal, Comm, Deptno)
%dept(Deptno, Dname, Loc)
%salgrade(Grade, Losal, Hisal)

/* ------------------------------------------------------------------------ */
/* Write and test the following queries ----------------------------------- */
/* ------------------------------------------------------------------------ */

/* 1. Find the number of employees who work in Dallas. */

emp_dallas(E) :-
  emp(E, _, _, _, _, _, _, D),
  dept(D, _, dallas).

nr_emp_dallas(N) :-
  subtotal(emp_dallas(E), [], [N = count(E)]).


/* 2. Find the average salary of employees who work in Dallas. */

/* 3. For each department, including departments with no employees, find the sum of salaries of all employees who work in that department. */

/* 4. Find departments (deptno) with more than 3 employees. */

/* 5. Find tuples [D, J, Sum, Average] which, for each pair [D, J], state the sum of salaries and average salary of employees who work in department D and do job J. */

/* 6. For each department, find the number of analysts who do not work in that department (include departments with 0, too). */

/* 7. Find the jobs with the maximal standard deviation of salaries. */

/* 8. Find the departments with the second highest average salary. (Careful: there might be more departments having the same average salary.) */

/* 9. Find tuples [Y, N] where N is the number of employees hired in the year Y (the result should contain only years when an employee was hired). */

/* 10. For each employee, find the number of subordinates (both direct and indirect) of that employee. Include employees with no subordinates. */
