-- SELECT * FROM pizza_sales.orders;
-- SELECT count(*) FROM pizza_sales.orders;
-- select * from pizza_sales.orders order by orders.date desc, orders.time desc;
-- select count(distinct(order_id)) from pizza_sales.orders;
-- select * from pizza_sales.orders order by order_id desc;
-- alter table pizza_sales.orders modify column date date;
-- desc pizza_sales.orders;
-- alter table pizza_sales.orders modify column time time;
-- SELECT month(date) as start_month, count(order_id), day(last_day(date)) as num_of_days FROM pizza_sales.orders group by start_month;
-- SELECT *,dayname(date) as week_day FROM pizza_sales.orders;
-- select dayname(date) as week_day, count(order_id) FROM pizza_sales.orders group by week_day;
-- SELECT *, month(date) as start_month FROM pizza_sales.orders;