CREATE DATABASE zepto_2;

USE zepto_2; 

SELECT @@autocommit;
SET autocommit = 0;


START TRANSACTION;
CREATE TABLE zepto(
	id INT PRIMARY KEY AUTO_INCREMENT,
	category VARCHAR(100),
    name VARCHAR(100),
    mrp DECIMAL(10, 2),
    discountPercent INTEGER,
    availableQuantity INTEGER,
    discountedSellInr DECIMAL(10, 2),
    weightInGms INTEGER,
    outOfStock TINYINT(1),
    quantity INTEGER
);

SHOW TABLES;
SELECT * FROM zepto limit 10;

# Checking the null values in the dataset
SELECT * FROM zepto
WHERE category IS NULL
OR
name IS NULL
OR
mrp IS NULL
OR
discountpercent IS NULL
OR
availableQuantity IS NULL
OR
discountedSellInr IS NULL
OR
weightInGms IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

# Different Product Categories
SELECT DISTINCT category FROM zepto
ORDER BY category;

# Product in stock vs out stock
SELECT outOfStock, COUNT(id) 
FROM zepto GROUP BY outOfStock;

# product names present multiple times
SELECT name, count(id) as 'Number of units Present multiple times'
from zepto group by name having count(id) > 1 
order by count(id) desc;

# Data cleaning
-- products with price 0
select * from zepto where mrp = 0 or discountedSellInr = 0;
# We need to delete this row
Delete from zepto where mrp = 0;
SET SQL_SAFE_UPDATES = 0;

# convert paise to rupees
# running this line multiple times , cause mrp and discountedSellInr changes to 0
update zepto set mrp = mrp/100.0, discountedSellInr = discountedSellInr/100.0;

select mrp, discountedSellInr from zepto;

-- Q1. Find the top 10 best value products based on the discounted percentages
select distinct name, mrp, discountPercent 
from zepto
order by discountPercent desc limit 10;

-- Q2. What are the products with high MRP but out of stock
select distinct name, mrp from zepto
where outOfStock = TRUE and mrp > 300 
order by mrp desc;

-- Q3. Calculate estimated revenue for each category
select category,
sum(discountedSellInr * availableQuantity) as total_revenue
from zepto group by category
order by total_revenue; 

-- Q4. Find all the products where mrp is greater than 500 and discount is less than 10%
select distinct name, mrp, 
discountPercent from zepto
where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc; 

-- Q5. Identify the top 5 categories offering the highest avg discount percentage
select category, 
round(avg(discountPercent), 2) as avg_discount  
from zepto group by category
order by avg_discount desc limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value
select distinct name, weightInGms, discountedSellInr, 
round(discountedSellInr/weightInGms,2) as price_per_gram
from zepto where weightInGms >= 100
order by price_per_gram;

-- Q7. Group the products into categories like low, medium, bulk
select distinct name, weightInGms,
case when weightInGms < 1000 then 'Low'
	when weightInGms < 5000 then 'Medium'
	else 'Bulk'
    end as weight_category
from zepto;

-- Q8. What is the total inventory weight per category
select category, sum(weightInGms * availableQuantity) 
as total_weight from zepto
group by category
order by total_weight;
-- # Dont execute. After every query we will execute commit
COMMIT; 