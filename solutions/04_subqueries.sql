/*
-------------------------------------------------------
Question 36
Level      : 4
Topic      : Subqueries
Difficulty : Easy

Problem:
Employees earning above company average.

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

/*
-------------------------------------------------------
Question 37
Level      : 4
Topic      : Subqueries
Difficulty : Easy

Problem:
Employees earning the maximum salary.

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

/*
-------------------------------------------------------
Question 38
Level      : 4
Topic      : Subqueries
Difficulty : Medium

Problem:
Employees working in Sales department.

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Sales'
);

/*
-------------------------------------------------------
Question 39
Level      : 4
Topic      : Subqueries
Difficulty : Medium

Problem:
Employees earning more than their manager.

Solution:
-------------------------------------------------------
*/

SELECT
    e.first_name,
    e.last_name,
    e.salary
FROM employees AS e
JOIN employees AS m
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

/*
-------------------------------------------------------
Question 40
Level      : 4
Topic      : Subqueries
Difficulty : Medium

Problem:
Second highest salary.

Solution:
-------------------------------------------------------
*/

SELECT
    MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

/*
-------------------------------------------------------
Question 41
Level      : 4
Topic      : Subqueries
Difficulty : Hard

Problem:
Third highest salary.

Solution:
-------------------------------------------------------
*/

SELECT
    MAX(salary) AS third_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);

/*
-------------------------------------------------------
Question 42
Level      : 4
Topic      : Subqueries
Difficulty : Hard

Problem:
Departments whose average salary exceeds the company average.

Solution:
-------------------------------------------------------
*/

SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees
);