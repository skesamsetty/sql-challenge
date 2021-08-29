--------------------------------------------------------------------------	
-- Create the titles table, with a primary id and a title
--------------------------------------------------------------------------	
DROP TABLE IF EXISTS title;

CREATE TABLE title
(
	title_id	CHAR(5) PRIMARY KEY,
	title 		VARCHAR(25)
);
COMMENT ON COLUMN title.title
    IS 'Job Title';
--------------------------------------------------------------------------
-- SELECT * FROM title;
--------------------------------------------------------------------------	
--------------------------------------------------------------------------	
-- Create an employees table, with the following: 
--    employee number, 
--    employee title id,
--    birth date
--    first name
--    last name
--    sex
--    hire date
-- set the foreign key and primary key relationships accordingly
--------------------------------------------------------------------------	
DROP TYPE IF EXISTS gender;

CREATE TYPE gender AS ENUM (
    'F',
    'M',
    ''
);
--------------------------------------------------------------------------	
DROP TABLE IF EXISTS employee;

CREATE TABLE employee
(
	employee_no 		INT 	PRIMARY KEY,
	employee_title_id 	CHAR(5) REFERENCES title(title_id),
	date_of_birth 		DATE,
	first_name 			VARCHAR(20),
	last_name 			VARCHAR(20),
	sex					GENDER,
	hire_date			DATE
);
--------------------------------------------------------------------------
-- SELECT * FROM employee;
--------------------------------------------------------------------------	
--------------------------------------------------------------------------	
-- Create an departments table, with the following: 
--    department number, 
--    department name
-- set the primary key relationships accordingly
--------------------------------------------------------------------------	
DROP TABLE IF EXISTS department;

CREATE TABLE department
(
	department_id	CHAR(4) 	PRIMARY KEY,
	department_name	VARCHAR(25)
);
--------------------------------------------------------------------------
-- SELECT * FROM department;
--------------------------------------------------------------------------	
--------------------------------------------------------------------------	
-- Create an dept_manager table, with the following: 
--    department number, 
--    employee number
-- set the foreign key and primary key relationships accordingly
--------------------------------------------------------------------------
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager
(
	department_id 	CHAR(5) REFERENCES department(department_id),
	employee_no		INT		REFERENCES employee(employee_no),
	PRIMARY KEY(department_id, employee_no)
);
--------------------------------------------------------------------------
-- SELECT * FROM dept_manager;
--------------------------------------------------------------------------	
--------------------------------------------------------------------------	
-- Create an dept_emp table, with the following: 
--    department number, 
--    employee number
-- set the foreign key and primary key relationships accordingly
--------------------------------------------------------------------------
DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp
(
	employee_no		INT		REFERENCES employee(employee_no),
	department_id 	CHAR(5) REFERENCES department(department_id),
	PRIMARY KEY(employee_no, department_id)
);
--------------------------------------------------------------------------
-- SELECT * FROM dept_emp;
--------------------------------------------------------------------------	
--------------------------------------------------------------------------	
-- Create an salaries table, with the following: 
--    salary 
--    employee number
-- set the foreign key and primary key relationships accordingly
--------------------------------------------------------------------------	
DROP TABLE IF EXISTS emp_salary;

CREATE TABLE emp_salary
(
	employee_no		INT		PRIMARY KEY		REFERENCES employee(employee_no),
	emp_salary		INT
);
--------------------------------------------------------------------------
-- SELECT * FROM emp_salary;
--------------------------------------------------------------------------