use sakila;
select * from actor;
select * from film_actor;

select fa.film_id,fa.actor_id,f.film_id,f.title from film_actor as fa join film as f where fa.film_id = f.film_id ;
select * from film;
select * from film_actor;
select * from actor;
#what are inner,outer,types of outer  join 
select * from payment where amount =(select amount from payment where payment_id=5);

#get paymnt id and amountb where amount not = payement id23
SELECT payment_id, amount FROM payment WHERE amount NOT IN (SELECT amount FROM payment WHERE payment_id = 23);

#get pid, cid, amount , date where month of payment should same as of pid =6
select * from payment where month(payment_date)=(select month(payment_date) from payment  where payment_id=6);

#get * columns from payment where the staff surving the customer should be same as of payment id 7
select * from payment where staff_id =(select staff_id from payment where payment_id=7);

#get * payment info where amount is same as of the higest amount from paymnet table 
select * from payment where amount=(select max(amount) from payment);

# get the month and total amount spend only for those customer whose month of payment >cusid 1 and paymentid3
select month(payment_date),sum(amount) from payment where month(payment_date)>(select month(payment_date) from payment where customer_id=1 and payment_id=3) group by month(payment_date);

#get the amount and total no of payment done of each amount only for those payments whose amount is less then the amount of rentalid 1725;
select amount , count(amount) from payment where amount<(select amount from payment where rental_id=1725)group by amount;