/*
-------------------------------------------------------
Question 16
Level      : 2
Topic      : GROUP BY & HAVING
Difficulty : Easy

Problem:
Count employees in each department.

Solution:
-------------------------------------------------------
*/

SELECT
    department_id,
    COUNT(employee_id) AS employee_count
FROM employees
GROUP BY department_id;

/*
-------------------------------------------------------
Question 17
Level      : 2
Topic      : GROUP BY & HAVING
Difficulty : Easy

Problem:
Average salary by department.

Solution:
-------------------------------------------------------
*/

SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

/*
-------------------------------------------------------
Question 18
Level      : 2
Topic      : GROUP BY & HAVING
Difficulty : Easy

Problem:
Maximum salary by department.

Solution:
-------------------------------------------------------
*/

SELECT
    department_id,
    MAX(salary) AS maximum_salary
FROM employees
GROUP BY department_id;

/*
-------------------------------------------------------
Question 19
Level      : 2
Topic      : GROUP BY & HAVING
Difficulty : Easy

Problem:
Minimum salary by department.

Solution:
-------------------------------------------------------
*/

SELECT
    department_id,
    MIN(salary) AS minimum_salary
FROM employees
GROUP BY department_id;

/*
-------------------------------------------------------
Question 20
Level      : 2
Topic      : GROUP BY & HAVING
Difficulty : Medium

Problem:
Departments with more than five employees.

Solution:
-------------------------------------------------------
*/

SELECT
    department_id,
    COUNT(employee_id) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) > 5;

/*
-------------------------------------------------------
Question 21
Level      : 2
Topic      : GROUP BY & HAVING
Difficulty : Medium

Problem:
Departments whose average salary exceeds 10,000.

Solution:
-------------------------------------------------------
*/

SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 10000;

/*
-------------------------------------------------------
Question 22
Level      : 2
Topic      : GROUP BY & HAVING
Difficulty : Easy

Problem:
Employee count by job title.

Solution:
-------------------------------------------------------
*/

SELECT
    job_id,
    COUNT(employee_id) AS employee_count
FROM employees
GROUP BY job_id;

/*
-------------------------------------------------------
Question 23
Level      : 2
Topic      : GROUP BY & HAVING
Difficulty : Easy

Problem:
Total salary paid per department.

Solution:
-------------------------------------------------------
*/

SELECT
    department_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

/*
-------------------------------------------------------
Question 24
Level      : 2
Topic      : GROUP BY & HAVING
Difficulty : Medium

Problem:
Department with the highest average salary.

Solution:
-------------------------------------------------------
*/

SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
ORDER BY average_salary DESC
LIMIT 1;

/*
-------------------------------------------------------
Question 25
Level      : 2
Topic      : GROUP BY & HAVING
Difficulty : Medium

Problem:
Job title with the most employees.

Solution:
-------------------------------------------------------
*/

SELECT
    job_id,
    COUNT(employee_id) AS employee_count
FROM employees
GROUP BY job_id
ORDER BY employee_count DESC
LIMIT 1;