select * from weekly_sales limit 10;


create table clean_weekly_sales as
select week_date,
week(week_date) as week_number,
month(week_date) as month_number,
year(week_date) as calendar_year,
region,platform,
case 
	when segment = null then 'Unknown'
    else segment end as segment,
case 
	when right(segment,1) = '1' then 'Young Aged'
    when right(segment,1) = '2' then 'Middle Aged'
    when right(segment,1) in ('3','4') then 'Retirees'
    else 'Unknown' end as age_band,
case
	when left(segment,1) = 'F' then 'Families'
    when left(segment,1) = 'C' then 'Couples'
    else 'Unknown' end as demographic,
customer_type, transactions, sales,
round(sales/transactions,2) as avr_transaction
from weekly_sales;
