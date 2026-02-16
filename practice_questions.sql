use world;
#country name , continent name find 2 highest population of each country and each continent
#select continent,name from country where population= (select max(population) from country where population<(select max(population) from country));
WITH RankedCountries AS (
    SELECT 
        continent, 
        name, 
        population,
        ROW_NUMBER() OVER (PARTITION BY continent ORDER BY population DESC) as pop_rank
    FROM world.country
)
SELECT 
    continent, 
    name, 
    population
FROM RankedCountries
WHERE pop_rank = 2
ORDER BY continent;

#Display the Name, Continent, and Population of every country. Add a column called PopRank that ranks countries by population within their own continent
select name,continent,population, dense_rank()over(partition by continent order by population desc ) as poprank from world.country;

#For countries in 'South America', list the Name and SurfaceArea. Add a column that shows the cumulative (running) sum of the surface area as you move alphabetically through the country names.
SELECT Name, SurfaceArea,SUM(SurfaceArea) OVER (ORDER BY Name) AS Cumulative_Area FROM world.country WHERE Continent = 'South America';

#Find all countries whose LifeExpectancy is higher than the average life expectancy of the entire world.
select * from world.country where LifeExpectancy>(select avg(LifeExpectancy) from world.country );

#List the names of all countries that speak 'French' as an official language (Hint: You’ll need to subquery the countrylanguage table).
select name from world.country where name in (select name from world.countrylanguage where language='French' and IsOfficial='T');

#Find the name of the city with the largest population for each country. (Match city.CountryCode with country.Code).
SELECT Name, Population, CountryCode FROM city c1 WHERE Population = (SELECT MAX(Population) FROM city c2 WHERE c2.CountryCode = c1.CountryCode);