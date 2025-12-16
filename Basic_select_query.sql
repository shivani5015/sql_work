use world;
show tables;
describe country;
select * from country;
select* from country where Continent='North America';
select* from country where Continent='Europe';
-- how we can write using in operator
select * from country where Continent in('North America', 'Europe','Asia');
select  Name , Continent, indepyear from country where indepyear in(1901,1960);
-- not in 
select  Name , Continent, indepyear from country where indepyear not in(1901,1960);
-- between (range value)
select  Name , Continent, indepyear from country where indepyear between 1901 and 1960;
-- not between
select  Name , Continent, indepyear from country where indepyear not  between 1901 and 1960; 








