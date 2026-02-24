CREATE TABLE Sales(
Transactions_id INT PRIMARY KEY,
Sale_Date DATE,
Sale_Time TIME,
Customer_id INT NOT NULL,
Gender VARCHAR(15),
Age INT,
Category VARCHAR(20),
Quantity INT,
Price_Per_Unit DECIMAL,
Cogs DECIMAL,
Total_sale DECIMAL);

##After importing data,check to confirm the imported data is in the table(preview)

SELECT * 
FROM sales 
LIMIT 25;

##check to confirm how many records were imported
SELECT COUNT(*) 
FROM sales;

##To check for duplicates
SELECT transactions_id, COUNT(*)
FROM sales
GROUP BY transactions_id
HAVING COUNT(*) > 1;

##checked columns for inconsistent values and wrong spelling
##None found


##checked data type of columns
##To check the data type of columns, I navigate to my database created - Schemas - Tables - sales
(Right-click) - Properties - Columns

##checked missing/null values in each column
SELECT
    COUNT(*) FILTER (WHERE transactions_id IS NULL) AS missing_transactions_id,
    COUNT(*) FILTER (WHERE sale_date IS NULL) AS missing_sale_date,
    COUNT(*) FILTER (WHERE sale_time IS NULL) AS missing_sale_time,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_id,
    COUNT(*) FILTER (WHERE gender IS NULL OR gender = '') AS missing_gender,
    COUNT(*) FILTER (WHERE age IS NULL) AS missing_age,
    COUNT(*) FILTER (WHERE category IS NULL OR category = '') AS missing_category,
    COUNT(*) FILTER (WHERE quantity IS NULL) AS missing_quantity,
    COUNT(*) FILTER (WHERE price_per_unit IS NULL) AS missing_price_per_unit,
    COUNT(*) FILTER (WHERE Cogs IS NULL) AS missing_Cogs,
    COUNT(*) FILTER (WHERE total_sale IS NULL) AS missing_total_sale
FROM sales;

##Data cleaning
##Adjusted Data types of Columns
ALTER TABLE sales
ALTER COLUMN price_per_unit TYPE NUMERIC(10,2) USING price_per_unit::NUMERIC(10,2),
ALTER COLUMN Cogs TYPE NUMERIC(10,2) USING Cogs::NUMERIC(10,2),
ALTER COLUMN total_sale TYPE NUMERIC(10,2) USING total_sale::NUMERIC(10,2);

ALTER TABLE sales
ALTER COLUMN price_per_unit TYPE NUMERIC USING price_per_unit::NUMERIC,
ALTER COLUMN Cogs TYPE NUMERIC(10,2) USING Cogs::NUMERIC(10,2),
ALTER COLUMN total_sale TYPE NUMERIC USING total_sale::NUMERIC;

##handled missing values by deleting, rows cannot be calculated or recovered, and it is small
DELETE FROM sales
WHERE quantity IS NULL
   OR price_per_unit IS NULL
   OR total_sale IS NULL
   OR Cogs IS NULL

##handled missing values in Age columns by leaving as NULL 

##Renamed Cogs column
ALTER TABLE sales
RENAME COLUMN cogs TO cost_of_goods_sold;

#Post data cleaning EDA

##Count the rows after cleaning
SELECT COUNT(*) FROM sales;

##Verify/confirm the missing values in the data

SELECT COUNT(*) AS Cogs_after
FROM sales
WHERE Cogs IS NULL;

SELECT COUNT(*) AS price_per_unit_after
FROM sales
WHERE price_per_unit IS NULL;

SELECT COUNT(*) AS Total_sales_after
FROM sales
WHERE Total_sale IS NULL;

SELECT COUNT(*) AS Quantity_after
FROM sales
WHERE quantity IS NULL;


##Query Questions
1. ##ALL columns for sale made on 2022-11-05

SELECT *
FROM Sales
WHERE Sale_Date = '2022-11-05';

2. ##all the transactions for Clothing Category that have sold more than 4 qty in Nov 2022
  
SELECT *
FROM sales
WHERE Category = 'Clothing' AND Quantity >4
  AND sale_date BETWEEN DATE '2022-11-01' AND DATE '2022-11-30';

3. ##the total sale for each category

SELECT Category, SUM(Total_sale) AS Total_Sales
FROM Sales
GROUP BY Category;

4.##average age of customers who purchased items from the beauty category

SELECT ROUND(AVG(age),0) AS Average_Age
FROM sales
WHERE category = 'Beauty';

5.##all transactions where the total_sale is greater than 1000

SELECT Transactions_id, Total_sale
FROM Sales
WHERE Total_sale > 1000

6.## the total number of transactions(transaction_id) made by each gender in each category.
## Order by was added for neatness and orderliness

SELECT Category, Gender, COUNT(transactions_id) AS Total_Transactions_ID
FROM Sales
GROUP BY Category, Gender
ORDER BY Category;

7.## the average sale per month and best selling month in 2022 and 2023

SELECT TO_CHAR(sale_date, 'Mon YYYY') AS Month_Year, ROUND(AVG(total_sale),2) AS Average_Sale
FROM sales
GROUP BY Month_Year
ORDER BY Month_Year;

##best selling month for each year

SELECT year, month, total_monthly_sales
FROM (
SELECT TO_CHAR(sale_date, 'YYYY') AS year, TO_CHAR(sale_date, 'Mon') AS month,
SUM(total_sale) AS total_monthly_sales,
RANK() OVER (PARTITION BY TO_CHAR(sale_date, 'YYYY')
ORDER BY SUM(total_sale) DESC) AS sales_rank_num
FROM sales
GROUP BY TO_CHAR(sale_date, 'YYYY'), TO_CHAR(sale_date, 'Mon')) AS ranked
WHERE sales_rank_num = 1;

8.##the top 5 highest purchasing customer by total sales

SELECT customer_id, ROUND(SUM(total_sale),0) AS Top_5_total_sales
FROM sales
GROUP BY customer_id
ORDER BY Top_5_total_sales DESC
LIMIT 5;

9.##number of unique customers who purchased items from each category

SELECT category, COUNT(DISTINCT customer_id) AS Total_unique_customers
FROM sales
GROUP BY Category;

10.##each shift and number of orders

SELECT 
CASE WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 0 AND 11 THEN 'Morning'
     WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
     WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 18 AND 23 THEN 'Evening' END AS time_of_day,
COUNT(transactions_id) AS Total_orders_placed
FROM sales
GROUP BY Time_of_day;








