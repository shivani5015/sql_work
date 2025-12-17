use sakila;
show tables;
select * from payment;
#count this value payment
select count(*) from payment where amount=2.99;
#harek amount ka total count
select amount, count(*) from payment group by amount;
#1 customer kitna amount pay kiya
select customer_id, sum(amount) from payment group by customer_id;
#total amout speny by each customer but amount should greater>3.
select customer_id, sum(amount) from payment  where amount>3 group by customer_id;
#total transaction done by each customer done in may
select customer_id, count(amount) from payment where month(payment_date)=5 group by customer_id;
#Q-find the max amount of transaction the avg trancsaction amount and the total trans amount done through each staff 
select staff_id, avg(amount), max(amount),sum(amount)  from payment group by staff_id;
#Q-find the max amount of transaction the avg trancsaction amount and the total trans amount done through each staff only for even no  customer
select staff_id, avg(amount), max(amount),sum(amount)  from payment where customer_id%2=0 group by staff_id;
#Q- get the amount and total trans done for ech amount only for payments done throgh staff id 1 and total transaction should be > then 30
select amount , count(amount) from payment where staff_id=1 group by amount having   count(amount)>30;
#Q-find out the no of customers avg amount and the total amount spend in each month for staff id 1,2 
select extract(month from payment_date),count(customer_id),avg(amount),sum(amount) from payment where staff_id=1 or staff_id=2 group by extract(month from payment_date);
#Q for each yera each month 
select extract(year from payment_date),extract(month from payment_date),count(customer_id),avg(amount),sum(amount) from payment where staff_id=1 or staff_id=2 group by extract(month from payment_date) , extract(year from payment_date);
#ORDER BY 
select * from payment order by amount;



 







