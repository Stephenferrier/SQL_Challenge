-- 2: List the first name, last name, and hire date for the employees who were hired in 1986
SELECT 
	first_name, last_name, hire_date 
FROM 
	employees
WHERE 
	extract(year from hire_date) = 1986;

-- 3:List the manager of each department along with their department number, department name, employee number, 
--last name, and first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

--4: List the department of each employee with the following information: employee number, last name, first name, 
--and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

--5: List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name Like 'B%';

--6: List all employees in the Sales department, including their employee number, last name, first name, 
--and department name. 
SELECT departments.dept_name, employees.last_name, employees.first_name, employees.emp_no
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';
--7 List each employee in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';
--8 List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;