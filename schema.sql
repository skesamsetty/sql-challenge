--------------------------------------------------------------------------	
-- Create the titles table, with a primary id and a title
--------------------------------------------------------------------------	
DROP TABLE IF EXISTS titles;

CREATE TABLE titles
(
	title_id	CHAR(5) PRIMARY KEY,
	title 		VARCHAR(25)
);
COMMENT ON COLUMN titles.title
    IS 'Job Title';
--------------------------------------------------------------------------
-- SELECT * FROM titles;
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
DROP TABLE IF EXISTS employees;

CREATE TABLE employees
(
	employee_no 		INT 	PRIMARY KEY,
	employee_title_id 	CHAR(5) REFERENCES titles(title_id),
	date_of_birth 		DATE,
	first_name 			VARCHAR(20),
	last_name 			VARCHAR(20),
	sex					GENDER,
	hire_date			DATE
);
--------------------------------------------------------------------------
-- SELECT * FROM employees;
--------------------------------------------------------------------------	
--------------------------------------------------------------------------	
-- Create an departments table, with the following: 
--    department number, 
--    department name
-- set the primary key relationships accordingly
--------------------------------------------------------------------------	
DROP TABLE IF EXISTS departments;

CREATE TABLE departments
(
	department_id	CHAR(4) 	PRIMARY KEY,
	department_name	VARCHAR(25)
);
--------------------------------------------------------------------------
-- SELECT * FROM departments;
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
	department_id 	CHAR(5) REFERENCES departments(department_id),
	employee_no		INT		REFERENCES employees(employee_no)
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
	employee_no		INT		REFERENCES employees(employee_no),
	department_id 	CHAR(5) REFERENCES departments(department_id)
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
DROP TABLE IF EXISTS emp_salaries;

CREATE TABLE emp_salaries
(
	employee_no		INT		PRIMARY KEY		REFERENCES employees(employee_no),
	emp_salary		INT
);
--------------------------------------------------------------------------
-- SELECT * FROM emp_salaries;
--------------------------------------------------------------------------