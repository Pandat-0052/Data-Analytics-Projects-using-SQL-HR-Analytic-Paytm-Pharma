create database aakash;
use aakash;

1.Retrieve the total number of employees in the dataset.

SELECT COUNT(*) AS total_employees
from general_data;

2. List all unique job roles in the dataset.
   
   select distinct jobrole 
   from general_data;

Select round(avg(age),2) as Avg_age 
from general_data;

select `emp name`,age
from general_data
where yearsatcompany >5;

select department, count(*) as count_employees
from general_data
group by department;

select employeeid 
from employee_s
where jobsatisfaction = 3;

select max(monthlyincome) as Max_salary
from general_data;

select * 
from general_data 
where BusinessTravel = 'Travel_Rarely';

select distinct  MaritalStatus 
from general_data;

select * 
from general_data
where totalworkingyears < 2 and yearsatcompany < 4;

select * 
from general_data
where jobrole<> joblevel and joblevel<>jobrole;

select department, round(avg(distancefromhome),2) as avg_distance
from general_data
group by department;

select  `emp name` ,monthlyincome
from general_data
order by monthlyincome desc
limit 5 ;

select  `emp name` ,monthlyincome
from general_data
order by 2 desc
limit 5 ;

SELECT 
    COUNT(CASE WHEN promotion_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR) THEN 1 END) AS promoted_last_year,
    COUNT(*) AS total_employees,
    (COUNT(CASE WHEN promotion_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR) THEN 1 END) / COUNT(*)) * 100 AS promotion_percentage
FROM 
    employee_promotions;

SELECT 
    COUNT(CASE WHEN YearsSinceLastPromotion <= 1 THEN 1 END) AS promoted_last_year,
    COUNT(*) AS total_employees,
    (COUNT(CASE WHEN YearsSinceLastPromotion <= 1 THEN 1 END) / COUNT(*)) * 100 AS promotion_percentage
FROM 
    general_data;
    
    SELECT 
    round((COUNT(CASE WHEN YearsSinceLastPromotion <= 1 THEN 1 END) / COUNT(*)) * 100,2) AS promotion_percentage
FROM 
    general_data;
    
select g.`emp name` ,e.environmentsatisfaction
from general_data g join employee_s e 
on g.employeeid = e.employeeid
where e.environmentsatisfaction in (1,3);


SELECT    JobRole, MaritalStatus,COUNT(*) AS employee_count
FROM general_data
GROUP BY JobRole, MaritalStatus
HAVING COUNT(*) > 1;

select g.`emp name`,g.totalworkingyears,m.performancerating
from general_data g join manager_s m 
on g.employeeid = m.employeeid
where g.totalworkingyears = (select max(g.totalworkingyears) from general_data g join manager_s m 
on g.employeeid = m.employeeid where m.performancerating = 4 ) and m.performancerating = 4;

select g.businesstravel,round(avg(g.age),2) as Avg_age ,e.jobsatisfaction
from general_data g join employee_s e
on g.employeeid = e.employeeid
group by g.businesstravel,e.jobsatisfaction;

select count(*) as field_count ,educationfield
from general_data
group by educationfield
order by 1 desc
limit 1 ;

select `emp name` ,yearsatcompany
from general_data 
where yearsatcompany = ( select max(yearsatcompany) from general_data)  and yearssincelastpromotion = 0 ;












