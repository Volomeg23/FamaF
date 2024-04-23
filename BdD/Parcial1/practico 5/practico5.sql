USE sakila;

--1)
CREATE TABLE director (
   id_director SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  movie_counter INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (id_director),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--2)

SELECT first_name, last_name, (SELECT count(*) as max_films FROM film_actor WHERE actor.actor_id = film_actor.actor_id)
as keep
FROM actor 
ORDER BY keep  DESC LIMIT 10;

--3) 
ALTER TABLE customer ADD premium_customer char(1) DEFAULT 'F' AFTER last_update;

--4)
CREATE VIEW top_customers as
    SELECT customer.customer_id as ID, customer.first_name as Name, customer.last_name as lastname, sum(payment.amount) as payment
    FROM customer
    INNER JOIN payment ON payment.customer_id = customer.customer_id
    GROUP BY Name, lastname, ID
    ORDER BY payment DESC LIMIT 10;

    UPDATE customer
    SET premium_customer = 'T'
        WHERE customer.customer_id in (
         SELECT ID from top_customers);

--5
select count(film_id) as film_count, rating FROM film GROUP BY rating ORDER BY film_count DESC;

--6)
(SELECT payment_date FROM payment ORDER BY payment_date ASC LIMIT 1)
UNION
(SELECT payment_date FROM payment ORDER BY payment_date DESC LIMIT 1);

--7)

SELECT avg(amount), NombreMes(month(payment_date)) as month_number FROM payment GROUP BY month_number;


CREATE FUNCTION NombreMes(numero_mes INT) RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
  DECLARE nombre_mes VARCHAR(20);
  
  CASE numero_mes
    WHEN 1 THEN SET nombre_mes = 'Enero';
    WHEN 2 THEN SET nombre_mes = 'Febrero';
    WHEN 3 THEN SET nombre_mes = 'Marzo';
    WHEN 4 THEN SET nombre_mes = 'Abril';
    WHEN 5 THEN SET nombre_mes = 'Mayo';
    WHEN 6 THEN SET nombre_mes = 'Junio';
    WHEN 7 THEN SET nombre_mes = 'Julio';
    WHEN 8 THEN SET nombre_mes = 'Agosto';
    WHEN 9 THEN SET nombre_mes = 'Septiembre';
    WHEN 10 THEN SET nombre_mes = 'Octubre';
    WHEN 11 THEN SET nombre_mes = 'Noviembre';
    WHEN 12 THEN SET nombre_mes = 'Diciembre';
    ELSE SET nombre_mes = 'Mes inválido';
  END CASE;

  RETURN nombre_mes;
END//

--8)
CREATE VIEW customer_rental_new as
(SELECT customer.customer_id as customer, customer.address_id as customer_address, count(rental.rental_id) as rental
                FROM customer
                INNER JOIN rental ON rental.customer_id = customer.customer_id
                GROUP BY customer
                ORDER BY rental DESC);

SELECT sum(customer_rental_new.rental) as big_rental, address.district as district 
FROM customer_rental_new
INNER JOIN address ON customer_rental_new.customer_address = address.address_id
GROUP BY district
ORDER BY big_rental DESC LIMIT 10 ;

--9)

ALTER TABLE inventory ADD stock INTEGER DEFAULT 5 AFTER last_update

--10)



create trigger update_stock AFTER INSERT ON rental
FOR EACH ROW

UPDATE inventory SET stock = stock -1
WHERE inventory.inventory_id = NEW.inventory_id;


--11)

CREATE TABLE fines (
rental_id INT DEFAULT NULL,
amount NUMERIC (10, 2) DEFAULT NULL,
CONSTRAINT fk_fines_rental FOREIGN KEY (rental_id) REFERENCES rental (rental_id) ON DELETE SET NULL ON UPDATE CASCADE)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--12)

CREATE PROCEDURE check_date_and_fine()
INSERT INTO fines (rental_id, amount)
SELECT rental_id as rental_id, TIMESTAMPDIFF(day, return_date, rental_date) * 1.5 as amount
FROM rental WHERE TIMESTAMPDIFF(day, return_date, rental_date) >3;

--13)
CREATE ROLE employee;
GRANT select,delete,update ON fines TO employee;

--14)
REVOKE delete ON fines from employee;
CREATE ROLE admin;
GRANT select,delete,update ON * to admin;

--15)
create role employee_admin;
create role employee_common;
grant admin to employee_admin; 
grant employee to employee_common;

