/*
-------------------------------------------------------
Question 26
Level      : 3
Topic      : Joins
Difficulty : Easy

Problem:
Employee name with department name.

Solution:
-------------------------------------------------------
*/

SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM employees AS e
JOIN departments AS d
    ON e.department_id = d.department_id;

/*
-------------------------------------------------------
Question 27
Level      : 3
Topic      : Joins
Difficulty : Easy

Problem:
Employee name with job title.

Solution:
-------------------------------------------------------
*/

SELECT
    e.first_name,
    e.last_name,
    j.job_title
FROM employees AS e
JOIN jobs AS j
    ON e.job_id = j.job_id;

/*
-------------------------------------------------------
Question 28
Level      : 3
Topic      : Joins
Difficulty : Medium

Problem:
Employee, department, and location.

Solution:
-------------------------------------------------------
*/

SELECT
    e.first_name,
    e.last_name,
    d.department_name,
    l.city
FROM employees AS e
JOIN departments AS d
    ON e.department_id = d.department_id
JOIN locations AS l
    ON d.location_id = l.location_id;

/*
-------------------------------------------------------
Question 29
Level      : 3
Topic      : Joins
Difficulty : Medium

Problem:
Departments without employees.

Solution:
-------------------------------------------------------
*/

SELECT
    d.department_name
FROM departments AS d
LEFT JOIN employees AS e
    ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

/*
-------------------------------------------------------
Question 30
Level      : 3
Topic      : Joins
Difficulty : Medium

Problem:
Employees with their manager names.

Solution:
-------------------------------------------------------
*/

SELECT
    e.first_name,
    e.last_name,
    m.first_name AS manager_first_name,
    m.last_name AS manager_last_name
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.employee_id;

/*
-------------------------------------------------------
Question 31
Level      : 3
Topic      : Joins
Difficulty : Medium

Problem:
Managers with number of subordinates.

Solution:
-------------------------------------------------------
*/

SELECT
    m.employee_id,
    m.first_name,
    m.last_name,
    COUNT(e.employee_id) AS subordinate_count
FROM employees AS m
JOIN employees AS e
    ON m.employee_id = e.manager_id
GROUP BY
    m.employee_id,
    m.first_name,
    m.last_name;

/*
-------------------------------------------------------
Question 32
Level      : 3
Topic      : Joins
Difficulty : Medium

Problem:
Employees with country names.

Solution:
-------------------------------------------------------
*/

SELECT
    e.first_name,
    e.last_name,
    c.country_name
FROM employees AS e
JOIN departments AS d
    ON e.department_id = d.department_id
JOIN locations AS l
    ON d.location_id = l.location_id
JOIN countries AS c
    ON l.country_id = c.country_id;

/*
-------------------------------------------------------
Question 33
Level      : 3
Topic      : Joins
Difficulty : Medium

Problem:
Employees working in London.

Solution:
-------------------------------------------------------
*/

SELECT
    e.first_name,
    e.last_name
FROM employees AS e
JOIN departments AS d
    ON e.department_id = d.department_id
JOIN locations AS l
    ON d.location_id = l.location_id
WHERE l.city = 'London';

/*
-------------------------------------------------------
Question 34
Level      : 3
Topic      : Joins
Difficulty : Hard

Problem:
Employees with region names.

Solution:
-------------------------------------------------------
*/

SELECT
    e.first_name,
    e.last_name,
    r.region_name
FROM employees AS e
JOIN departments AS d
    ON e.department_id = d.department_id
JOIN locations AS l
    ON d.location_id = l.location_id
JOIN countries AS c
    ON l.country_id = c.country_id
JOIN regions AS r
    ON c.region_id = r.region_id;

/*
-------------------------------------------------------
Question 35
Level      : 3
Topic      : Joins
Difficulty : Medium

Problem:
Departments with employee count (including zero employees).

Solution:
-------------------------------------------------------
*/

SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments AS d
LEFT JOIN employees AS e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY d.department_name;