-- QUERIES FOR ANALYSIS

-- 1) List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT
	e.emp_no as employee_number,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM
	"Employees" e
	join "Salaries" s on e.emp_no = s.emp_no
ORDER BY
	e.last_name asc
LIMIT 100;

-- 2) List first name, last name, and hire date for employees who were hired in 1986.

SELECT
	e.first_name,
	e.last_name,	
	e.hire_date
FROM
	"Employees" e
WHERE
	extract(year from e.hire_date) = 1986
ORDER BY
	e.last_name asc
LIMIT 100;

-- 3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT
	d.dept_no,
	d.dept_name,
	e.emp_no as employee_number,
	e.last_name,
	e.first_name
FROM
	"Departments" d
	join "Department_Managers" dm on d.dept_no = dm.dept_no
	join "Employees" e on dm.emp_no = e.emp_no
	join "Titles" t on e.emp_title = t.title_id
order by
	d.dept_no,
	e.last_name;
	
-- 4) List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
	e.emp_no as employee_number,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	"Departments" d
	join "Department_Employees" de on d.dept_no = de.dept_no
	join "Employees" e on de.emp_no = e.emp_no
order by
	e.emp_no
limit 20;

-- 5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM
	"Employees" e
WHERE
	e.first_name = 'Hercules' AND e.last_name LIKE 'B%'
order by
	e.last_name
limit 20;

-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
	e.emp_no as employee_number,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	"Departments" d
	join "Department_Employees" de on d.dept_no = de.dept_no
	join "Employees" e on de.emp_no = e.emp_no
WHERE
	d.dept_name = 'Sales'
order by
	e.emp_no
limit 20;

-- 7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	e.emp_no as employee_number,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	"Departments" d
	join "Department_Employees" de on d.dept_no = de.dept_no
	join "Employees" e on de.emp_no = e.emp_no
WHERE
	d.dept_name = 'Sales' OR d.dept_name = 'Development'
order by
	e.emp_no
limit 20;

-- 8) List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT
	e.last_name,
	count(*) as num_emps
FROM
	"Employees" e
GROUP BY
	e.last_name
order by
	num_emps desc
limit 20;