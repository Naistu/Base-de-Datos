-- Ejercicio 1

SELECT CONCAT_WS(first_name,last_name) as full_name, address.address, city.city
FROM customer 
	INNER JOIN address USING(address_id)
	INNER JOIN city USING(city_id)
	INNER JOIN country USING(country_id)
WHERE country.country LIKE 'Argentina';

-- Ejercicio 2

SELECT title,
`language`.name, 
CASE
	WHEN rating = 'NC-17' THEN '17 pa rriba.'
	WHEN rating = 'R' THEN 'No pinta que vean los nenes.'
	WHEN rating = 'PG-13' THEN 'Menos de 13 abstenerse.'
	WHEN rating = 'PG' THEN 'Si el nene se la banca.'
	WHEN rating = 'G' THEN 'Tamo activo perro .'
END AS rating_description
  FROM film
INNER JOIN `language` USING (language_id);
	
	
-- Ejercicio 3
	
SELECT title, release_year
  FROM film 
	INNER JOIN film_actor USING(film_id)
	INNER JOIN actor USING(actor_id)
WHERE CONCAT_WS(" ",first_name,last_name) LIKE TRIM(UPPER("   johNNy lollobRigidA     "));

-- Ejercicio 4

SELECT film.title,
	   CONCAT_WS(" ", customer.first_name, customer.last_name) as full_name,
	   CASE WHEN rental.return_date IS NOT NULL THEN 'Yes'
	   ELSE 'No' END AS was_returned,
	   MONTHNAME(rental.rental_date) as month
  FROM film
  	INNER JOIN inventory USING(film_id)
  	INNER JOIN rental USING(inventory_id)
  	INNER JOIN customer USING(customer_id)
WHERE MONTHNAME(rental.rental_date) LIKE 'May'
   OR MONTHNAME(rental.rental_date) LIKE 'June';
   
-- Ejercicio 5

SELECT CAST(last_update AS DATE) as only_date
FROM rental;

SELECT CONVERT("2006-02-15", DATETIME);

-- 6


