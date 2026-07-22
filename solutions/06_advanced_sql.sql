/*
-------------------------------------------------------
Question 51
Level      : 6
Topic      : Advanced SQL
Difficulty : Hard

Problem:
Find the Nth highest salary.

Solution:
-------------------------------------------------------
*/

-- Replace 3 with the desired value of N.
SELECT
    salary
FROM (
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
) AS ranked_salaries
WHERE salary_rank = 3;

/*
-------------------------------------------------------
Question 52
Level      : 6
Topic      : Advanced SQL
Difficulty : Medium

Problem:
Find duplicate records.

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    COUNT(*) AS duplicate_count
FROM employees
GROUP BY
    first_name,
    last_name
HAVING COUNT(*) > 1;

/*
-------------------------------------------------------
Question 53
Level      : 6
Topic      : Advanced SQL
Difficulty : Hard

Problem:
Delete duplicate records while keeping one copy.

Solution:
-------------------------------------------------------
*/

WITH duplicate_rows AS (
    SELECT
        ctid,
        ROW_NUMBER() OVER (
            PARTITION BY first_name, last_name
            ORDER BY employee_id
        ) AS row_num
    FROM employees
)
DELETE FROM employees
WHERE ctid IN (
    SELECT ctid
    FROM duplicate_rows
    WHERE row_num > 1
);

/*
-------------------------------------------------------
Question 54
Level      : 6
Topic      : Advanced SQL
Difficulty : Hard

Problem:
Latest record for each customer.

Solution:
-------------------------------------------------------
*/

SELECT
    customer_id,
    order_id,
    order_date
FROM (
    SELECT
        customer_id,
        order_id,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date DESC
        ) AS row_num
    FROM orders
) AS latest_orders
WHERE row_num = 1;

/*
-------------------------------------------------------
Question 55
Level      : 6
Topic      : Advanced SQL
Difficulty : Medium

Problem:
Customers without orders.

Solution:
-------------------------------------------------------
*/

SELECT
    c.customer_id,
    c.customer_name
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/*
-------------------------------------------------------
Question 56
Level      : 6
Topic      : Advanced SQL
Difficulty : Medium

Problem:
Products never sold.

Solution:
-------------------------------------------------------
*/

SELECT
    p.product_id,
    p.product_name
FROM products AS p
LEFT JOIN order_details AS od
    ON p.product_id = od.product_id
WHERE od.product_id IS NULL;

/*
-------------------------------------------------------
Question 57
Level      : 6
Topic      : Advanced SQL
Difficulty : Hard

Problem:
Employee hierarchy using Recursive CTE.

Solution:
-------------------------------------------------------
*/

WITH RECURSIVE employee_hierarchy AS (
    SELECT
        employee_id,
        first_name,
        last_name,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.first_name,
        e.last_name,
        e.manager_id,
        eh.level + 1
    FROM employees AS e
    JOIN employee_hierarchy AS eh
        ON e.manager_id = eh.employee_id
)
SELECT
    employee_id,
    first_name,
    last_name,
    manager_id,
    level
FROM employee_hierarchy
ORDER BY
    level,
    employee_id;

/*
-------------------------------------------------------
Question 58
Level      : 6
Topic      : Advanced SQL
Difficulty : Hard

Problem:
Consecutive records (consecutive login days/orders).

Solution:
-------------------------------------------------------
*/

SELECT
    customer_id,
    order_date,
    LAG(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_date
FROM orders;

/*
-------------------------------------------------------
Question 59
Level      : 6
Topic      : Advanced SQL
Difficulty : Hard

Problem:
Gaps and Islands problem.

Solution:
-------------------------------------------------------
*/

WITH numbered_dates AS (
    SELECT
        order_date,
        order_date - ROW_NUMBER() OVER (ORDER BY order_date) * INTERVAL '1 day' AS grp
    FROM orders
)
SELECT
    MIN(order_date) AS start_date,
    MAX(order_date) AS end_date,
    COUNT(*) AS consecutive_days
FROM numbered_dates
GROUP BY grp
ORDER BY start_date;

/*
-------------------------------------------------------
Question 60
Level      : 6
Topic      : Advanced SQL
Difficulty : Medium

Problem:
Employees hired immediately after another employee (window function practice).

Solution:
-------------------------------------------------------
*/

SELECT
    first_name,
    last_name,
    hire_date,
    LAG(hire_date) OVER (
        ORDER BY hire_date
    ) AS previous_hire_date
FROM employees;