DROP TABLE IF EXISTS employee;

CREATE TABLE employee(
   empno INTEGER PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   job VARCHAR(50) NOT NULL,
   superior INTEGER,
   hiredate DATE,
   salary DECIMAL(10,2),
   deptno INTEGER NOT NULL
);

insert into employee values (11, 'King', 'president', null, '1990-06-09', 5000, 10);
insert into employee values (12, 'Blake', 'manager', 11, '1992-06-11', 2850, 30);
insert into employee values (13, 'Clark', 'manager', 11, '1993-05-14', 1500, 10);
insert into employee values (14, 'Jones', 'manager', 11, '1995-10-31', 2975, 20);
insert into employee values (15, 'Martin', 'salesman', 12, '1998-12-05', 2650, 30);
insert into employee values (16, 'Allen', 'salesman', 12, '1998-08-15', 1900, 30);
insert into employee values (17, 'Turner', 'salesman', 12, '1995-06-04', 1500, 30);
insert into employee values (18, 'James', 'clerk', 15, '2000-06-23', 950, 30);
insert into employee values (19, 'Ward', 'salesman', 12, '1996-03-26', 1750, 30);
insert into employee values (20, 'Ford', 'analyst', 13, '1997-12-05', 3000, 20);
insert into employee values (21, 'Smith', 'clerk', 12, '1993-06-13', 800, 20);
insert into employee values (22, 'Scott', 'analyst', 13, '1996-03-05', 3000, 20);
insert into employee values (23, 'Adams', 'clerk', 11, '1999-06-04', 1100, 20);
insert into employee values (24, 'Miller', 'clerk', 14, '2000-01-21', 1300, 10);
