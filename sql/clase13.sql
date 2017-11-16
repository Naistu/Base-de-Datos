-- Clase 12: Normal Forms TBD

-- 1


INSERT INTO customer a
(customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update)
VALUES(0, 1, 'Lionel', 'Messi', 'lapulga10@gmail.com', 123, 1, '', CURRENT_TIMESTAMP)
WHERE a.address_id > a2.addres_id;


INSERT INTO customer
(address_id, first_name, last_name)

SELECT store_id, first_name, last_name, email,address_id, active, create_date, last_update
FROM customer
WHERE
AND store_id=1;


SELECT MAX(dire.address_id)
FROM address dire
WHERE (SELECT c.country_id
		FROM country c, city c1
		WHERE country="United States"
		AND c1.city_id=dire.city_id)
		AND c.country_id =c1.country_id)
ORDER BY address_id

		
		

SELECT store_id, first_name, last_name,address_id,country
FROM customer c1,country pais
WHERE EXISTS (SELECT *
	   FROM customer c2
	   WHERE c2.address_id > c1.address_id)
AND store_id =1
AND pais.country="United States"
ORDER BY address_id DESC
LIMIT 1;

SELECT MAX(dire.address_id)
FROM address dire
WHERE (SELECT pais.country_id FROM country pais, city ciudad
WHERE pais.country = "United States"
AND pais.country_id = ciudad.country_id
AND ciudad.city_id = dire.city_id);


INSERT INTO sakila.customer
(store_id, first_name, last_name, email, address_id, active, last_update)
VALUES(1, 'Pablo', 'Perez', 'Mistertarjeta@gmail.com', 200, 1, CURRENT_TIMESTAMP);


SELECT address_id,first_name,last_name
FROM customer 
WHERE last_name="Perez";

-- 2


INSERT INTO sakila.rental
(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES(0, '', 0, 0, '', 0, CURRENT_TIMESTAMP);







-- 3


UPDATE sakila.film
SET title='', description='', release_year='2001', language_id=0, original_language_id=0, rental_duration=3, rental_rate=4.99,
`length`=0, replacement_cost=19.99, rating='G', special_features='', last_update=CURRENT_TIMESTAMP
WHERE film_id=0;


SELECT COUNT(rating),rating
FROM film
GROUP BY rating;

UPDATE film
SET release_year = "2001"
WHERE rating="G";

UPDATE film
SET release_year = "2002"
WHERE rating="PG";

UPDATE film
SET release_year = "2003"
WHERE rating="PG-13";

UPDATE film
SET release_year = "2004"
WHERE rating="R";

UPDATE film
SET release_year = "2005"
WHERE rating="NC-17";



-- 4
SELECT title,film_id,rental_id,rental_rate
FROM film
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
WHERE rental.return_date IS NULL
AND rental_id=15813;


UPDATE sakila.rental
SET return_date=CURRENT_TIMESTAMP
WHERE rental_id=15813






-- 5

DELETE FROM sakila.film
WHERE film_id=0;





