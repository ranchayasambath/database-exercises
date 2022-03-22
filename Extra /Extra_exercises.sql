USE employees;
-- what are the top three most common job titles?
SELECT title,COUNT(title) FROM titles GROUP BY title ORDER BY COUNT(title)DESC limit 3;
+-----------------+--------------+
| title           | COUNT(title) |
+-----------------+--------------+
| Engineer        |       115003 |
| Staff           |       107391 |
| Senior Engineer |        97750 |
+-----------------+--------------+
-- what is the lowest employee number for the first senior engineers in the company?
SELECT emp_no,title,from_date,to_date FROM titles WHERE title='Senior Engineer' ORDER BY from_date,emp_no ASC limit 10;
+--------+-----------------+------------+------------+
| emp_no | title           | from_date  | to_date    |
+--------+-----------------+------------+------------+
| 235233 | Senior Engineer | 1985-02-01 | 9999-01-01 |
--------------------------------------------------------
| 235233 | Jayesh Minakawa | 1985-02-01 |

-- what is the most common ‘from date’ for job titles? for staff only?
SELECT title,from_date,COUNT(from_date) FROM titles GROUP BY title,from_date ORDER BY title,COUNT(from_date) DESC limit 10;
+--------------------+------------+------------------+
| title              | from_date  | COUNT(from_date) |
+--------------------+------------+------------------+
| Assistant Engineer | 1999-11-09 |               11 |

SELECT title,from_date,COUNT(from_date) FROM titles WHERE title='staff' GROUP BY title,from_date ORDER BY title,COUNT(from_date) DESC limit 10;
+-------+------------+------------------+
| title | from_date  | COUNT(from_date) |
+-------+------------+------------------+
| Staff | 1990-04-20 |               41 |

-- what is the highest employee number for an engineer?
SELECT emp_no,title FROM titles WHERE title='engineer' ORDER BY title,emp_no DESC limit 10;
+--------+----------+
| emp_no | title    |
+--------+----------+
| 499999 | Engineer |
| 499999 | Engineer | Sachin | Tsukuda | M | 1997-11-30
-- what are the names of the 10 most recently hired employees who identified as female in the company?
SELECT first_name,last_name,gender,hire_date FROM employees WHERE gender='F'ORDER BY hire_date DESC limit 10;
+------------+------------+--------+------------+
| first_name | last_name  | gender | hire_date  |
+------------+------------+--------+------------+
| Hideyuki   | Delgrande  | F      | 2000-01-22 |
| Volkmar    | Perko      | F      | 2000-01-13 |
| Jaana      | Verspoor   | F      | 2000-01-11 |
| Ennio      | Alblas     | F      | 2000-01-06 |
| Xuejun     | Benzmuller | F      | 2000-01-04 |
| Seshu      | Rathonyi   | F      | 2000-01-02 |
| Randi      | Luit       | F      | 2000-01-02 |
| Adil       | Siepmann   | F      | 1999-12-31 |
| Manton     | Ghemri     | F      | 1999-12-30 |
| Garnik     | Kolvik     | F      | 1999-12-30 |
+------------+------------+--------+------------+
--  the first 10?
SELECT first_name,last_name,gender,hire_date FROM employees ORDER BY hire_date DESC limit 10;

+------------+------------+--------+------------+
| first_name | last_name  | gender | hire_date  |
+------------+------------+--------+------------+
| Bikash     | Covnot     | M      | 2000-01-28 |
| Yucai      | Gerlach    | M      | 2000-01-23 |
| Hideyuki   | Delgrande  | F      | 2000-01-22 |
| Volkmar    | Perko      | F      | 2000-01-13 |
| Ulf        | Flexer     | M      | 2000-01-12 |
| Jaana      | Verspoor   | F      | 2000-01-11 |
| Shahab     | Demeyer    | M      | 2000-01-08 |
| Ennio      | Alblas     | F      | 2000-01-06 |
| Xuejun     | Benzmuller | F      | 2000-01-04 |
| Jeong      | Boreale    | M      | 2000-01-03 |
+------------+------------+--------+------------+
-- what is the most common birthday?
SELECT birth_date,COUNT(birth_date) FROM employees GROUP BY birth_date ORDER BY COUNT(birth_date) DESC limit 5;
+------------+-------------------+
| birth_date | COUNT(birth_date) |
+------------+-------------------+
| 1952-03-08 |                95 |

-- what is the most common  birthday for employees who identified as female? how about vs. those who identified as male?
SELECT birth_date,COUNT(*),gender FROM employees WHERE gender='M' GROUP BY birth_date,gender ORDER BY gender,COUNT(birth_date) DESC limit 10;
+------------+----------+--------+
| birth_date | COUNT(*) | gender |
+------------+----------+--------+
| 1953-07-11 |       63 | M      |

SELECT birth_date,COUNT(*),gender FROM employees WHERE gender='F' GROUP BY birth_date,gender ORDER BY gender,COUNT(birth_date) DESC limit 10;
+------------+----------+--------+
| birth_date | COUNT(*) | gender |
+------------+----------+--------+
| 1953-10-12 |       49 | F      |

-- what is the most common hire date for female and male employees?
SELECT hire_date,COUNT(*),gender FROM employees WHERE gender='M' GROUP BY hire_date,gender ORDER BY gender, COUNT(hire_date) DESC limit 10;
+------------+----------+--------+
| hire_date  | COUNT(*) | gender |
+------------+----------+--------+
| 1985-06-20 |       88 | M      |

SELECT hire_date,COUNT(*),gender FROM employees WHERE gender='F' GROUP BY hire_date,gender ORDER BY gender, COUNT(hire_date) DESC limit 10;
+------------+----------+--------+
| hire_date  | COUNT(*) | gender |
+------------+----------+--------+
| 1985-07-15 |       61 | F      |
-- what is the longest last name of someone born on March 8, 1952?
SELECT last_name,birth_date,LENGTH(last_name) FROM employees WHERE year(birth_date) = 1952 AND month(birth_date) = 3 AND day(birth_date)= 8 GROUP BY birth_date,last_name ORDER BY LENGTH(last_name) DESC;
+---------------+------------+-------------------+
| last_name     | birth_date | LENGTH(last_name) |
+---------------+------------+-------------------+
| Bernardinello | 1952-03-08 |                13 |
| Pietracaprina | 1952-03-08 |                13 |
| Schlegelmilch | 1952-03-08 |                13 |
| Chandrasekhar | 1952-03-08 |                13 |

