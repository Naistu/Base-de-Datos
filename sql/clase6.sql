-- ejercicio 1
SELECT first_name, last_name
FROM actor c1
WHERE EXISTS (SELECT * 
					FROM actor c2
					WHERE c1.last_name = c2.last_name
					AND c1.actor_id <> c2.actor_id)
ORDER BY last_name;

-- ejercicio 2
SELECT first_name, last_name
FROM actor
WHERE actor_id NOT IN(SELECT actor_id
						FROM film_actor);
						
-- ejercicio 3
SELECT c.customer_id, c.last_name, c.first_name
FROM rental r1, customer c
WHERE NOT EXISTS( SELECT *
					FROM rental r2
					WHERE r1.customer_id = r2.customer_id
					AND r1.rental_id <> r2.rental_id)
AND r1.customer_id = c.customer_id
ORDER BY 1;

-- ejercicio 4
SELECT c.customer_id, c.last_name, c.first_name
FROM rental r1, customer c
WHERE EXISTS( SELECT *
					FROM rental r2
					WHERE r1.customer_id = r2.customer_id
					AND r1.rental_id <> r2.rental_id)
AND r1.customer_id = c.customer_id
ORDER BY 1;

-- ejercicio 5
SELECT DISTINCT first_name,last_name
FROM actor,film,film_actor
WHERE actor.actor_id=film_actor.actor_id
AND film_actor.film_id=film.film_id
AND title IN ('BETRAYED REAR', 'CATCH AMISTAD');