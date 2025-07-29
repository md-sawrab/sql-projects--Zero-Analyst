-- SQL Retail Sales Analysis - P1

CREATE DATABASE p1_retail_db;

-- Create TABLE
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );
            
-- Checked if data is correctly import or not 

SELECT * 
FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
DELETE FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;


SELECT * FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

-- Data Exploration

-- How many record we have?

SELECT COUNT(*)
FROM retail_sales;

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * 
FROM retail_sales
where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select * 
FROM retail_sales
where category = 'Clothing'
and quantity >=4
and month(sale_date) = 11
and year(sale_date) = 2022;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category, sum(total_sale)
from retail_sales
group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age)
from retail_sales
where category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select *
from retail_sales
where total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select gender, category,count(transaction_id)
from retail_sales
group by gender, category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT 
  EXTRACT(YEAR FROM sale_date) AS year,
  EXTRACT(MONTH FROM sale_date) AS month,
  AVG(total_sale) AS avg_sale
FROM retail_sales
GROUP BY 
  EXTRACT(YEAR FROM sale_date),
  EXTRACT(MONTH FROM sale_date)
ORDER BY month DESC
LIMIT 1;
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select customer_id
from retail_sales
group by customer_id
order by sum(total_sale) desc
limit 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select category, count(distinct(customer_id))
from retail_sales
group by category;
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift