-- 1
ALTER TABLE `person`
ADD `total_medals`INT DEFAULT 0;


-- 2
CREATE VIEW `medal_count` AS 
SELECT person.id AS pid, COUNT(*) AS tmed
FROM `person`
INNER JOIN `games_competitor` ON person.id = games_competitor.person_id
INNER JOIN `competitor_event` ON games_competitor.id = competitor_event.competitor_id
WHERE competitor_event.medal_id IS NOT NULL
    AND competitor_event.medal_id != 4
GROUP BY pid;

UPDATE `person`, `medal_count`
SET person.total_medals = medal_count.tmed
WHERE person.id = medal_count.pid;


-- 3
SELECT person.full_name AS pid, COUNT(*) AS tmed, medal.medal_name AS mname
FROM `person`
INNER JOIN `games_competitor` ON person.id = games_competitor.person_id
INNER JOIN `competitor_event` ON games_competitor.id = competitor_event.competitor_id
INNER JOIN `medal` ON competitor_event.medal_id = medal.id
INNER JOIN `person_region` ON person.id = person_region.person_id
INNER JOIN `noc_region` ON person_region.region_id = noc_region.id
WHERE competitor_event.medal_id IS NOT NULL
    AND competitor_event.medal_id != 4
    AND region_name = 'Argentina'
GROUP BY pid, competitor_event.medal_id;


-- 4
SELECT sport.sport_name AS sportname, COUNT(*) AS mcount
FROM `sport`
INNER JOIN `event` ON sport.id = event.sport_id
INNER JOIN `competitor_event` ON competitor_event.event_id = event.id
INNER JOIN `games_competitor` ON competitor_event.competitor_id = games_competitor.id
INNER JOIN `person` ON person.id = games_competitor.person_id
INNER JOIN `person_region` ON person.id = person_region.person_id
INNER JOIN `noc_region` ON noc_region.id = person_region.region_id
WHERE competitor_event.medal_id IS NOT NULL
    AND competitor_event.medal_id != 4
    AND region_name = 'Argentina'
GROUP BY sport_id;


-- 5
SELECT noc_region.region_name AS country, COUNT(*) AS medal_count, medal.medal_name AS medal_type
FROM `competitor_event`
INNER JOIN `games_competitor` ON competitor_event.competitor_id = games_competitor.id
INNER JOIN `person` ON person.id = games_competitor.person_id
INNER JOIN `person_region` ON person.id = person_region.person_id
INNER JOIN `noc_region` ON noc_region.id = person_region.region_id
INNER JOIN `medal` ON competitor_event.medal_id = medal.id
WHERE competitor_event.medal_id IS NOT NULL
    AND competitor_event.medal_id != 4
GROUP BY country, medal.id
ORDER BY country;


-- 6
(
    SELECT noc_region.region_name AS country, COUNT(*) AS medal_count
    FROM `competitor_event`
    INNER JOIN `games_competitor` ON competitor_event.competitor_id = games_competitor.id
    INNER JOIN `person` ON person.id = games_competitor.person_id
    INNER JOIN `person_region` ON person.id = person_region.person_id
    INNER JOIN `noc_region` ON noc_region.id = person_region.region_id
    INNER JOIN `medal` ON competitor_event.medal_id = medal.id
    WHERE competitor_event.medal_id IS NOT NULL
        AND competitor_event.medal_id != 4
    GROUP BY noc_region.id
    ORDER BY medal_count DESC
    LIMIT 1
)
UNION
(
    SELECT noc_region.region_name AS country, COUNT(*) AS medal_count
    FROM `competitor_event`
    INNER JOIN `games_competitor` ON competitor_event.competitor_id = games_competitor.id
    INNER JOIN `person` ON person.id = games_competitor.person_id
    INNER JOIN `person_region` ON person.id = person_region.person_id
    INNER JOIN `noc_region` ON noc_region.id = person_region.region_id
    INNER JOIN `medal` ON competitor_event.medal_id = medal.id
    WHERE competitor_event.medal_id IS NOT NULL
        AND competitor_event.medal_id != 4
    GROUP BY noc_region.id
    ORDER BY medal_count ASC
    LIMIT 1
);


-- 7
CREATE TRIGGER `increase_number_of_medals`
AFTER INSERT ON `competitor_event`
FOR EACH ROW
    UPDATE `person`
    SET total_medals = total_medals + 1
    WHERE person.id = NEW.competitor_id;

CREATE TRIGGER `decrease_number_of_medals`
AFTER DELETE ON `competitor_event`
FOR EACH ROW
    UPDATE `person`
    SET total_medals = total_medals - 1
    WHERE person.id = OLD.competitor_id;

-- trigger test
SELECT id
FROM `person`
WHERE full_name = 'Juan Martn del Potro';

INSERT INTO `competitor_event` (event_id, competitor_id, medal_id)
VALUES (1, 27132, 1);

SELECT *
FROM `person`
WHERE full_name = 'Juan Martn del Potro';

DELETE FROM `competitor_event`
WHERE event_id = 1
    AND competitor_id = 27132
    AND medal_id = 1;


-- 8
DELIMITER //
CREATE PROCEDURE `add_new_medalists`(IN event_id INT,
                                     IN g_id INT,
                                     IN s_id INT,
                                     IN b_id INT)
    BEGIN
        INSERT INTO competitor_event (event_id, competitor_id, medal_id)
        VALUES (event_id, g_id, 1);
        INSERT INTO competitor_event (event_id, competitor_id, medal_id)
        VALUES (event_id, s_id, 2);
        INSERT INTO competitor_event (event_id, competitor_id, medal_id)
        VALUES (event_id, b_id, 3);
    END;
//
DELIMITER ;

-- procedure test 
SELECT *
FROM `person`
LIMIT 3;

CALL add_new_medalists(1,1,2,3);


-- 9
CREATE ROLE `organizer`;

GRANT DELETE
ON `games`
TO `organizer`;

GRANT UPDATE (games_name)
ON `games`
TO `organizer`;
