--1: List the employee number, last name, first name, sex, and salary of each employee.
Select 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM 
	employees e 
	join salaries s on e.emp_no = s.emp_no
Order by
	e.last_name ASC,
	s.salary DESC;