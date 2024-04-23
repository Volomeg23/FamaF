USE world;

--1)
SELECT city.Name, country.Name , country.Region, country.GovernmentForm 
FROM city 
LEFT JOIN country ON country.Code = city.CountryCode 
ORDER BY city.Population DESC LIMIT 10;
--2)
SELECT country.Name, city.Name, country.Population 
FROM country 
LEFT JOIN city On city.ID = country.Capital 
ORDER BY country.Population ASC LIMIT 10;  
--3)
SELECT country.Name, country.Continent, countrylanguage.Language, countrylanguage.IsOfficial 
FROM country 
JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.IsOfficial = 'T';
--USO INNER JOIN PARA SACAR LOS NULLS
--4)
SELECT country.Name, city.Name, country.SurfaceArea 
FROM country 
LEFT JOIN city ON country.Capital = city.ID 
ORDER BY SurfaceArea DESC LIMIT 20;
--5)
SELECT city.Name, countrylanguage.Language, countrylanguage.IsOfficial, countrylanguage.Percentage, city.Population  
FROM city 
LEFT JOIN countrylanguage 
ON countrylanguage.CountryCode = city.CountryCode AND countrylanguage.IsOfficial = 'T' 
ORDER BY city.Population,countrylanguage.Percentage ASC;
--primero se ordena por poblacion y si tienen la misma se desempata por el porcentaje
--6)
(
    SELECT Name,Population 
    FROM country 
    ORDER BY Population DESC LIMIT 10
)
    UNION
(
    SELECT Name,Population 
    FROM country
    WHERE Population > 100
    ORDER BY Population ASC LIMIT 10
);
SELECT * FROM 
--7)
(
    SELECT country.Name
    FROM country
    INNER JOIN countrylanguage
    ON countrylanguage.CountryCode = country.Code
    WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T'
)
    INTERSECT
(
    SELECT country.Name 
    FROM country
    INNER JOIN countrylanguage
    ON countrylanguage.CountryCode = country.Code
    WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T'
);
--8)
(
    SELECT country.Name
    FROM country
    INNER JOIN countrylanguage
    ON countrylanguage.CountryCode = country.Code
    WHERE countrylanguage.Language = 'English'
)
    EXCEPT
(
    SELECT country.Name 
    FROM country
    INNER JOIN countrylanguage
    ON countrylanguage.CountryCode = country.Code
    WHERE countrylanguage.Language = 'Spanish'
);

/*

PREGUNTAS 1) SI, el inner join garantiza que los elementos de una tabla cumplan la condicion y el where se fija la misma condicion en el elemento que cumplio la condicion de On

2) NO, ya que left join va a fijarse que se cumpla la condicion en una de las tablas y si no hay ningun elemento que cumpla la condicion pasa como Null y el where no permite que se agreguen elmentos que no cumplan la condicion
    



