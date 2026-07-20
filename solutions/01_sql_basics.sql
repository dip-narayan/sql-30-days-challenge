/*
-------------------------------------------------------
Question 01
Level      : SQL Basics
Topic      : SELECT
Difficulty : Easy

Problem:
Display all employee details.

Solution:
-------------------------------------------------------
*/

SELECT *
FROM employees;

/*
-------------------------------------------------------
Question 02
Level      : SQL Basics
Topic      : SELECT
Difficulty : Easy

Problem:
Display employee name and salary.

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    salary
FROM employees;

/*
-------------------------------------------------------
Question 03
Level      : SQL Basics
Topic      : DISTINCT
Difficulty : Easy

Problem:
Display unique department IDs.

Solution:
-------------------------------------------------------
*/

SELECT DISTINCT department_id
FROM employees;

/*
-------------------------------------------------------
Question 04
Level      : SQL Basics
Topic      : WHERE
Difficulty : Easy

Problem:
Display employees earning more than 10,000.

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > 10000;

/*
-------------------------------------------------------
Question 05
Level      : SQL Basics
Topic      : WHERE
Difficulty : Easy

Problem:
Display employees hired after a given date.

Solution:
-------------------------------------------------------
*/

SELECT *
FROM employees
WHERE hire_date > DATE '2015-01-01';

/*
-------------------------------------------------------
Question 06
Level      : SQL Basics
Topic      : LIKE
Difficulty : Easy

Problem:
Display employees whose first name starts with 'S'.

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name
FROM employees
WHERE first_name LIKE 'S%';

/*
-------------------------------------------------------
Question 07
Level      : SQL Basics
Topic      : LIKE
Difficulty : Easy

Problem:
Display employees whose last name ends with 'n'.

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name
FROM employees
WHERE last_name LIKE '%n';

/*
-------------------------------------------------------
Question 08
Level      : SQL Basics
Topic      : NULL
Difficulty : Easy

Problem:
Display employees with NULL commission.

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name
FROM employees
WHERE commission_pct IS NULL;

/*
-------------------------------------------------------
Question 09
Level      : SQL Basics
Topic      : NULL
Difficulty : Easy

Problem:
Display employees with non-NULL commission.

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

/*
-------------------------------------------------------
Question 10
Level      : SQL Basics
Topic      : ORDER BY
Difficulty : Easy

Problem:
Sort employees by salary (highest first).

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC;

/*
-------------------------------------------------------
Question 11
Level      : SQL Basics
Topic      : Aggregate Functions
Difficulty : Easy

Problem:
Display the highest salary.

Solution:
-------------------------------------------------------
*/

SELECT
    MAX(salary) AS highest_salary
FROM employees;

/*
-------------------------------------------------------
Question 12
Level      : SQL Basics
Topic      : Aggregate Functions
Difficulty : Easy

Problem:
Display the lowest salary.

Solution:
-------------------------------------------------------
*/

SELECT
    MIN(salary) AS lowest_salary
FROM employees;

/*
-------------------------------------------------------
Question 13
Level      : SQL Basics
Topic      : Aggregate Functions
Difficulty : Easy

Problem:
Display the total number of employees.

Solution:
-------------------------------------------------------
*/

SELECT
    COUNT(*) AS total_employees
FROM employees;

/*
-------------------------------------------------------
Question 14
Level      : SQL Basics
Topic      : Aggregate Functions
Difficulty : Easy

Problem:
Display the average salary.

Solution:
-------------------------------------------------------
*/

SELECT
    AVG(salary) AS average_salary
FROM employees;

/*
-------------------------------------------------------
Question 15
Level      : SQL Basics
Topic      : Aggregate Functions
Difficulty : Easy

Problem:
Display the total salary paid by the company.

Solution:
-------------------------------------------------------
*/

SELECT
    SUM(salary) AS total_salary_paid
FROM employees;