USE world;

--1)
SELECT city, country, Population
FROM(
    SELECT city.Name as city, country.Name as   country, country.Population as Population
    FROM city 
    LEFT JOIN country ON country.Code = city.CountryCode 
    )as ej1 WHERE Population > 10000 ORDER BY Population DESC;
-- Agregar as ej1 como alias de la tabla
--2)

    SELECT Name,Population
    FROM city
    WHERE Population > ALL (
        SELECT avg(Population) as Population
        FROM city
        )ORDER BY Population DESC;
--cuidado de que la subquery debe retornar una sola columna   

--3)
SELECT city.Name as Name, country.Name as Country, country.Continent as Continent, city.Population as Population     
FROM city     
INNER JOIN country ON country.Code = city.CountryCode  
WHERE Continent != 'Asia' AND Population >=(SELECT MIN(Population) FROM country WHERE Continent = 'Asia');

--4)
SELECT country.Name as Country, countrylanguage.Language as Language
FROM country INNER JOIN countrylanguage On countrylanguage.CountryCode = country.Code
WHERE isOfficial = 'F' AND countrylanguage.Percentage > (SELECT max(Percentage)
                                                         FROM countrylanguage
                                                         WHERE countrylanguage.IsOfficial = 'T' 
                                                         AND countrylanguage.CountryCode=country.Code);

--5)
SELECT DISTINCT Region, Name, SurfaceArea
FROM country
WHERE SurfaceArea > 1000 AND EXISTS ( SELECT Name, Population
                                    FROM city
                                    WHERE Population > 100000) ORDER BY SurfaceArea DESC; 
)

--6)
WITH table_xd as 
(SELECT city.Name as city, country.Name as   country, city.Population as Population     
FROM city      
LEFT JOIN country ON country.Code = city.CountryCode 
) 
SELECT country, max(Population) as max_pop_by_city  
FROM table_xd 
GROUP BY country;
-- debe ser con query escalar ya que el group by nos restringe de selecionar campos extras que no infieren en la agrupacion, hacer una operacion lo permite(avg,sum,max,etc), pero si tomamos todos los valores que puede tener, osea no tenemos una operacion, el group by no va saber como agrupara todos los valores que puede tener, 
--7)
SELECT country.Name as Country, countrylanguage.Language as Language
FROM country INNER JOIN countrylanguage On countrylanguage.CountryCode = country.Code
WHERE isOfficial = 'F' AND countrylanguage.Percentage > (SELECT avg(Percentage)
                                                         FROM countrylanguage
                                                         WHERE countrylanguage.IsOfficial = 'T' 
                                                         AND countrylanguage.CountryCode=country.Code);

--8) 
WITH sum_per_continent as(
SELECT Continent, sum(Population) as all_pop
FROM country
GROUP BY Continent)
SELECT * FROM sum_per_continent ORDER BY all_pop DESC;

--9)
WITH life as(
SELECT Continent, avg(LifeExpectancy) as life_quality
FROM country
GROUP BY Continent)
SELECT * FROM life 
WHERE life_quality BETWEEN 40 AND 70

--10)

SELECT Continent, sum(Population) as all_pop, avg(Population) as avg_pop, min(Population) as min_pop, max(Population) as max_pop
FROM country
GROUP BY Continent


