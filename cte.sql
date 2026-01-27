#use sakila;

#select month(payment_date),count(*) from cte group by month(payment_date);
#select *,month(payment_date) from sakila.payment;
#second highest amount 
#with cte as (select *,dense_rank() over(order by amount desc) as ranking from sakila.payment) select * from cte where ranking=2;
#second highest amount for each customer
#with cte as (select *,dense_rank() over(partition by customer_id order by amount desc) as ranking from sakila.payment) select * from cte where ranking=2;
#corelated query
#select emp_id,emp_name ,department,salary from employee as e where salary>(select avg(salary) from employee where department=e.department);
#Cte 
#with cte as (select department as dept,avg(salary) as dept_salary from employee group by department)
#select emp_id,emp_name,department,salary,dpet,deptsalary from employee as e join cte where e.department=cte.dept and salry>deptsalary;
