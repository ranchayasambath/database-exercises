USE employees;
-- what are the top three most common job titles?
SELECT title,COUNT(title) FROM titles GROUP BY title ORDER BY COUNT(title)DESC limit 3;
| Engineer        |       115003 |
-- what is the lowest employee number for the first senior engineers in the company?
SELECT emp_no,title,from_date,to_date FROM titles WHERE title='Senior Engineer' ORDER BY from_date,emp_no ASC limit 10;
|235233| 1961-04-01|Jayesh,Minakawa| M |1985-02-01

-- what is the most common ‘from date’ for job titles? for staff only?
SELECT title,from_date,COUNT(from_date) FROM titles GROUP BY title,from_date ORDER BY title,COUNT(from_date) DESC limit 10;
SELECT title,from_date,COUNT(from_date) FROM titles WHERE title='staff' GROUP BY title,from_date ORDER BY title,COUNT(from_date) DESC limit 10;
| Assistant Engineer | 1999-11-09 |  11 |
| Staff | 1990-04-20 |   41 |
-- what is the highest employee number for an engineer?
SELECT emp_no,title FROM titles WHERE title='engineer' ORDER BY title,emp_no DESC limit 10;
-- what are the names of the 10 most recently hired employees who identified as female in the company? the first 10?
| 499999 | Engineer | Sachin | Tsukuda | M | 1997-11-30
-- what is the most common birthday?
SELECT birth_date,COUNT(birth_date) FROM employees GROUP BY birth_date ORDER BY COUNT(birth_date) DESC limit 5;
| 1952-03-08 |                95 |
-- what is the most common  birthday for employees who identified as female? how about vs. those who identified as male?
SELECT birth_date,COUNT(*),gender FROM employees WHERE gender='M' GROUP BY birth_date,gender ORDER BY gender,COUNT(birth_date) DESC limit 10;
| 1953-07-11 |       63 | M      |
SELECT birth_date,COUNT(*),gender FROM employees WHERE gender='F' GROUP BY birth_date,gender ORDER BY gender,COUNT(birth_date) DESC limit 10;
| 1953-10-12 |       49 | F      |
-- what is the most common hire date for female and male employees?
SELECT hire_date,COUNT(*),gender FROM employees WHERE gender='F' GROUP BY hire_date,gender ORDER BY gender, COUNT(hire_date) DESC limit 10;
| 1985-07-15 |       61 | F      |
-- what is the longest last name of someone born on March 8, 1952?
SELECT last_name,LENGTH(last_name) FROM employees ORDER BY LENGTH(last_name) ASC;
| Sankaranarayanan | 16 |
