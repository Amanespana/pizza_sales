SELECT * FROM pizza_sales.pizza_types;
SELECT count(*) FROM pizza_sales.pizza_types;
select count(distinct(pizza_type_id)) FROM pizza_sales.pizza_types;
select distinct(category) FROM pizza_sales.pizza_types;
select ingredients from pizza_sales.pizza_types;
select category, count(category), count(category)*100/32 as contribution from pizza_sales.pizza_types group by category;
