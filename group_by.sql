#Truncate=ddl stattement only used to delete the data
#create table actor_cp as select first_name ,last_name from sakila.actor where actor_id between 10 and 14;
#select * from actor_cp;
#in truncate wev do not provide any condition but in delete we give condition
#in truncate we cannot revert (rollback) /undo but in delete we can rollback in case if we execulted any ddl statemnet we cant rollback 
#object are the structure that is used to store mange and refer the data
#view-object 
#alter is used to chnage the structure
#Dml = insert the date in object
#drop vs delete vs truncate
#windows function it apply aggregate function to each row 
#use world;
#select code,name,population from country;
select code,name,continent,population,sum(population) over() from country;
select code,name,continent,population,sum(population) over(partition by continent) from country;
#running sum and cummalative sum
#use order by
select code,name,continent,population,sum(population) over(order by population) from country;

