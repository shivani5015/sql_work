use world;
select * from country;
select Name, Code, Region from country where Region <> 'Middle East';
 select name ,indepyear, Population, Population*0.1+Population from country;
 select * from country where LifeExpectancy between 38.3 and 66.4;
 select name,continent, population,GNP from country where population not in (5000 , 20000);
 
 -- like operator
 select name , continent, population from country where name like 'a%';
  select name , continent, population from country where name like '%a';
 select name , continent, population from country where name like '%a%';  
 
-- underscore(_) -> 1 character
select name from country where name like'IR__';