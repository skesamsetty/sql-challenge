-- Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number
SELECT
	e.employee_no 	as "employee number",
	e.last_name 	as "last name",
	e.first_name 	as "first name",
	e.sex,
	s.emp_salary 	as "salary"
FROM
	employees e
LEFT OUTER JOIN 
	emp_salaries s
ON
	e.employee_no = s.employee_no
ORDER BY
	e.employee_no;

-- Select the first name, last name, and hiring date for all employees hired in 1986 

SELECT
	employee_no as "employee number",
	first_name 	as "first name",
	last_name 	as "last name",
	hire_date	as "hiring date"
FROM
	employees
WHERE
	DATE_PART('year',hire_date) = '1986'
ORDER BY
	employee_no;

-- Select the department number, department name, employee number, last name, and first name of all managers of each department

SELECT
	dm.department_id	as "department number",
	d.department_name	as "department name",
	dm.employee_no		as "manager employee number",
	e.last_name			as "manager last name",
	e.first_name		as "manager first name"
FROM
	dept_manager dm
LEFT OUTER JOIN departments d
	ON dm.department_id = d.department_id
LEFT OUTER JOIN employees e
	ON dm.employee_no = e.employee_no
ORDER BY
	d.department_id;

SELECT * FROM dept_manager;

-- Select the employee number, last name, first name, and department of each employee, ordered by employee number


-- Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"


-- Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number


-- Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number


-- Count the number of employees, grouped by last name

