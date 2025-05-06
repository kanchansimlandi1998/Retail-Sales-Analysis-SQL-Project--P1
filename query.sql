create database sql_project;

CREATE TABLE retail_sales
(
transaction_id INT PRIMARY KEY,	
sale_date DATE,	 
sale_time TIME,	
customer_id	INT,
gender	VARCHAR(15),
age	INT,
category VARCHAR(15),	
quantity INT,
price_per_unit FLOAT,	
cogs FLOAT,
total_sale FLOAT
            );
            
select * from retail_sales limit 2000;

-- count number from tables
select count(*) from retail_sales;

select * from retail_sales
where 
transaction_id is null
or
sale_date is null
or sale_time is null
or
customer_id is null
or 
gender is null
or
category is null
 OR cogs is null
 OR total_sale is null;
 
 -- DELETE NULL DATA
SET SQL_SAFE_UPDATES = 0;

DELETE FROM retail_sales
WHERE
  sale_date IS NULL OR
  sale_time IS NULL OR
  gender IS NULL OR
  category IS NULL OR
  quantity IS NULL OR
  cogs IS NULL OR
  total_sale IS NULL;

SET SQL_SAFE_UPDATES = 1;

DELETE FROM retail_sales
WHERE transaction_id is null;


-- Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT * FROM retail_sales
WHERE  sale_date between '2022-11-01'AND '2022-11-30';

-- Write a SQL query to retrieve total quantity made on '2022-11-05
SELECT sum(quantity) from retail_sales
WHERE  sale_date = '2022-11-05';

-- Write a SQL query to retrieve total price made on '2022-11-05
select sum(price_per_unit) from retail_sales
where sale_date = '2022-11-05';

-- Write a SQL query to retrieve avg price made on '2022-11-05
select avg(price_per_unit) from retail_sales
where sale_date = '2022-11-05';

-- Write a SQL query to retrieve min age who made on '2022-11-05
select min(age) from retail_sales
where sale_date='2022-11-05';


-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

select * from retail_sales
where category = 'Clothing' AND quantity >= 4 AND sale_date between '2022-11-01'AND '2022-11-30';


-- **Write a SQL query to calculate the total sales (total_sale) for each category.**

SELECT category from retail_sales;
select sum(total_sale) from retail_sales
where category = Electronics AND category = Beauty AND category = Clothing;

select category,count(total_sale) from retail_sales
group by 1;

select category,sum(total_sale) from retail_sales
group by 1;

-- **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
select (round(avg(age),2))AS avg_age  
 from retail_sales
where category = 'beauty';

-- 5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
select * from retail_sales
where total_sale > 1000 order by total_sale desc;

-- 6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
select gender,category, count(*) AS transactions from retail_sales group by category,gender
order by 1

-- 7. -- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
select * from retail_sales limit 2000; -- FETCH ALL VALUES
SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS sale_month,
    AVG(total_sale) AS average_sale
FROM
    retail_sales
GROUP BY
    sale_month
ORDER BY
    sale_month;
    
    -- ANOTHER WAY TO FETCH THIS
    
    SELECT year,month,avg_sale
FROM 
( SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS AVG FROM retail_sales
GROUP BY 1, 2
) 
as t1
WHERE AVG = 1
    
    
    
    
    
    


-- 8. Write a SQL query to find the top 5 customers based on the highest total sales
select customer_id,sum(total_sale) as  highest_total_sales
from retail_sales
group by customer_id
order by highest_total_sales desc
limit 5;