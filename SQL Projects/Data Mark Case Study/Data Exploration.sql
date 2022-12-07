select *
from clean_weekly_sales
limit 10;
-------------------------------------------------------------------------------
-- Data Exploration
-- which week numbers are missing from the dataset?

create table seq52(x int auto_increment primary key);
insert into seq52 values (),(),(),(),();
insert into seq52 values (),(),(),(),();
insert into seq52(select x+10 from seq52);
insert into seq52 values (),(),(),(),();
insert into seq52 values (),(),(),(),();
insert into seq52 values (),(),(),(),();
insert into seq52 values (),(),(),(),();
insert into seq52 values (),(),(),(),();
insert into seq52 values (),(),(),(),();
insert into seq52 values (),();

select * from seq52;

-- this query will display all the week numbers that missing from the database
select x
from seq52
where x not in (select distinct(week_number) from clean_weekly_sales);

----------------------------------------------------------------------------------
-- How many total transaction were there for each year in the dataset?

select calendar_year,sum(transactions) as total_transactions
from clean_weekly_sales
group by calendar_year;

-----------------------------------------------------------------------------------
-- What are the total sales for each region for each month?

select region,week_number, sum(sales) as total_sales
from clean_weekly_sales
group by region, week_number
order by region asc;

------------------------------------------------------------------------------------
-- What is the total count of transactions for each platform
select platform, sum(transactions) as total_transaction
from clean_weekly_sales
group by platform;

-------------------------------------------------------------------------------------
-- What is the percentage of sales for Retail vs Shopify for each month?







-------------------------------------------------------------------------------------
-- What is the percentage of sales by demographic for each year in the dataset?
select calendar_year, demographic,
round(100*sum(sales)/sum(sum(sales)) over (partition by demographic),2) as percentage
from clean_weekly_sales
group by calendar_year, demographic
order by calendar_year desc;

--------------------------------------------------------------------------------------
-- Which age_band and demographic values contribute the most to Retail sales?

select *  from clean_weekly_sales limit 10;
select age_band, demographic,
sum(sales) as total_sales
from clean_weekly_sales
where platform = 'Retail'
group by age_band, demographic
order by total_sales desc;

select * from weekly_sales







