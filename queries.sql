-- 	Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number
--Below query retrieves all employees along their names, gender and salary.
SELECT
	e.employee_no 	as "employee number",
	e.last_name 	as "last name",
	e.first_name 	as "first name",
	e.sex,
	s.emp_salary 	as "salary"
FROM
	employees e
LEFT OUTER JOIN emp_salaries s
	ON e.employee_no = s.employee_no
ORDER BY
	e.employee_no;

-- 	Select the first name, last name, and hiring date for all employees hired in 1986 
--Below query retrieves all the employees hired in the year 1986.
SELECT
	employee_no as "employee number",
	first_name 	as "first name",
	last_name 	as "last name",
	hire_date	as "hiring date"
FROM
	employees
WHERE
	EXTRACT('year' FROM hire_date) = '1986'
ORDER BY
	employee_no;

-- 	Select the department number, department name, employee number, last name, and first name of all managers of each department
--Below query extract the employee number, last name and first name of all the managers defined in each department.
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

-- 	Select the employee number, last name, first name, and department of each employee, ordered by employee number
--Below query retrieves last name, first name and department name for each and every employee.
SELECT
	e.employee_no		as "employee number",
	e.last_name			as "last name",
	e.first_name		as "first name",
	d.department_name 	as "department",
	de.department_id	as "department number"
FROM
	employees e
LEFT OUTER JOIN dept_emp de
	ON e.employee_no = de.employee_no
LEFT OUTER JOIN departments d
	ON de.department_id = d.department_id
ORDER BY
	e.employee_no;
	
-- 	Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"
--Below query retrieves all employees with the First name "Hercules" and Last name starting with "B". 
SELECT
	employee_no 	as "employee number",
	first_name		as "first name",
	last_name		as "last name",
	date_of_birth	as "birth date",
	sex				
FROM
	employees
WHERE
	first_name = 'Hercules'
	and last_name like 'B%'
ORDER BY 
	last_name;

-- 	Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number
--Below query retrieves all the employees in the Sales department.
SELECT
	e.employee_no		as "employee number",
	e.last_name			as "last name",
	e.first_name		as "first name",
	d.department_name 	as "department",
	de.department_id	as "department number"
FROM
	employees e
LEFT OUTER JOIN dept_emp de
	ON e.employee_no = de.employee_no
LEFT OUTER JOIN departments d
	ON de.department_id = d.department_id
WHERE
	d.department_name = 'Sales'
ORDER BY
	e.employee_no;

-- 	Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number
--Below query retrieves all the employees that are part of either Sales department or Development department.
SELECT
	e.employee_no		as "employee number",
	e.last_name			as "last name",
	e.first_name		as "first name",
	d.department_name 	as "department",
	de.department_id	as "department number"
FROM
	employees e
LEFT OUTER JOIN dept_emp de
	ON e.employee_no = de.employee_no
LEFT OUTER JOIN departments d
	ON de.department_id = d.department_id
WHERE
	d.department_name IN ('Sales', 'Development')
ORDER BY
	e.employee_no;

-- 	Count the number of employees, grouped by last name
--Below query retrieves the counts of employees sharing each last name in Descending order.
SELECT
	last_name as "last name",
	count(employee_no) as "employee_count"
FROM
	employees
GROUP BY
	last_name
ORDER BY
	employee_count DESC;