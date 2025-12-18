use world;
select * from country;
-- function and date
-- round
 select 83.62,round(83.62);
  select 83.62,round(83.762,2);
  select (456.23) , round(276.23,-2);
  -- truncate
select 456.67 , round(456.67),truncate(456.87,1);
-- mod
select 456.67 , round(456.67),truncate(456.87,1), mod(43.6,3);
-- pow : power
select pow(2,3);
-- ceil
select ceil(3.000008);
-- floor
 select floor(3.000008);
 
 -- DATE
-- inbuilt date yh time print krna
-- now()
select now();
-- curdate()
select curdate();
-- current_timestamp()
select current_timestamp();
-- current_time()
select current_time();
-- adddate()
select now() ,adddate(now(),2);
select now() ,adddate(now(),-2);
-- subdate()
select now() ,subdate(now(),2);
-- interval()
select now(), adddate(now(), interval 3 month);
 select now(), year(now());
  select now(), month(now());
  -- extract()
  select now(), extract(year from now());
select now(), extract(month from now());
-- date_formate() time_format()
select now() ,date_format(now(),'month is %M and year is %Y');

-- distinct()
select * from country;
select distinct(Continent) from country;

-- count()
select  count(name) from country;

select count(name) ,count(distinct(Continent)) from country;