/*
-------------------------------------------------------
Question 43
Level      : 5
Topic      : Window Functions
Difficulty : Easy

Problem:
Rank employees by salary (RANK()).

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

/*
-------------------------------------------------------
Question 44
Level      : 5
Topic      : Window Functions
Difficulty : Easy

Problem:
Dense rank employees (DENSE_RANK()).

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_dense_rank
FROM employees;

/*
-------------------------------------------------------
Question 45
Level      : 5
Topic      : Window Functions
Difficulty : Medium

Problem:
Top 3 salaries in each department (ROW_NUMBER()).

Solution:
-------------------------------------------------------
*/

SELECT
    department_id,
    first_name,
    last_name,
    salary
FROM (
    SELECT
        department_id,
        first_name,
        last_name,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS row_num
    FROM employees
) AS ranked_employees
WHERE row_num <= 3;

/*
-------------------------------------------------------
Question 46
Level      : 5
Topic      : Window Functions
Difficulty : Medium

Problem:
Previous salary (LAG()).

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    salary,
    LAG(salary) OVER (ORDER BY salary) AS previous_salary
FROM employees;

/*
-------------------------------------------------------
Question 47
Level      : 5
Topic      : Window Functions
Difficulty : Medium

Problem:
Next salary (LEAD()).

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    salary,
    LEAD(salary) OVER (ORDER BY salary) AS next_salary
FROM employees;

/*
-------------------------------------------------------
Question 48
Level      : 5
Topic      : Window Functions
Difficulty : Medium

Problem:
Running salary total.

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    salary,
    SUM(salary) OVER (
        ORDER BY salary
    ) AS running_total_salary
FROM employees;

/*
-------------------------------------------------------
Question 49
Level      : 5
Topic      : Window Functions
Difficulty : Medium

Problem:
Running average salary.

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    salary,
    AVG(salary) OVER (
        ORDER BY salary
    ) AS running_average_salary
FROM employees;

/*
-------------------------------------------------------
Question 50
Level      : 5
Topic      : Window Functions
Difficulty : Hard

Problem:
Department-wise salary ranking report.

Solution:
-------------------------------------------------------
*/

SELECT
    department_id,
    first_name,
    last_name,
    salary,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_salary_rank
FROM employees;