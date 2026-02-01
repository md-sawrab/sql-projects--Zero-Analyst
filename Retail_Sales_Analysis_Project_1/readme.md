# SQL Retail Sales Analysis - Project P2

This project contains SQL scripts for analyzing a fictional `retail_sales` dataset. The queries demonstrate fundamental and advanced SQL concepts, including data retrieval, aggregation, ranking functions, and Common Table Expressions (CTEs).

---

## 📂 Database & Table

### Database

- **Database Name:** `sql_project_p2`

### Table: `retail_sales`

| Column Name      | Data Type     | Description                        |
|-----------------|---------------|------------------------------------|
| transaction_id   | INT           | Unique identifier for each sale     |
| sale_date        | DATE          | Date of the transaction             |
| sale_time        | TIME          | Time of the transaction             |
| customer_id      | INT           | Unique identifier for each customer |
| gender           | VARCHAR(15)   | Gender of the customer              |
| age              | INT           | Age of the customer                 |
| category         | VARCHAR(15)   | Product category                    |
| quantity         | INT           | Number of items sold                |
| price_per_unit   | FLOAT         | Price per item                      |
| cogs             | FLOAT         | Cost of goods sold                  |
| total_sale       | FLOAT         | Total sale amount (quantity × price) |

---

## 📜 Queries Overview

The project includes a set of SQL queries to perform the following analyses:

1. **View all records** in the `retail_sales` table.
2. **Filter by specific date**: Retrieve sales on `'2022-11-05'`.
3. **Filter by category & quantity**: Retrieve 'Clothing' items sold more than 4 in November 2022.
4. **Total sales per category**: Sum of `total_sale` grouped by category.
5. **Average age**: Average age of customers who purchased items from the 'Beauty' category.
6. **High-value transactions**: Find all transactions where `total_sale > 1000`.
7. **Transactions by gender & category**: Count of transactions per gender in each category.
8. **Monthly average sale & best month per year**: Using `RANK()` window function to find top-selling month for each year.
9. **Top 5 customers by sales**: Identify customers with the highest purchase amounts.
10. **Unique customers per category**: Count distinct customers per category.
11. **Shift-wise sales analysis**: Using a CTE to categorize orders into Morning, Afternoon, and Evening shifts and count total orders per shift.

---

## ⚡ SQL Concepts Demonstrated

- **Basic SQL Queries**: `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`
- **Aggregate Functions**: `SUM()`, `AVG()`, `COUNT()`, `MAX()`
- **Filtering by Date**: `DATE_FORMAT()`, comparison operators
- **Ranking Functions**: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`
- **Common Table Expressions (CTE)**: `WITH` clause
- **Subqueries**: Inline views for ranking and aggregation
- **Aliases**: `AS` for readable column names
- **Limiting Results**: `LIMIT`

---

## Conclusion

This project demonstrates how SQL can be used to analyze retail sales data. Using aggregation, ranking functions, and CTEs, we were able to summarize sales, identify top customers, and analyze trends efficiently. The queries provide a foundation for real-world data analysis and reporting.
