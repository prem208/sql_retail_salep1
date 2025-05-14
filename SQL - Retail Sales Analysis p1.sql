## Retail Sales Analysis SQL Project ##

## Project Overview

-- **Project Title**: Retail Sales Analysis  
-- **Database**: `sql_sale'

-- This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

-- 1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
-- 2. **Data Cleaning**: Identify and remove any records with missing or null values.
-- 3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
-- 4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

-- **Database Creation**: The project starts by creating a database named `p1_retail_db`.
-- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

-- sql
CREATE DATABASE sql_project1 ;

CREATE TABLE retail_sales;

create table retail_sale (
transactions_id	int primary key,
sale_date date,	
sale_time time,
customer_id	int,
gender varchar(8),
age	int,
category varchar(15),
quantiy	int,
price_per_unit	float,
cogs float,
total_sale float
);
select*from retail_sale;
SELECT COUNT(*) FROM retail_sale;
SELECT COUNT(DISTINCT customer_id) FROM retail_sale;
SELECT DISTINCT category FROM retail_sale;

SELECT * FROM retail_sale
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantiy IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

delete from retail_sale
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantiy IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
    
    -- Write a SQL query to retrieve all columns for sales made on '2022-11-05
    
    SELECT *
FROM retail_sale
WHERE sale_date = '2022-11-05';

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4

SELECT 
  *
FROM retail_sale
WHERE 
    category = 'Clothing'
    AND
    quantiy >= 4;
    
    -- Write a SQL query to calculate the total sales (total_sale) for each category
    
    SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sale
GROUP BY 1;

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category

SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sale
WHERE category = 'Beauty';

-- Write a SQL query to find all transactions where the total_sale is greater than 1000

select*from retail_sale where total_sale>1000;

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category

select category,gender,count(*) as transactions from retail_sale group by category,gender order by 2;
select*from retail_sale;

-- Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sale
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Write a SQL query to find the number of unique customers who purchased items from each category

select  category,count(distinct customer_id) as unique_customers from retail_sale group by 1;

-- or

SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sale
GROUP BY category;
