SELECT title, rating, length
FROM film
WHERE length > 100;

SELECT title, 'length' FROM film
WHERE 'length' BETWEEN 100 and 120;

	-- duracion de la pelicula mas de 100min menos d 200

SELECT title, name
FROM  film, `language` 
WHERE film.language_id = `language`.language_id;

-- lenguaje original machado con la pelicula

SELECT DISTINCT country, city
FROM address, city, country
WHERE address.city_id = city.city_id
AND city.country_id = country.country_id;

SELECT title,special_features,rental_rate, name
FROM film, film_category, category
WHERE film.film_id = film_category.film_id
	AND film_category.category_id = category.category_id
ORDER BY rental_rate DESC, special_features
LIMIT 3; -- cantidad de rows q me va a tirar

SELECT special_features, title
FROM film
WHERE special_features LIKE '%Trailers%';

SELECT title, rental_rate *15 AS "En las monedas del pueblo"
FROM film
ORDER BY `En las monedas del pueblo` DESC;

SELECT name FROM category
WHERE name LIKE 'A%' OR name LIKE 'M%'
UNION
SELECT name FROM category
WHERE name LIKE 'A%' OR name LIKE 'S%'

