--1)Listar todas las ciudades sede de los juegos olímpicos de verano junto con su año, de más reciente a menos reciente (1p)

SELECT games.games_year AS año, city.city_name as sede
FROM `games`
INNER JOIN `games_city` ON games.id = games_city.games_id
INNER JOIN `city` ON games_city.city_id = city.id
WHERE games.season = "Summer"
ORDER BY año DESC;

--2)Obtener el ranking de los 10 países con más medallas de oro en fútbol (1.5p)

SELECT noc_region.region_name AS country, COUNT(*) AS medal_count
FROM `competitor_event`
INNER JOIN `games_competitor` ON competitor_event.competitor_id = games_competitor.id
INNER JOIN `person` ON person.id = games_competitor.person_id
INNER JOIN `person_region` ON person.id = person_region.person_id
INNER JOIN `noc_region` ON noc_region.id = person_region.region_id
INNER JOIN `medal` ON competitor_event.medal_id = medal.id
INNER JOIN `event` ON competitor_event.event_id = event.id
WHERE competitor_event.medal_id IS NOT NULL
    AND competitor_event.medal_id = 1
    AND event.event_name REGEXP "Football$"
--usar el event_name me da el mismo resultado que usar sport_name, dejo la otra version por las dudas
GROUP BY country
ORDER BY medal_count DESC
LIMIT 10;

SELECT noc_region.region_name AS country, COUNT(*) AS medal_count
FROM `competitor_event`
INNER JOIN `games_competitor` ON competitor_event.competitor_id = games_competitor.id
INNER JOIN `person` ON person.id = games_competitor.person_id
INNER JOIN `person_region` ON person.id = person_region.person_id
INNER JOIN `noc_region` ON noc_region.id = person_region.region_id
INNER JOIN `medal` ON competitor_event.medal_id = medal.id
INNER JOIN `event` ON competitor_event.event_id = event.id
INNER JOIN `sport` ON event.sport_id = sport.id
WHERE competitor_event.medal_id IS NOT NULL
    AND competitor_event.medal_id = 1
    AND sport.sport_name = "Football"
GROUP BY country
ORDER BY medal_count DESC
LIMIT 10;

--3)Listar con la misma query el país con más participaciones y el país con menos participaciones en los juegos olímpicos (2p)

(SELECT noc_region.region_name AS country, COUNT(sport.sport_name) as participaciones
FROM `competitor_event`
INNER JOIN `games_competitor` ON competitor_event.competitor_id = games_competitor.id
INNER JOIN `person` ON person.id = games_competitor.person_id
INNER JOIN `person_region` ON person.id = person_region.person_id
INNER JOIN `noc_region` ON noc_region.id = person_region.region_id
INNER JOIN `medal` ON competitor_event.medal_id = medal.id
INNER JOIN `event` ON competitor_event.event_id = event.id
INNER JOIN `sport` ON event.sport_id = sport.id
GROUP BY country
ORDER BY participaciones DESC
LIMIT 1)
UNION
(SELECT noc_region.region_name AS country, COUNT(sport.sport_name) as participaciones
FROM `competitor_event`
INNER JOIN `games_competitor` ON competitor_event.competitor_id = games_competitor.id
INNER JOIN `person` ON person.id = games_competitor.person_id
INNER JOIN `person_region` ON person.id = person_region.person_id
INNER JOIN `noc_region` ON noc_region.id = person_region.region_id
INNER JOIN `medal` ON competitor_event.medal_id = medal.id
INNER JOIN `event` ON competitor_event.event_id = event.id
INNER JOIN `sport` ON event.sport_id = sport.id
GROUP BY country
ORDER BY participaciones ASC
LIMIT 1);

--4)Crear una vista en la que se muestren entradas del tipo (país, deporte, medallas de oro, medallas de plata, medallas de bronce, participaciones sin medallas) para cada país y deporte (2.5p)
CREATE VIEW `medallas_mundiales` AS 
SELECT noc_region.region_name AS country ,sport.sport_name as deporte, COUNT(competitor_event.medal_id = 1) AS oro,COUNT(competitor_event.medal_id = 2) AS plata, COUNT(competitor_event.medal_id = 3) AS bronce, COUNT(competitor_event.medal_id = 1) AS nada
FROM `competitor_event`
INNER JOIN `games_competitor` ON competitor_event.competitor_id = games_competitor.id
INNER JOIN `person` ON person.id = games_competitor.person_id
INNER JOIN `person_region` ON person.id = person_region.person_id
INNER JOIN `noc_region` ON noc_region.id = person_region.region_id
INNER JOIN `medal` ON competitor_event.medal_id = medal.id
INNER JOIN `event` ON competitor_event.event_id = event.id
INNER JOIN `sport` ON event.sport_id = sport.id
WHERE competitor_event.medal_id IS NOT NULL
GROUP BY country, medal.id, sport.id
ORDER BY country;

--5)Crear un procedimiento que reciba como parámetro el nombre de un país y devuelva la cantidad total (sumando todos los deportes) de medallas de oro, plata y bronce ganadas por ese país.

DELIMITER //
CREATE PROCEDURE `total_por_pais`(IN pais VARCHAR(50))
    BEGIN
        SELECT noc_region.region_name AS country, COUNT(*) AS medal_count
        FROM `competitor_event`
        INNER JOIN `games_competitor` ON competitor_event.competitor_id = games_competitor.id
        INNER JOIN `person` ON person.id = games_competitor.person_id
        INNER JOIN `person_region` ON person.id = person_region.person_id
        INNER JOIN `noc_region` ON noc_region.id = person_region.region_id
        INNER JOIN `medal` ON competitor_event.medal_id = medal.id
        INNER JOIN `event` ON competitor_event.event_id = event.id
        WHERE competitor_event.medal_id IS NOT NULL 
        AND noc_region.region_name = pais
        AND competitor_event.medal_id != 4
        GROUP BY country; 
    END;
//
DELIMITER ;

--TEST
CALL total_por_pais("Argentina")

--6)--Actualizar la tabla `event` para que tenga una columna `sport_name` con el nombre del deporte. Además introducir el nombre de deporte correspondiente (1p)
--Eliminar la columna `sport_id` de la tabla `event` (0.25p)
--Eliminar la tabla `sport` (0.25p)

--a)
ALTER TABLE `event`
ADD `sport_name` VARCHAR(100) DEFAULT NULL;

CREATE VIEW `sportsNames` AS 
SELECT sport.id AS pid, sport.sport_name as deporte
FROM `sport`; 

UPDATE `event`, `sportsNames`
SET event.sport_name = sportsNames.deporte
WHERE event.sport_id = sportsNames.pid;

--b)
ALTER TABLE `event` DROP COLUMN `sport_id`;


--c)
DROP TABLE `sport`;

