use paytm;
SELECT * FROM paytm;
select count(*) as rowss from paytm;

select distinct category_grouped 
from paytm
where category_grouped <> "";

select shipping_city,count(*) as no_of_orders
from paytm
group by shipping_city
order by 2 desc;


select * from paytm
where category ='WATCHES';


select * from paytm
where sale_flag ='On Sale';

select *,item_price 
from paytm
where sale_flag = 'On Sale'
order by 2 desc;

select * 
from paytm
where special_price_effective < 5000;

Select category,count(*) as total_sales
from paytm
group by category
order by 2 desc;

select round(avg(quantity),2) as  avg_category ,category
from paytm
where category = 'Home'
group by product_gender;

select category,value_CM1,value_CM2
from  paytm
order by 2 desc,3 desc
limit 5;


select category,value_CM1,value_CM2
from  paytm
order by (2/3) desc
limit 5;

select category,sum(item_price) as total_price
from paytm
group by category
order by 2 desc
limit 3;

select brand, sum(quantity) as total_sales
from paytm
where sale_flag = 'On Sale'
group by brand
order by 2 desc
limit 3;

select category, sum(paid_pr) as total_revenue
from paytm
where sale_flag = 'On Sale' and category = 'Bags';

select shipping_city, round(sum(paid_pr)/count(*),2)as avg_order_value
from paytm
group by shipping_city
order by 2 desc
limit 5 ;

select product_gender,count(quantity) as no_of_orders, sum(paid_pr) as total_sales
from paytm
where category = 'Furniture'
group by product_gender;

select category, sum(paid_pr) as total_sales,
        round(sum(paid_pr)/(select sum(paid_pr) from paytm )* 100,2) as Per_contribution
        from paytm
        group by category;
        
select category, round(avg(item_price),2) as avg_item_price 
from paytm
group by category
order by 2 desc
limit 1;

select segment, sum(paid_pr) as total_sales ,round(avg(quantity),1) as avg_sold_quantity
from paytm
group by segment;