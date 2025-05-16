create database Pizza_db;
use pizza_db;
select * from pizza_sales;
-- kpis
select sum(total_price) AS Total_Revenue From pizza_sales;

select sum(total_price) / count(distinct order_id) as avg_order_value from pizza_sales;

select sum(quantity) as total_pizza_sold from pizza_sales;

select count(distinct order_id) as Total_orders from pizza_sales;

select cast(sum(quantity) AS decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as avg_pizzas_per_order from pizza_sales;


--  charts

-- Daily trend
SELECT 
  DATE_FORMAT(STR_TO_DATE(order_date, '%Y-%m-%d'), '%W') AS order_day,
  COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_day;


-- Hourly trend
select hour(order_time) AS order_hours , COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_hours;

select pizza_category , sum(total_price)as total_sales,sum(total_price)*100 / (select sum(total_price) from pizza_sales) AS PCT
from pizza_sales
group by pizza_category;

select pizza_size , sum(total_price)as total_sales,sum(total_price)*100 / (select sum(total_price) from pizza_sales) AS PCT
from pizza_sales
group by pizza_size
order by pct;

select pizza_category,sum(quantity)
 As total_pizzas_sold from pizza_sales 
 group by pizza_category 
 order by total_pizzas_sold;
 
SELECT 
  pizza_name, 
  SUM(quantity) AS total_pizzas_sold 
FROM pizza_sales
WHERE MONTH(STR_TO_DATE(order_date, '%Y-%m-%d')) = 8 -- by using this we can get any month data just putting month number in qurey
GROUP BY pizza_name
ORDER BY total_pizzas_sold DESC
LIMIT 5;



