USE olympics;

--1)

ALTER TABLE person ADD COLUMN total_medals INTEGER NOT NULL DEFAULT 0;



--2)
UPDATE person,
    (SELECT person.id as id , count(competitor_event.medal_id) as medal_counter
    FROM person 
    INNER JOIN competitor_event ON competitor_event.competitor_id = person.id
    WHERE competitor_event.medal_id = 1 OR 2 OR 3
    GROUP BY id) as keep
SET person.total_medals = keep.medal_counter
WHERE person.id = keep.id//

--3) 


WITH argentinos as(
SELECT person.full_name as name, keep.region as region, person.id as id
FROM (SELECT person_region.person_id as reg_per_id , noc_region.region_name as region
        FROM person_region
        INNER JOIN noc_region ON  noc_region.id = person_region.region_id
        WHERE noc_region.region_name= 'Argentina')as keep
INNER JOIN person ON person.id = keep.reg_per_id)

SELECT argentinos.name as Nombres, count(medal_id=1)as bronce, count(medal_id=2) as silver, count(medal_id=3) as oro
FROM argentinos
INNER JOIN competitor_event ON argentinos.id = competitor_event.competitor_id
GROUP BY Nombres;

--4)
    

WITH argentinos as(
SELECT person.full_name as name, keep.region as region, person.id as id
FROM (SELECT person_region.person_id as reg_per_id , noc_region.region_name as region
        FROM person_region
        INNER JOIN noc_region ON  noc_region.id = person_region.region_id
        WHERE noc_region.region_name= 'Argentina')as keep
INNER JOIN person ON person.id = keep.reg_per_id)

SELECT event_id as deportes, count(medal_id) as total_medallas
FROM argentinos
INNER JOIN competitor_event ON argentinos.id = competitor_event.competitor_id
GROUP BY deportes;


--5)
WITH deportistas_pais as(
SELECT person.full_name as name, keep.region as region, person.id as id
FROM (SELECT person_region.person_id as reg_per_id , noc_region.region_name as region
        FROM person_region
        INNER JOIN noc_region ON  noc_region.id = person_region.region_id)as keep
INNER JOIN person ON person.id = keep.reg_per_id)

SELECT deportistas_pais.region as regiones, count(medal_id=1)as bronce, count(medal_id=2) as silver, count(medal_id=3) as oro
FROM deportistas_pais
INNER JOIN competitor_event ON deportistas_pais.id = competitor_event.competitor_id
GROUP BY regiones//

--6)

WITH deportistas_pais as(
SELECT person.full_name as name, keep.region as region, person.id as id
FROM (SELECT person_region.person_id as reg_per_id , noc_region.region_name as region
        FROM person_region
        INNER JOIN noc_region ON  noc_region.id = person_region.region_id)as keep
INNER JOIN person ON person.id = keep.reg_per_id)

(SELECT deportistas_pais.region as regiones, count(medal_id) as medallas
FROM deportistas_pais
INNER JOIN competitor_event ON deportistas_pais.id = competitor_event.competitor_id
GROUP BY regiones ORDER BY medallas DESC LIMIT 1)

UNION
(SELECT deportistas_pais.region as regiones, count(medal_id) as medallas
FROM deportistas_pais
INNER JOIN competitor_event ON deportistas_pais.id = competitor_event.competitor_id
GROUP BY regiones ORDER BY medallas ASC LIMIT 1)//




--7)
CREATE TRIGGER increase_number_of_medals AFTER INSERT
ON competitor_event
REFERENCING NEW ROW as nrow
FOR EACH ROW
UPDATE person SET total_medals = total_medals +1
WHERE person.id = nrow.competitor_id


CREATE TRIGGER increase_number_of_medals AFTER DELETE
ON competitor_event
REFERENCING OLD ROW as orow
FOR EACH ROW
UPDATE person SET total_medals = total_medals -1
WHERE person.id = orow.competitor_id



--8)

CREATE PROCEDURE add_new_medalist (IN id_event INT,IN g_id INT, IN s_id INT, IN b_id INT)
INSERT INTO  competitor_event (event_id,competitor_id,medal_id)
VALUES (id_event,g_id,1), (id_event,s_id,2), (id_event,b_id,3);




--9)
CREATE ROLE organizer;
GRANT DELETE  ON games TO organizer;
GRANT UPDATE (games_name) ON games TO organizer;





