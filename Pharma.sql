use pharma_data;

SELECT * FROM pharma;

select count(*) from pharma;

select  count(distinct  country) as  Unique_countries
from pharma;

select `customer name`
from pharma
where `sub-channel` = 'Retail';


select sum(quantity) as total_quantity 
from pharma
where `product class` = 'Antibiotics';

select distinct month 
from pharma;

select year, sum(sales) as total_sales
from pharma
group by year;

select `customer name` , sum(sales) as total_sales
from pharma
group by 1
order by 2 desc
limit 1;

select `Name of Sales Rep` ,manager 
from pharma
where manager = 'James Goodwill';

select city, sum(sales) as total_sales
from pharma
group by 1
order by 2 desc
limit 5;

select `sub-channel` , round(avg(price),2) as avg_price 
from pharma
group by 1
order by 2 desc;

select `Name of Sales Rep` ,city , year
from pharma
where city = 'Rendsburg' and year = 2018 ;

select `product class` , sum(sales) as total_sales, month,year
from pharma
group by 1,3,4
order by 4,3,1;

select `Name of Sales Rep`, sum(sales) as total_sales
from pharma
where year = 2019
group by 1
order by 2 desc 
limit 3;

select `Sub-channel` , sum(sales) as total_sales , month,year, avg(sales) as avg_monthsales 
from pharma
group by 1,3,4;

select `sub-channel`, avg(total_sales) as avg_monthsales
from (select `Sub-channel` , sum(sales) as total_sales , month,year
from pharma
group by 1,3,4) as month_sales
group by 1;

select `product class`, sum(sales) as total_sales, round(avg(price),2) as avg_price ,sum(quantity) as total_quantity 
from pharma
group by 1;

select `name of sales rep` ,sum(sales) as total_sales ,year
from pharma
group by 1,3
order by 2
limit 5;

select country,year , sum(sales) as total_sales
from pharma
group by 1 ,2;


SELECT country,year,total_sales,
    LAG(total_sales) OVER (PARTITION BY country ORDER BY year) AS previous_year_sales,
    ((total_sales - LAG(total_sales) OVER (PARTITION BY country ORDER BY year)) / 
    LAG(total_sales) OVER (PARTITION BY country ORDER BY year)) * 100 AS yoy_growth
FROM (SELECT country,YEAR,SUM(sales) AS total_sales
    FROM pharma
    GROUP BY country,year
) AS yearly_sales;

select month,year, sum(sales) as total_sales 
from pharma
group by 1,2
order by 3 ;


select month,year, sum(sales) as total_sales 
from pharma
group by 1,2
having total_sales = (select min(sub.total_sales)  from (select month,year, sum(sales) as total_sales 
from pharma
group by 1,2) as sub
where sub.year = year)
order by year ,month;

select country,`sub-channel`,sum(sales) as total_sales 
from pharma
group by 1,2;


with subchannelsales as (select country,`sub-channel`,sum(sales) as total_sales 
from pharma
group by 1,2),
maxsubchannel as (select `sub-channel`,max(total_sales) as max_sales 
from subchannelsales
group by 1)
select sc.country,sc.`sub-channel`,sc.total_sales from subchannelsales  sc
join maxsubchannel msc on sc.`sub-channel` = msc.`sub-channel` and sc.total_sales = msc.max_sales;
