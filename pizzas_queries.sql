SELECT * FROM pizza_sales.pizzas;
SELECT count(*) FROM pizza_sales.pizzas;
select distinct(price) FROM pizza_sales.pizzas where size = 'S' order by price asc;
select * from pizza_sales.pizzas where price = 23.65;
select * from pizza_sales.pizzas where pizza_type_id = 'brie_carre';
select distinct(size) from pizza_sales.pizzas;
select max(price) from pizza_sales.pizzas;
select * from pizza_sales.pizzas order by price desc;
select size, count(pizza_id) from pizza_sales.pizzas group by size;
select count(distinct(pizza_type_id)) from pizza_sales.pizzas;
select count(distinct(pizza_type_id)) from pizza_sales.pizzas;
