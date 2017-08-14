-- ejercico 1

-- CREATE OR REPLACE VIEW list_of_customers AS
SELECT customer_id,CONCAT_WS(' ',First_name,Last_Name ) AS 'Name', address, postal_code AS 'Zip Code', phone, city, country, store_id,
CASE active
   WHEN "1" THEN "Active"
   WHEN "0" THEN "Inactive"
ELSE "Inactive"
END AS "Status"
FROM customer
INNER JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id)
INNER JOIN store USING(store_id);

SELECT * FROM list_of_customers;

-- ejercicio 2
-- CREATE OR REPLACE VIEW film_details AS
SELECT film_id,title, description,  category.name,  payment.amount,film.`length`, film.rating, GROUP_CONCAT(first_name)
FROM film
INNER JOIN film_category USING(film_id)
INNER JOIN category USING(category_id)
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN payment USING(rental_id)
GROUP BY 1,2,3,4,5,6,7;
1				

-- ejercicio 3

DROP VIEW IF EXISTS sales_by_film_category2
CREATE VIEW sales_by_film_category2 AS
SELECT name, SUM(amount) AS total_rental
FROM category
JOIN film_category USING (category_id)
JOIN film USING (film_id)
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY name

SELECT *
FROM sales_by_film_category2


-- Ejercicio 4 
DROP VIEW IF EXISTS actor_information

CREATE VIEW actor_information AS
SELECT actor_id, CONCAT_WS(' ', first_name, last_name) AS actor, COUNT(film.film_id) AS total_films
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
GROUP BY actor_id
SELECT *
FROM actor_information

-- ejercicio 5
-- ejercicio 6
