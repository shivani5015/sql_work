#use sakila;
#select * from customer;
#Qcase question
select customer.customer_id,concat(first_name , " ",last_name)as customer_name ,sum(amount) as total_payment ,case
when sum(amount)<50 then "low splender"
when sum(amount) between 50 and 100 then "Medium"
else "high"
end as spending_category
 from customer join payment on customer.customer_id =payment.customer_id group by customer_id,customer_name;
 
#for how many times film has been rented 
SELECT 
    f.title, 
    COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY rental_count DESC;

#self join
#list pair of customers who belongs to same store


SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(p.amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(amount) AS customer_total
        FROM payment
        GROUP BY customer_id
    ) AS subquery
)
ORDER BY total_spent DESC;

 
 
 