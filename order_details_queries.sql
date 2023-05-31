SELECT * FROM pizza_sales.order_details;

SELECT count(*) FROM pizza_sales.order_details;

select distinct(quantity) from pizza_sales.order_details;

select * from pizza_sales.order_details where order_id = 2;

select * from pizza_sales.order_details group by order_id;

select count(distinct(order_details.order_id)) from pizza_sales.order_details;

select order_details.order_details_id, order_details.order_id, order_details.pizza_id, order_details.quantity, pizzas.size, pizzas.price  from pizza_sales.order_details left join pizza_sales.pizzas on pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id;

select order_details.order_details_id, order_details.order_id, order_details.pizza_id, order_details.quantity, pizzas.size, pizzas.price, orders.date, month(date) as start_month
from pizza_sales.order_details left join pizza_sales.pizzas on pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id 
left join pizza_sales.orders on pizza_sales.order_details.order_id = pizza_sales.orders.order_id;

select order_details.order_details_id, order_details.order_id, order_details.pizza_id, order_details.quantity, pizzas.size, pizzas.price, pizzas.pizza_type_id
from pizza_sales.order_details left join pizza_sales.pizzas on pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id;

select pizzas.pizza_type_id, sum(order_details.quantity), sum(order_details.quantity)*100/49574 as percentage
from pizza_sales.order_details left join pizza_sales.pizzas on pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id
group by pizzas.pizza_type_id;

select sum(quantity) from pizza_sales.order_details;

-- comparison for no. of orders by category
select pizza_types.category, sum(order_details.quantity), sum(order_details.quantity)*100/49574 as percentage
from pizza_sales.order_details left join pizza_sales.pizzas on pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id 
left join pizza_sales.pizza_types on pizza_sales.pizzas.pizza_type_id = pizza_sales.pizza_types.pizza_type_id
group by pizza_types.category; 

-- comparison for revenue by category

select category, round(sum(quantity*price), 2) as revenue, sum(quantity) as Total_Quantity, round(avg(price), 2) as avg_price
from pizza_sales.order_details left join pizza_sales.pizzas on pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id 
left join pizza_sales.pizza_types on pizza_sales.pizzas.pizza_type_id = pizza_sales.pizza_types.pizza_type_id
group by category;

select price, sum(quantity) as Total_Quantity
from pizza_sales.order_details left join pizza_sales.pizzas on pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id 
left join pizza_sales.pizza_types on pizza_sales.pizzas.pizza_type_id = pizza_sales.pizza_types.pizza_type_id
where category = 'Veggie'
group by price;

select sum(pizza_sales.order_details.quantity*pizza_sales.pizzas.price) as total_revenue
from pizza_sales.order_details left join pizza_sales.pizzas on pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id; 

-- comparison by pizza size

select pizza_sales.pizzas.size, sum(pizza_sales.order_details.quantity*pizza_sales.pizzas.price) as total_revenue
from pizza_sales.order_details left join pizza_sales.pizzas on pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id
group by pizza_sales.pizzas.size; 

-- table created for daily sales data
create table daily_sales select pizza_sales.orders.date, sum(pizza_sales.order_details.quantity*pizza_sales.pizzas.price) as sales
from pizza_sales.order_details left join pizza_sales.orders on pizza_sales.order_details.order_id = pizza_sales.orders.order_id
left join pizza_sales.pizzas on pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id
group by pizza_sales.orders.date; 

select * from daily_sales;
select count(distinct(order_details.order_id)) from pizza_sales.order_details;

select order_details.order_id, count(order_details.quantity) from pizza_sales.order_details group by order_details.order_id;

select order_details.order_id, count(order_details.quantity) as pizza_quantity, orders.date, month(date) as start_month
from pizza_sales.order_details
left join pizza_sales.orders on pizza_sales.order_details.order_id = pizza_sales.orders.order_id
group by order_details.order_id; 

-- average no/ of pizzas order per day

select sum(order_details.quantity) as pizza_quantity, month(date) as start_month, day(last_day(date)) as num_of_days, sum(order_details.quantity)/day(last_day(date)) as avg_pizzas_order_per_day
from pizza_sales.order_details
left join pizza_sales.orders on pizza_sales.order_details.order_id = pizza_sales.orders.order_id
group by start_month; 

-- average no. of orders per day
select count(distinct(order_details.order_id)) as order_count, month(date) as start_month, day(last_day(date)) as num_of_days, count(distinct(order_details.order_id))/day(last_day(date)) as avg_num_orders_per_day
from pizza_sales.order_details
left join pizza_sales.orders on pizza_sales.order_details.order_id = pizza_sales.orders.order_id
group by start_month; 

select *
from pizza_sales.order_details
left join pizza_sales.orders on pizza_sales.order_details.order_id = pizza_sales.orders.order_id; 

SELECT *, sum(quantity) over (partition by order_id) as total FROM pizza_sales.order_details;