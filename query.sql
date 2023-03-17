SELECT * FROM exercise_hr.employees;

-- Write a query to get all employee details from the employee table order by first name, descending.
SELECT * 
FROM exercise_hr.employees 
ORDER BY FIRST_NAME DESC;

-- Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.
SELECT employee_id, first_name,last_name,salary 
FROM exercise_hr.employees 
ORDER BY salary ASC;



/*

07-02-2023

Note: USE exercise_hr;
Write a query to calculate 171*214+625.
Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name" from employees table.
Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).
Write a query to get unique department ID from employee table.
Self-study exercise (Use store):
Return name, unit price, and a new price for all the products that is equal to 1.1 * unit_price.

*/


SELECT 171*214 + 625;

USE exercise_hr;

SELECT first_name AS "First Name",
last_name AS "Last Name"
FROM employees ;

SELECT first_name, last_name, salary, salary*.15 AS 'PF' 
FROM employees;

SELECT DISTINCT DEPARTMENT_ID FROM employees;

USE store;

SELECT name,unit_price,(unit_price * 1.1) AS "new price" FROM order_items,order_statuses;

/*

08-02-2023

Note : USE exercise_hr;
Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.
Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.
Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.
Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.
Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
*/

USE exercise_hr;

-- Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.
SELECT first_name,last_name,hire_date
FROM employees
WHERE 1987;

-- Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.
SELECT first_name,last_name,salary 
FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000;

-- Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.
SELECT first_name,last_name,department_id 
FROM employees
WHERE department_id = 30 OR department_id = 100 
ORDER BY department_id ASC;

-- Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.
SELECT first_name,last_name,salary 
FROM employees
WHERE (salary NOT BETWEEN 10000 AND 15000) AND (department_id = 30 OR department_id = 100);

-- Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
SELECT *
FROM employees
WHERE last_name IN ('BLAKE', 'SCOTT', 'KING','FORD');

/*
USE store;
 Return products with
-- quantity in stock equal to 49, 38, 72
-- no product with quantity_in_stock = 72.
2. Return customers born
-- between 1/1/1990 and 1/1/2000
3. Get the customers whose
-- 1. addresses contain TRAIL or AVENUE
-- 2. phone numbers end with 9
-- 3. phone numbers do not end with 9
4. Get the customers whose
-- 1. first names are ELKA or AMBUR
-- 2. last names end with EY or ON
-- 3. last names start with MY or contains SE
-- 4. last names contains B followed by R or U
*/

USE store;

SELECT *
FROM products
WHERE quantity_in_stock IN (49,38,72);

SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-1-1' AND '2000-1-1';

SELECT *
FROM customers
WHERE address LIKE '%TRAIL%' OR address LIKE '%AVENUE%';

SELECT *
FROM customers
WHERE phone LIKE '%9';

SELECT *
FROM customers
WHERE phone NOT LIKE '%9';

SELECT *
FROM customers
WHERE first_name LIKE 'ELKA' OR first_name LIKE 'AMBUR';

SELECT *
FROM customers
WHERE last_name LIKE '%EY' OR last_name LIKE '%ON';

SELECT *
FROM customers
WHERE last_name LIKE 'MY%' OR last_name LIKE '%SE%';

SELECT *
FROM customers
WHERE last_name LIKE '%B%' AND (last_name LIKE '%R%' OR last_name LIKE '%U%');


/*
USE exercise_hr;
Hint: LIKE '___' will find all 3 letter words.
Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
Write a query to display the last name of employees whose names have exactly 6 characters.
Write a query to display the last name of employees having 'e' as the third character.
Write a query to display the jobs/designations available in the employees table.
*/

USE exercise_hr;

-- Write a query to display the first_name of all employees who have both "b" and "c" in their first name.

SELECT first_name
FROM employees
WHERE first_name LIKE "%b%" AND first_name LIKE "%c%";

-- Write a query to display the last name of employees whose names have exactly 6 characters.

SELECT last_name
FROM employees
WHERE LENGTH(last_name) = 6;

-- Write a query to display the last name of employees having 'e' as the third character.

SELECT last_name
FROM employees
WHERE last_name LIKE "__e%";

-- Write a query to display the jobs/designations available in the employees table.

SELECT job_id
FROM employees;


-- 14-02-2023 Class Query

USE store;

SELECT last_name
FROM customers
WHERE last_name LIKE "_____y";

SELECT last_name 
FROM customers
WHERE last_name LIKE "b____y" ;

/*
REGEXP 
*/

SELECT *
FROM customers
WHERE last_name REGEXP "age";

SELECT *
FROM customers
WHERE last_name REGEXP "^mac";

SELECT *
FROM customers
WHERE last_name REGEXP "field$";

SELECT *
FROM customers
WHERE last_name REGEXP "^mac|field$";

SELECT *
FROM customers
WHERE last_name REGEXP "[a-h]e";




/* 

*/


SELECT *
FROM customers
WHERE last_name REGEXP "[gim]e";

SELECT *
FROM customers
WHERE last_name REGEXP "EY$|ON$";

SELECT *
FROM customers
WHERE last_name REGEXP "^MY|SE";

SELECT *
FROM customers
WHERE last_name REGEXP "br|bu";

SELECT *
FROM customers
WHERE last_name REGEXP "b[a-z]*[ru]";

SELECT * 
FROM customers
WHERE phone IS NULL;

SELECT * 
FROM customers
WHERE phone IS NOT NULL;

SELECT *
FROM orders
WHERE shipped_id IS NULL;

USE exercise_hr;

SELECT first_name,employee_id,department_id
FROM employees 
ORDER BY department_id,first_name ;

USE store;
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;

SELECT *
FROM customers
LIMIT 0,3;

SELECT *
FROM customers
LIMIT 3,3;


SELECT *
FROM customers
LIMIT 6,3;

USE exercise_hr;

EXPLAIN 
SELECT *
FROM employees;

/*
Write a query to get the total salaries payable to employees.
Write a query to get the maximum and minimum salary from employees table.
Write a query to get the average salary and number of employees in the employees table.
Write a query to get the number of employees working with the company.
Write a query to get the number of distinct jobs available in the employees table.
Write a query get all first name from employees table in upper case.
Write a query to get the first 3 characters of first name from employees table.
Write a query to get the names ('<first name> <last name>') (for example Ellen Abel, Sundar Ande etc.) as a single column of all the employees from employees table.
Write a query to get the length of the employee names ('<first name> <last name>') from employees table.
Write a query to get monthly salary (round 2 decimal places) of each and every employee
Note : Assume the salary field provides the 'annual salary' information.
*/

USE exercise_hr;

-- Write a query to get the total salaries payable to employees.
SELECT SUM(salary) AS "Total Salary"
FROM employees;


-- Write a query to get the maximum and minimum salary from employees table.
SELECT MAX(salary) AS "Maximum Salary",MIN(salary) AS "Minimum Salary"
FROM employees;

-- Write a query to get the average salary and number of employees in the employees table.
SELECT AVG(salary) AS "Average Salary",COUNT(salary) AS "Number of employees"
FROM employees;

-- Write a query to get the number of employees working with the company.
SELECT COUNT(*) AS "Number of employees"
FROM employees;

-- Write a query to get the number of distinct jobs available in the employees table.
SELECT COUNT(DISTINCT job_id) 
FROM employees;

-- Write a query get all first name from employees table in upper case.
SELECT UCASE(first_name) AS "First Name"
FROM employees;

-- Write a query to get the first 3 characters of first name from employees table.
SELECT SUBSTR(first_name, 1,3) AS "First 3 Characters of First Name"
FROM employees;

-- Write a query to get the names ('<first name> <last name>') (for example Ellen Abel, Sundar Ande etc.) as a single column of all the employees from employees table.
SELECT CONCAT(first_name, ' ',last_name) AS "Full Name"
FROM employees;

-- Write a query to get the length of the employee names ('<first name> <last name>') from employees table.
 SELECT LENGTH(CONCAT(first_name, ' ',last_name)) AS "Length of Full Name"
FROM employees;

-- Write a query to get monthly salary (round 2 decimal places) of each and every employee
SELECT ROUND(salary, 2) AS "Monthly Salary"
FROM employees;

USE exercise_hr;

-- INNER JOIN
SELECT *
FROM employees INNER JOIN departments
ON employees.department_id = departments.department_id;

-- find all the employees working in their

SELECT employee_id,first_name,last_name,e.department_id,department_name
FROM employees AS e INNER JOIN departments AS d
ON e.department_id = d.department_id
WHERE department_name = 'IT';

/*
Write a query to find the name (first_name, last name), department ID and name of all the employees.
Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
Write a query to get the department name and number of employees in the department. (Requires GROUP BY)
Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
*/
SELECT first_name,last_name,department_id,CONCAT(first_name, ' ',last_name) AS "Name"
FROM employees;

SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name 
FROM employees AS e INNER JOIN departments AS d ON (e.department_id = d.department_id) 
INNER JOIN locations AS l ON (d.location_id = l.location_id) 
WHERE LOWER(l.city) = 'London';

SELECT e.employee_id, e.last_name, m.manager_id
FROM employees AS e INNER JOIN departments AS m 
ON e.manager_id = m.MANAGER_ID;