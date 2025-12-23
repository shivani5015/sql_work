use regex;
select * from customers;
#inner join,join-comman element
#with inner we use on not where
select c.customer_id ,c.customer_name ,o.customer_id ,o.order_id,o.amount from customers as c join orders as o where c.customer_id=o.customer_id;
#left outer join
select c.customer_id ,c.customer_name ,o.customer_id ,o.order_id,o.amount from customers as c left join orders as o on c.customer_id=o.customer_id;
#right join
select c.customer_id ,c.customer_name ,o.customer_id ,o.order_id,o.amount from customers as c right join orders as o on c.customer_id=o.customer_id;
#non matching rows give null
#natural join-no condition define happen on comman column we dont use mainly
select c.customer_id ,c.customer_name ,o.customer_id ,o.order_id,o.amount from customers as c natural join orders as o ;
#crosss join or cartisan join- every row match with every row of another  table 


#find customer id cutomer name total no of movies  actor and film actor
use sakila;
select * from actor;
select * from film_actor;
select a.actor_id ,a.first_name,count(f.film_id) from actor as a join film_actor as f where a.actor_id=f.actor_id group  by a.actor_id,a.first_name;







