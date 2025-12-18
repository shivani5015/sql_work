use world;
select * from country;
select * from country ;
select Name , Continent , Region from country where Continent not like ('Europe');
select Name , Continent , Region from country where Region like '_a%';
select Name , Continent , Region from country where Continent like '%i___';
select Name , Continent , Region from country where Continent like '_____%';
select Name , Continent , Region from country where Continent like '_c%i_';
select Name , Continent , Region from country where name like '%a_a%';