SUPERSTORE DATA ANALAYSIS

Project aims to explore the Walmart Sales data to understand top performing branches and products, sales trend of of different products, customer behaviour. The aims is to study how sales strategies can be improved and optimised. 

This dataset contains sales transactions from a three different branches of SUPER STORE , respectively located in Mandalay, Yangon and Naypyitaw. 

invoice_id	-Invoice of the sales made
branch	-Branch at which sales were made
city-	The location of the branch
customer_type	-The type of the customer
gender-	Gender of the customer making purchase
product_line-	Product line of the product self
unit_price-	The price of each product
quantity-	The amount of the product sold
VAT	-The amount of tax on the purchase
total-	The total cost of the purchase
date	-The date on which the purchase was made
time-	The time at which the purchase was made
payment_method-	The total amount paid
cogs-	Cost Of Goods sold
gross_margin_percentage-	Gross margin percentage
gross_income	-Gross Income
rating	-Rating


———>Feature engineering 

COGS = unitsPrice * quantity 

VAT = 5% * COGS 

total(gross_sales) = VAT + COGS 

grossProfit(grossIncome) = total(gross_sales) - COGS 

Gross Margin = fraction
({gross income}{total revenue})


Approach used:-

1.Data Wrangling: This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace, missing or NULL values.
- [ ] Build a database
- [ ] Create table and insert the data.
- [ ] Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.

2.Feature Engineering: This will help use generate some new columns from existing ones.
- [ ] Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
- [ ] Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
- [ ] Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
3.Exploratory Data Analysis (EDA): Exploratory data analysis to answers the queries we required 


Analysis list 
Product Analysis
Conduct analysis on the data to understand the different product lines, the products lines performing best and the product lines that need to be improved.

Sales Analysis
This analysis aims to answer the question of the sales trends of product. The result of this can help use measure the effectiveness of each sales strategy the business applies and what modifications are needed to gain more sales.

Customer Analysis
This analysis aims to uncover the different customers segments, purchase trends and the profitability of each customer segment.
