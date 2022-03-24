USE join_test_db;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON de.emp_no = e.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
AND e.emp_no = 10001;

-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT D.dept_name AS Department,CONCAT(E.first_name,' ',E.last_name) AS Manager
FROM departments AS D
JOIN dept_manager AS Dm
ON D.dept_no = Dm.dept_no
JOIN employees AS E
ON Dm.emp_no = E.emp_no
WHERE Dm.to_date = '9999-01-01'
ORDER BY D.dept_name;
-- Find the name of all departments currently managed by women.
SELECT D.dept_name AS Department, CONCAT(E.first_name,' ',E.last_name) AS Manager
FROM departments AS D
JOIN dept_manager AS Dm
ON D.dept_no = Dm.dept_no
JOIN employees AS E
ON Dm.emp_no = E.emp_no
WHERE Dm.to_date = '9999-01-01'
AND gender = 'F'
ORDER BY D.dept_name;
-- Find the current titles of employees currently working in the Customer Service department.
SELECT T.title, COUNT(T.emp_no) AS total
FROM titles AS T
JOIN dept_emp AS De
ON T.emp_no = De.emp_no
WHERE De.dept_no= 'd009'
AND T.to_date = '9999-01-01'
AND De.to_date = '9999-01-01'
GROUP BY title;
-- Find the current salary of all current managers.
SELECT D.dept_name AS Department, CONCAT(E.first_name, ' ' , E.last_name) AS Manager, S.salary
FROM departments AS D
JOIN dept_manager As Dm
ON D.dept_no = Dm.dept_no
JOIN employees AS E
ON Dm.emp_no = E.emp_no
JOIN salaries AS S
ON E.emp_no = S.emp_no
WHERE Dm.to_date = '9999-01-01'
AND S.to_date =  '9999-01-01'
ORDER BY dept_name;

-- Bonus Find the names of all current employees, their department name, and their current manager's name
SELECT CONCAT(E.first_name, ' ' , E.last_name) AS Employee, D.dept_name AS Department, CONCAT(Em.first_name,' ',Em.last_name) AS Manager
FROM dept_emp AS De
        JOIN employees As E
            ON E.emp_no = De.emp_no
        JOIN departments as D
            ON De.dept_no = D.dept_no
        JOIN dept_manager AS Dm
            ON De.dept_no = Dm.dept_no
        JOIN employees AS Em
             ON Dm.emp_no = Em.emp_no
WHERE De.to_date = '9999-01-01'
    AND Dm.to_date = '9999-01-01'
ORDER by dept_name;
