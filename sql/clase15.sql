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

