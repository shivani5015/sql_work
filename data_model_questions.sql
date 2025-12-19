#Data Model
use world;
select * from city;
select * from country;
describe city;
#code id pk
select count(code),count(distinct code) from country;
#city id(pk) countrycode is the (fk)
select c.id,c.name ,countrycode , cnt.name,cnt.continent from city as c 
join country as cnt where  c.countrycode =cnt.code;

#Q find city name population country name along with govform for each city 
select * from city;
select * from country;
select c.name, c.population , cnt.name , cnt.governmentform from city as c join country as cnt where c.countrycode = cnt.code;

#Q write the country nmae it spopulation and the language spoke with the percent of each language
select cnt.name, cnt.population , cl.language,cl.percentage from country as cnt join countrylanguage as cl  where cnt.code = cl.countrycode;



