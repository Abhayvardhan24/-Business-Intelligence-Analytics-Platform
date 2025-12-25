CREATE DATABASE bi_platform;
USE bi_platform;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    location VARCHAR(100),
    acquisition_date DATE
);

CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_category VARCHAR(50),
    region VARCHAR(50),
    revenue DECIMAL(10,2),
    profit DECIMAL(10,2),
    quantity INT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
select * from customer;
select * from sales;
SELECT * FROM sales LIMIT 5;

-- Joins between sales & customers
SELECT s.`Order ID`,s.`Order Date`,s.`Product Category`,s.Region,s.Quantity,s.Revenue,s.Profit,c.`Customer Name`,
c.Segment,c.Location FROM sales s JOIN customer c ON s.`Customer ID` = c.`Customer ID`;

-- KPI Calculation
SELECT SUM(Revenue) AS Total_Revenue FROM sales;

-- Total Profit
SELECT SUM(Profit) AS Total_Profit FROM sales;

-- Total Profit Margin
SELECT (SUM(Profit) / SUM(Revenue)) * 100 AS Profit_Margin_Percentage FROM sales;

-- customer Count
SELECT COUNT(DISTINCT `Customer ID`) AS Customer_Count FROM customer;

-- Average Order values
SELECT COUNT(DISTINCT `Customer ID`) AS Customer_Count FROM customer;

-- Time Based
SELECT YEAR(STR_TO_DATE(`Order Date`, '%Y-%m-%d')) AS Year,
MONTH(STR_TO_DATE(`Order Date`, '%Y-%m-%d')) AS Month,SUM(Revenue) AS Monthly_Revenue FROM sales
GROUP BY Year, Month
ORDER BY Year, Month;

-- yearly Revenue
SELECT YEAR(STR_TO_DATE(`Order Date`, '%Y-%m-%d')) AS Year,SUM(Revenue) AS Yearly_Revenue
FROM sales GROUP BY Year ORDER BY Year;

-- Revenue by Region
SELECT Region,SUM(Revenue) AS Total_Revenue FROM sales GROUP BY Region
ORDER BY Total_Revenue DESC;

-- Profit by Region
SELECT Region,SUM(Profit) AS Total_Profit FROM sales
GROUP BY Region ORDER BY Total_Profit DESC;



