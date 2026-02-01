-- =========================================================
-- SQL Retail Sales Analysis - Project P2
-- =========================================================

-- 0. Create Database
CREATE DATABASE IF NOT EXISTS sql_project_p2;
USE sql_project_p2;

-- 1. Create retail_sales Table
DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales
(
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

-- =========================================================
-- SQL Queries on retail_sales
-- =========================================================

-- 1. View all data in retail_sales
SELECT * 
FROM retail_sales;

-- 2. Retrieve all columns for sales made on '2022-11-05'
SELECT * 
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- 3. Retrieve all transactions where the category is 'Clothing' 
--    and quantity sold > 4 in Nov-2022
SELECT * 
FROM retail_sales
WHERE category = 'Clothing'
  AND quantiy >= 4
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11';

-- 4. Calculate total sales (total_sale) for each category
SELECT 
    category, 
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category;

-- 5. Find average age of customers who purchased items from 'Beauty' category
SELECT 
    ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- 6. Find all transactions where total_sale > 1000
SELECT * 
FROM retail_sales
WHERE total_sale > 1000;

-- 7. Find total number of transactions made by each gender in each category
SELECT 
    category, 
    gender, 
    COUNT(transaction_id) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

-- 8. Calculate average sale for each month and determine best-selling month in each year
SELECT 
    year,
    month,
    avg_sale
FROM (
    SELECT
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER(
            PARTITION BY YEAR(sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS rankk
    FROM retail_sales
    GROUP BY year, month
    ORDER BY year, avg_sale DESC
) AS t1
WHERE rankk = 1;

-- 9. Find top 5 customers based on highest total sales
SELECT 
    customer_id, 
    MAX(total_sale) AS highest
FROM retail_sales
GROUP BY customer_id
ORDER BY highest DESC
LIMIT 5;

-- 10. Find number of unique customers who purchased items from each category
SELECT 
    category,
    COUNT(DISTINCT customer_id) AS uni_customer
FROM retail_sales
GROUP BY category;

-- 11. Create shifts (Morning, Afternoon, Evening) 
--     and find number of orders in each shift
WITH hourly_sales AS (
    SELECT *,
        CASE
            WHEN HOUR(sale_time) < 12 THEN 'Morning'
            WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
)
SELECT 
    shift, 
    COUNT(*) AS total_orders
FROM hourly_sales
GROUP BY shift;
