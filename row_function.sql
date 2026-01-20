#USE window_fn_practice;
#select * from employees;
#select *,sum(salary) over(),sum(salary) over(partition by department),sum(salary) over(partition by department,city) from employees;

#over with order by,running sum of salary
#select *,sum(salary) over(order by salary) from employees;
#row number
select * , row_number() over() from  employees;
#partion by dep
select * , row_number() over(partition by department) from  employees;
#according to date
select * , row_number() over(partition by department order by hire_date) from  employees;
#rank = give you ranking if rank is share then rank will skip
select *, rank() over(order by salary) from employees;
#rank dense rank row number

