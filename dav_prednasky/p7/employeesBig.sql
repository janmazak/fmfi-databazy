-- Note that we drop the tables in the reverse order because
-- we don't want to e.g. delete employees before deleting projects assigned to them .
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

CREATE TABLE department (
   deptno INTEGER PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   location VARCHAR(50) NOT NULL
);

CREATE TABLE employee (
   empno INTEGER PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   job VARCHAR(50) NOT NULL,
   superior INTEGER,
   hiredate DATE,
   salary DECIMAL(10,2),
   deptno INTEGER NOT NULL
);

-- Note that if several employees work on a project, the record for each employee
-- contains the name of the project; this redundancy is an example of a bad practice.
-- Later, we learn how to avoid that.
CREATE TABLE project (
   projno INTEGER NOT NULL,
   name VARCHAR(50) NOT NULL,
   empno INTEGER NOT NULL
);


INSERT INTO department SELECT generate_series(1,1000000), md5(random()::text), md5(random()::text);
INSERT INTO employee SELECT generate_series(1,1000000), md5(random()::text), md5(random()::text), NULL, NULL, random(), random();
INSERT INTO project SELECT generate_series(1,1000000), md5(random()::text), random();
