
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SQL analysis for table b_coffee_sales

--1 total revenue
SELECT SUM(transaction_qty *(CAST(REPLACE(unit_price, ',' , '.' )AS DECIMAL(10,2)))) AS total_revenue 
FROM b_coffee_sales



--2 total revenue per product category
SELECT product_category, SUM(transaction_qty *(CAST(REPLACE(unit_price, ',' , '.' )AS DECIMAL(10,2)))) AS total_revenue 
FROM b_coffee_sales 
GROUP BY product_category


--3 total revenue per product category and product detail
SELECT product_category, product_detail, SUM(transaction_qty *(CAST(REPLACE(unit_price, ',' , '.' )AS DECIMAL(10,2)))) AS total_revenue 
FROM b_coffee_sales 
GROUP BY product_category, product_detail

--4 total revenue per product type
SELECT product_type, SUM(transaction_qty *(CAST(REPLACE(unit_price, ',' , '.' )AS DECIMAL(10,2)))) AS total_revenue 
FROM b_coffee_sales 
GROUP BY product_type

--5 total units sold
SELECT SUM(transaction_qty) AS total_units_sold 
FROM b_coffee_sales

--6 total revenue per store loaction 
SELECT store_location, SUM(transaction_qty *(CAST(REPLACE(unit_price, ',' , '.' )AS DECIMAL(10,2)))) AS total_revenue 
FROM b_coffee_sales 
GROUP BY store_location


--7 toatal revenue based on the time of day first finding the min and max times of transactions, then bucketing themthe into morming, afternoon, evening, night

SELECT MIN(transaction_time) as min_time, MAX(transaction_time) as max_time 
FROM b_coffee_sales

SELECT HOUR(TO_TIMESTAMP(transaction_time, 'HH:mm:ss')) AS sales_hour, SUM(transaction_qty *(CAST(REPLACE(unit_price, ',' , '.' )AS DECIMAL(10,2)))) AS total_revenue 
FROM b_coffee_sales 
GROUP BY HOUR(TO_TIMESTAMP(transaction_time, 'HH:mm:ss')) 
ORDER BY total_revenue DESC

--6am - 11:59:59 > Morning
--12pm - 16:59:59 > Afternoon
--17pm - 19:59:59 > Evening
--After 8pm 23:59:59 > Night

SELECT
CASE 
WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
WHEN transaction_time BETWEEN '17:00:00' AND '19:59:59' THEN 'Evening'
ELSE 'Night'
END AS time_bucket,
SUM(transaction_qty *(CAST(REPLACE(unit_price, ',' , '.' )AS DECIMAL(10,2)))) AS total_revenue
FROM b_coffee_sales
GROUP BY time_bucket


--8 time of the day that generates the most revenue
SELECT
HOUR(TO_TIMESTAMP(transaction_time, 'HH:mm:ss')) AS sales_hour,
SUM(transaction_qty *(CAST(REPLACE(unit_price, ',' , '.' )AS DECIMAL(10,2)))) AS total_revenue
FROM b_coffee_sales
GROUP BY sales_hour
ORDER BY total_revenue DESC;

--9 hour with the highest number of transactions

SELECT
HOUR(TO_TIMESTAMP(transaction_time, 'HH:mm:ss')) AS sales_hour,
COUNT(DISTINCT transaction_id) AS total_transactions
FROM b_coffee_sales
GROUP BY sales_hour
ORDER BY total_transactions DESC;

--10 Which days of the week generate the most revenue?

SELECT
DATE_FORMAT(transaction_date, 'EEEE') AS weekday,
SUM(transaction_qty *(CAST(REPLACE(unit_price, ',' , '.' )AS DECIMAL(10,2)))) AS total_revenue 
FROM b_coffee_sales
GROUP BY weekday
ORDER BY total_revenue DESC;

--11 Which months generate the highest revenue?
SELECT 
MONTHNAME(transaction_date) AS month_number,
DATE_FORMAT(transaction_date, 'MMMM') AS month_name,
SUM(transaction_qty *(CAST(REPLACE(unit_price, ',' , '.' )AS DECIMAL(10,2)))) AS total_revenue
FROM b_coffee_sales
GROUP BY month_number, month_name
ORDER BY month_number;



--12 products that have the highest quantity 

SELECT
product_detail,
SUM(transaction_qty *(CAST(REPLACE(unit_price, ',' , '.' )AS DECIMAL(10,2)))) AS total_revenue,
SUM(transaction_qty) AS total_units_sold
FROM b_coffee_sales
GROUP BY product_detail
ORDER BY total_units_sold DESC;

--13 Which products generate the lowest revenue?
SELECT
product_detail,
SUM(transaction_qty *(CAST(REPLACE(unit_price, ',' , '.' )AS DECIMAL(10,2)))) AS total_revenue
FROM b_coffee_sales
GROUP BY product_detail
ORDER BY total_revenue ASC;

--14 Which product categories sell the most units?
SELECT
product_category,
SUM(transaction_qty) AS total_units_sold
FROM b_coffee_sales
GROUP BY product_category
ORDER BY total_units_sold DESC;

