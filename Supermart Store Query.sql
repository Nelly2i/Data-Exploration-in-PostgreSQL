/* To select the customer*/

select * from customer;

/* To select the product table*/

select * from product;

/* To select the sales table */

select * from sales;

/* To select everything from the customer table where the city is either Philadelphia or Seattle */

select * from customer where city in ('Philadelphia','Seattle');

--Between Function

select * from customer where age between 20 and 30;

select * from customer where age not between 20 and 30;
 
select * from sales where ship_date between '2015-01-01' and '2016-01-01';
 
/* COUNT FUNCTION*/ 

select * from sales;

--this counts all the rows in the entire sales table

select count(*) as "total no of sales" from sales;	--9994

select count(order_line) as "number of products ordered", count(distinct order_id) as "number of orders" from sales where customer_id = 'CG-12520';

--SUM FUNCTION

select sum(profit) as "total profit" from sales;

--total quantity of a particular product sold

select sum(quantity) as "total quantity" from sales where product_id = 'FUR-TA-10000577';	--29

--AVERAGE FUNCTION

select avg(age) as "average customer age" from customer;	--this is the average age of all customers

select avg(sales *.10) as "average commission value" from sales;	--this is the average 10% commission

--MIN AND MAX FUNCTIONS

select min(sales) as "minimum sales value for june 2015" 
from sales 
where order_date between '2015-06-01' and '2015-06-30';

select sales
from sales 
where order_date between '2015-06-01' and '2015-06-30' order by sales;

select max(sales) as "maximum sales value for june 2015" 
from sales 
where order_date between '2015-06-01' and '2015-06-30';

/* To find the sum of all the sales value */

select sum(sales) as "total sales  value" from sales;	--2297200.860299955

select * from customer;

/* To find count of the number of customers in north region with age between 20 and 30 */

select count(customer_id) as "no of customers in north region between 20 and 30 yrs" from customer
where region = 'North' and age between 20 and 30;	--0

/* To find the average age of east region customers */

select avg(age) as "average age of east region customers" from customer
where region = 'East';	--44.3363636363636364

/* To find the minimum and maximum aged customer from Philadelphia */

select min(age) as "youngest customer from philadelphia" from customer
where city = 'Philadelphia';	--18

select max(age) as "oldest customer from philadelphia" from customer
where city = 'Philadelphia';	--70

--GROUP BY FUNCTION

select * from customer;

select region, count(customer_id) as customer_count from customer group by region;

select product_id, sum(quantity) as quantity_sold from sales group by product_id order by quantity_sold desc;

select customer_id,
min(sales) as minimum_sales,
max(sales) as maximum_sales,
avg(sales) as average_sales,
sum(sales) as total_sales from sales 
group by customer_id order by total_sales desc limit 5;

--HAVING CLAUSE

select region, count(customer_id) as customer_count from customer group by region having count(customer_id)>200;

select region, count(customer_id) as customer_count from customer where customer_name like 'A%' group by region;

select * from sales;
/* To make a dashboard showing the following figures for each product ID
a) Total sales (in $) order by this column in descending
b) Total sales quantity
c) Number of orders
d) Max Sales value
e) Min Sales value
f) Average sales value */

select product_id,
sum(sales) as "total sales in $",
sum(quantity) as "total sales quantity",
count(order_line) as "number of orders",
max(sales) as "maximum sales value",
min(sales) as "minimum sales value",
avg(sales) as "average sales value" from sales group by product_id order by "total sales in $" desc;

-- To get the list of product ID’s where the quantity of product sold is greater than 10 

select product_id, sum(quantity) as total_quantity from sales group by product_id having sum(quantity) > 10;

--CASE FUNCTION

select *, case
			when age<30 then 'young'
			when age>60 then 'senior citizen'
			else 'middle aged'
			end as age_category
from customer;

/* JOINS*/
--Creating sales table of year 2015

create table sales_2015 as select * from sales where ship_date between '2015-01-01' and '2015-12-31';

select count(*) from sales_2015; --2131

select count(distinct customer_id) from sales_2015; --578

/* customers with age between 20 and 60 */

create table customer_20_60 as select * from customer where age between 20 and 60;
select count(*) from customer_20_60; --597

/* INNER JOINS */

select customer_id from sales_2015 order by customer_id;
select customer_id from customer_20_60 order by customer_id;

select
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
from sales_2015 as a
inner join customer_20_60 as b
on a.customer_id = b.customer_id
order by customer_id;

/* LEFT JOIN */

select customer_id from sales_2015 order by customer_id;
select customer_id from customer_20_60 order by customer_id;

/* AA-10315 not present in customer_20_60 table
	AA-10375 present in both
	AA-10480 not present in sales_2015 table */
	
select
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
from sales_2015 as a
left join customer_20_60 as b
on a.customer_id = b.customer_id
order by customer_id;

/* RIGHT JOIN */

select customer_id from sales_2015 order by customer_id;
select customer_id from customer_20_60 order by customer_id;

/* AA-10315 not present in customer_20_60 table
	AA-10375 present in both
	AA-10480 not present in sales_2015 table */
	
select
	a.order_line,
	a.product_id,
	b.customer_id,
	a.sales,
	b.customer_name,
	b.age
from sales_2015 as a
right join customer_20_60 as b
on a.customer_id = b.customer_id
order by customer_id;

/* FULL OUTER JOIN */

select customer_id from sales_2015 order by customer_id;
select customer_id from customer_20_60 order by customer_id;

/* AA-10315 not present in customer_20_60 table
	AA-10375 present in both
	AA-10480 not present in sales_2015 table */

select
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age,
	b.customer_id
from sales_2015 as a
full join customer_20_60 as b
on a.customer_id = b.customer_id
order by a.customer_id, b.customer_id;

/* CROSS JOIN */

create table month_values (MM integer);
create table year_values (YYYY integer);

insert into month_values values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);
insert into year_values values (2011),(2012),(2013),(2014),(2015),(2016),(2017),(2018),(2019);

select * from month_values;
select * from year_values;

select a.YYYY, b.MM
from year_values as a, month_values as b
order by a.YYYY, b.MM;

/* EXCEPT */

select customer_id from sales_2015 order by customer_id;
select customer_id from customer_20_60 order by customer_id;

/* AA-10315 not present in customer_20_60 table
	AA-10375 present in both
	AA-10480 not present in sales_2015 table */
	
select customer_id from sales_2015
except
select customer_id from customer_20_60
order by customer_id;

/* UNION */

select customer_id from sales_2015 order by customer_id;
select customer_id from customer_20_60 order by customer_id;

/* AA-10315 not present in customer_20_60 table
	AA-10375 present in both
	AA-10480 not present in sales_2015 table */
	
select customer_id from sales_2015
union
select customer_id from customer_20_60
order by customer_id;

select * from sales_2015;
select * from customer_20_60;

/* To find the total sales done in every state for customer_20_60 and 
sales_2015 table */

select
	b.state, sum(a.sales) as total_sales
from sales_2015 as a
left join customer_20_60 as b
on a.customer_id = b.customer_id
group by b.state
order by b.state;

select * from product;
select * from sales;

/* To get data containing Product_id, product name, category, total sales 
value of that product and total quantity sold */

select a.*,
	sum(b.sales) as total_sales,
	sum(b.quantity) as total_quantity
from product as a
left join sales as b
on a.product_id = b.product_id
group by a.product_id
order by a.product_id;

/* SUBQUERY */

select * from sales
where customer_id in (select customer_id from customer where age > 60);

select a.product_id, a.product_name, a.category, b.quantity
from product as a
left join (select product_id, sum(quantity) as quantity from sales group by product_id) as b
on a.product_id = b.product_id
order by b.quantity desc;

select customer_id, order_line, (select customer_name from customer where customer.customer_id=sales.customer_id)
from sales
order by customer_id;

/* To get data with all columns of sales table, and customer name, customer 
age, product name and category are in the same result set */

select c.customer_name,c.age,sp.* 
from customer as c
right join (select s.*, p.product_name, p.category
		   from sales as s
		   left join product as p
		   on s.product_id=p.product_id) as sp
on c.customer_id = sp.customer_id;

/* VIEWS */

create view logistics as
select a.order_line, a.order_id, b.customer_name, b.city, b.country
from sales as a
left join customer as b
on a.customer_id = b.customer_id
order by order_line;

select * from logistics;

drop view logistics;

/* INDEX */

create index mon_idx
on month_values(MM);

drop index mon_idx;

/* To create a View which contains order_line, Product_id, sales and discount 
value of the first order date in the sales table and name it as “Daily_Billing” */

create view Daily_Billing as 
select order_line, product_id, sales, discount from sales where order_date in (select max(order_date) from sales);

/* To drop the view I created above */
drop view Daily_Billing;

/* To find the earliest order date */

select min(order_date) from sales;	--2014-01-03

--Concatenate

select customer_name, city||', '||state||', '||country as address
from customer;

--String Aggregator

select * from sales;

select order_id, string_agg(product_id,', ')
from sales
group by order_id
order by order_id;

--To find Maximum length of characters in the Product name string from Product table

select product_name, length(product_name) as length_product_name from product
order by length_product_name desc;

select max(length(product_name)) from product;	--127

/* To retrieve product name, sub-category and category from Product table and an 
additional column named “product_details” which contains a concatenated string of 
product name, sub-category and category */

select product_name, sub_category, category, product_name||', '||sub_category||', '||category as product_details
from product;

select * from product;

--Substring

/* To take out the three parts composing the product_id
in three different columns */

select product_id,
substring(product_id for 3) as first_part,
substring(product_id from 5 for 2) as second_part,
substring(product_id from 8) as third_part
from product;

--To list down comma separated product name where sub-category is either Chairs or Tables

select string_agg(product_name,',') from product where sub_category in ('Chairs', 'Tables');

--CEIL & FLOOR (Approximation)

select order_line,
		sales,
		ceil(sales),
		floor(sales)
from sales
where discount > 0;

--Random
/* a = 10
   b = 50 */
   
select random(), random()*40+10, floor(random()*40+10);

--SEED

select setseed(0.5);
select random(); --0.98516771
select random(); --0.82530185

select setseed(0.5);

select random();
select random();

/* ROUND */

select order_line,
		sales,
		round(sales)
from sales
order by sales desc;

--POWER

select age, power(age, 2) from customer;

select * from sales;

--To pick a list of 5 Lucky customers from customer table using random function

select customer_id, sales, random() as rand_n from sales where sales < 5 order by rand_n limit 5;

/*Question
	Suppose you cannot charge the customer in fraction points. So, for sales value of 1.63, 
you will get either 1 or 2. In such a scenario, find out
a) Total sales revenue if you are charging the lower integer value of sales always
b) Total sales revenue if you are charging the higher integer value of sales always
c) Total sales revenue if you are rounding-off the sales always */

--Solution
select sum(ceil(sales)) as higher_int_sales, sum(floor(sales)) as lower_int_sales, sum(round(sales)) as round_int_sales from sales;

--DATE

select current_date, current_time, current_time(1), current_time(3), current_timestamp;

select age(current_date,'2003-05-26');

select order_line,
	ship_date,
	order_date,
	age(ship_date, order_date) as time_taken
from sales
order by time_taken desc;

/* To find out the current age of “Batman” who was born on “April 6, 1939” in Years, months and days */

select age(current_date, '1939-04-06') as batman_age;	--84 years 11 months 18 days

select * from sales;

--To find out the monthly sales of sub-category chair

select extract(month from order_date) as month_n, sum(sales) as total_sales from sales
where product_id in (select product_id from product where sub_category = 'Chairs')
group by month_n order by month_n;

--COALESCE

create table emp_name (
s_no int,
first_name varchar(255),
middle_name varchar(255),
last_name varchar(255));
	
truncate table emp_name;
	
insert into emp_name (s_no, first_name, middle_name, last_name) values (1, 'Paul', 'Van', 'Hugh');
insert into emp_name (s_no, first_name, last_name) values (2, 'David', 'Flashing');
insert into emp_name (s_no, middle_name, last_name) values (3, 'Lena', 'Radford');
insert into emp_name (s_no, first_name, last_name) values (4, 'Henry', 'Goldwyn');
insert into emp_name (s_no, last_name) values (5, 'Holden');
insert into emp_name (s_no, first_name, middle_name, last_name) values (6, 'Erin', 'T', 'Mall');

select * from emp_name;

select *, coalesce(first_name, middle_name, last_name) as name_corr,
concat(first_name, middle_name, last_name) from emp_name;

/*CONVERSION*/

select sales, 'Total sales value for this order is  '||to_char(sales,'$9,999.99') as message
														from sales;

select order_date, to_char(order_date,'Month Day YYYY') from sales;

select to_date('2019/01/15','YYYY/MM/DD');

select to_number('2045.876','9999.999');
select to_number('$2,045.876','L9,999.999');

/*Access Control*/

--To create a new user

create user nelly
with password '0705';

--To grant permissions to a user

grant SELECT, INSERT, UPDATE, DELETE on product to nelly;

--To revoke the 'delete' permission

revoke delete on product from nelly;

--To drop the user

drop user nelly;

--To revoke all the granted permissions

revoke all on product from nelly;

select * from pg_user;

select distinct * from pg_stat_activity;

--To create a new tablespace

create tablespace NewSpace location 'C:\Program Files\PostgreSQL\16\data\Storage';

create table customer_test (i int) tablespace NewSpace;

select * from pg_tablespace;

select * from customer_20_60;

truncate table customer_20_60;

/*Explain*/

explain select * from customer;

explain select distinct * from customer;
