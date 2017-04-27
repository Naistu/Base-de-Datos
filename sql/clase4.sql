SELECT name AS val FROM category
WHERE name LIKE 'A%' OR name LIKE 'M%'
UNION
SELECT title FROM film
WHERE title LIKE 'A%' OR title LIKE 'S%';

SELECT f1.title, f2.title, f1.`length`
FROM film f1, film f2
WHERE f1.`length` = f2.`length` AND f1.film_id < f2.film_id
ORDER BY 1;

-- ejercicio 1
SELECT title, special_features FROM film
WHERE rating LIKE 'PG-13';

-- ejerciocio 2
SELECT DISTINCT length AS 'duracion' FROM film ;

-- ejercicio 3
SELECT title, rental_rate, replacement_cost FROM film
WHERE replacement_cost BETWEEN 20.00 and 24.00;

-- ejercicio 4
SELECT title, rating, special_features, name 
FROM film, category, film_category
WHERE category.category_id = film_category.category_id
AND film.film_id = film_category.film_id
AND special_features LIKE '%Behind the scenes';

-- ejercicio 5
SELECT first_name, last_name 
FROM actor,film,film_actor
WHERE actor.actor_id = film_actor.actor_id
AND film_actor.film_id = film.film_id
AND title LIKE '%ZOOLANDER FICTION';

-- ejercicio 6
SELECT address, city, country
FROM store, country, city, address
WHERE store.store_id = 1
AND store.address_id = address.address_id
AND address.city_id = city.city_id
AND city.country_id = country.country_id;

-- ejercicio 7
SELECT f1.title, f2.title, f1.rating, f2.rating
FROM film f1, film f2
WHERE f1.rating = f2.rating
AND f1.film_id < f2.film_id
ORDER BY 1;

-- ejercicio 8
SELECT title, first_name, last_name
FROM film, staff, store, inventory
WHERE store.store_id = 2
AND inventory.store_id = store.store_id
AND store.address_id = staff.address_id
AND film.film_id = inventory.film_id 
