-- import the database  
select * from anuj.salesdata;

-- Data cleaning
SELECT
	*
FROM sales;

-- Feature Engineering 

-- time-date column 

Alter table salesdata add
time_day varchar(90);

update salesdata
set time_day=case
 when time between '00:00:00' and '12:00:00' then "morning"
 when time between '12:00:00'and '16:00:00'then "afternoon"
 else "evening"
  end;
  
  -- Creating day column using the date column
 
alter table salesdata add 
day_name varchar(90);

update walmartsalesdata
set day_name= dayname(date);

-- Creating month column using the date column 
 
alter table salesdata add 
month_name varchar(90);

update salesdata
set month_name= monthname(date);


-- Exploratory Data Analysis (EDA)

-- How many unique cities does the data have?
select distinct city from salesdata;

-- In which city is each branch?
select distinct city, branch from salesdata;

-- How many unique product lines does the data have?
select count(distinct product_line) from salesdata;

-- What is the most common payment method?
select payment,
count(payment) from salesdata as cnt
group by payment;

-- What is the most selling product line?
select product_line,
count(product_line) as cnt from salesdata
group by product_line
order by product_line desc;


-- What is the total revenue by month?
select month_name,
sum(total) as total_revenue
from salesdata
group by month_name
order by total_revenue desc;

-- What month had the largest COGS?
select month_name,
sum(cogs) as cogs
from salesdata
group by month_name
order by cogs desc
limit 1;

-- What product line had the largest revenue?
select product_line,
sum(total) as revenue
from salesdata
group by product_line
order by revenue desc
limit 1;

-- What is the city with the largest revenue?
select branch,city,
sum(total) as revenue
from salesdata
group by city,branch
order by revenue desc
limit 1;

-- What product line had the largest VAT?
select product_line,
avg(vat) as vat
from salesdata
group by product_line
order by vat desc;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

-- Which branch sold more products than average product sold?
select branch,
sum(quantity) as qty
from salesdata
group by branch
having qty>avg(quantity)
limit 1;

-- What is the most common product line by gender?
select gender,product_line,
count(gender) as gender 
from salesdata
group by gender,product_line
order by gender desc;

-- What is the average rating of each product line?
select product_line,
round(avg(rating),2) as average
from salesdata
group by product_line
order by average desc;

-- Number of sales made in each time of the day per weekday
select time_day,
count(time_day) as total_sales 
from salesdata
where day_name='sunday'
group by time_day
order by total_sales desc;

-- Which of the customer types brings the most revenue?
select Customer_type,
sum(total) as revenue
from salesdata
group by customer_type
order by revenue desc
limit 1;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
select city,
avg(vat) as largest_tax 
from salesdata
group by city
order by largest_tax desc;

-- Which customer type pays the most in VAT?
select customer_type,
avg(vat) as pays_most
from salesdata
group by customer_type
order by pays_most desc
limit 1;

-- How many unique customer types does the data have?
select distinct customer_type from salesdata;

-- How many unique payment methods does the data have?
select distinct payment from salesdata;

-- What is the most common customer type?
select customer_type,
count(*) as count
from salesdata
group by customer_type;

-- Which customer type buys the most?
select customer_type,
count(*) 
from salesdata
group by customer_type;

-- What is the gender of most of the customers?
select gender,
count(*) as count
from salesdata
group by gender;

-- What is the gender distribution per branch?
select gender,
count(gender) as count
from salesdata
where branch='c'
group by gender;

-- Which time of the day do customers give most ratings?
select time_day,
avg(rating) as best_rating
from salesdata
group by time_day
order by best_rating desc
limit 1;

-- Which day of the week has the best avg ratings?
select day_name,
avg(rating) as best_rating
from salesdata
group by day_name
order by best_rating desc
limit 1;

-- Which day of the week has the best average ratings per branch?
select branch,day_name,
avg(rating) as best_rating
from salesdata
group by branch,day_name
order by best_rating desc
limit 1;






