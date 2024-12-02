-- Note that we drop the tables in the reverse order because
-- we don't want to e.g. delete employees before deleting projects assigned to them.
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

CREATE TABLE department(
   dept_id INTEGER PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   location VARCHAR(50) NOT NULL
);

CREATE TABLE employee(
   emp_id INTEGER PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   job VARCHAR(50) NOT NULL,
   salary DECIMAL(10, 2),
   superior INTEGER,
   dept_id INTEGER NOT NULL
);

-- Note that if several employees work on a project, the record for each employee
-- contains the name of the project; this redundancy is an example of a bad practice.
-- Later, we learn how to avoid that.
CREATE TABLE project (
   proj_id INTEGER NOT NULL,
   name VARCHAR(50) NOT NULL,
   emp_id INTEGER NOT NULL
);

INSERT INTO department VALUES (10, 'Accounting', 'New York');
INSERT INTO department VALUES (20, 'Research', 'Dallas');
INSERT INTO department VALUES (30, 'Sales', 'Chicago');

INSERT INTO employee VALUES (11, 'King', 'president', 5000, NULL, 10);
INSERT INTO employee VALUES (12, 'AccountingManager', 'manager', 1500, 11, 10);
INSERT INTO employee VALUES (13, 'AccountingClerk', 'clerk', 1300, 12, 10);
INSERT INTO employee VALUES (14, 'SalesManager', 'manager', 2975, 11, 30);
INSERT INTO employee VALUES (15, 'MoneyMagnet', 'salesman', 2650, 14, 30);
INSERT INTO employee VALUES (16, 'DealMaster', 'salesman', 1900, 14, 30);
INSERT INTO employee VALUES (17, 'MrFixIt', 'clerk', 950, 14, 30);
INSERT INTO employee VALUES (18, 'InsightNinja', 'analyst', 3000, 14, 30);

INSERT INTO project VALUES (1, 'Enviro1', 15);
INSERT INTO project VALUES (1, 'Enviro1', 17);
INSERT INTO project VALUES (2, 'Enviro2', 14);
INSERT INTO project VALUES (3, 'Nuclear3', 14);
INSERT INTO project VALUES (3, 'Nuclear3', 18);
