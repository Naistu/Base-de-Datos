-- List all the actors that share the last name. Show them in order
SELECT first_name, last_name
FROM actor c1
WHERE EXISTS (SELECT * 
					FROM actor c2
					WHERE c1.last_name = c2.last_name
					AND c1.actor_id <> c2.actor_id)
ORDER BY last_name;
 
-- Find actors that don't work in any film
SELECT first_name, last_name
FROM actor
WHERE actor_id NOT IN(SELECT actor_id
						FROM film_actor);
						
-- Find customers that rented only one film
SELECT c.customer_id, c.last_name, c.first_name
FROM rental r1, customer c
WHERE NOT EXISTS( SELECT *
					FROM rental r2
					WHERE r1.customer_id = r2.customer_id
					AND r1.rental_id <> r2.rental_id)
AND r1.customer_id = c.customer_id
ORDER BY 1;

-- Find customers that rented more than one film
SELECT c.customer_id, c.last_name, c.first_name
FROM rental r1, customer c
WHERE EXISTS( SELECT *
					FROM rental r2
					WHERE r1.customer_id = r2.customer_id
					AND r1.rental_id <> r2.rental_id)
AND r1.customer_id = c.customer_id
ORDER BY 1;

-- List the actors that acted in 'BETRAYED REAR' or in 'CATCH AMISTAD'
SELECT DISTINCT first_name,last_name
FROM actor,film,film_actor
WHERE actor.actor_id=film_actor.actor_id
AND film_actor.film_id=film.film_id
AND title IN ('BETRAYED REAR', 'CATCH AMISTAD');

-- 6. List the actors that acted in 'BETRAYED REAR' 
-- but not in 'CATCH AMISTAD'
SELECT actor_id, first_name, last_name      
  FROM actor
 WHERE actor_id IN (SELECT actor.actor_id
                      FROM film_actor, actor, film
                     WHERE actor.actor_id = film_actor.actor_id
                       AND film.film_id = film_actor.film_id
                       AND title = 'BETRAYED REAR')
   AND actor_id NOT IN (SELECT actor.actor_id
                          FROM film_actor, actor, film
                         WHERE actor.actor_id = film_actor.actor_id
                           AND film.film_id = film_actor.film_id
                           AND title = 'CATCH AMISTAD')

-- 7. List the actors that acted in both 'BETRAYED REAR' and 'CATCH AMISTAD'
SELECT actor_id, first_name, last_name      
  FROM actor
 WHERE actor_id IN (SELECT actor.actor_id
                      FROM film_actor, actor, film
                     WHERE actor.actor_id = film_actor.actor_id
                       AND film.film_id = film_actor.film_id
                       AND title = 'BETRAYED REAR')
   AND actor_id IN (SELECT actor.actor_id
                          FROM film_actor, actor, film
                         WHERE actor.actor_id = film_actor.actor_id
                           AND film.film_id = film_actor.film_id
                           AND title = 'CATCH AMISTAD')

-- 8. List all the actors that didn't work in 'BETRAYED REAR' or 'CATCH AMISTAD'    
/* Wrong answer
SELECT DISTINCT actor.actor_id, first_name, last_name
  FROM film_actor, actor, film
 WHERE actor.actor_id = film_actor.actor_id
   AND film.film_id = film_actor.film_id
   AND title NOT IN ('BETRAYED REAR', 'CATCH AMISTAD');
*/
-- Right answer
SELECT actor_id, first_name, last_name      
  FROM actor a
 WHERE NOT EXISTS (SELECT *
                     FROM film_actor, actor, film
                    WHERE actor.actor_id = film_actor.actor_id
                      AND film.film_id = film_actor.film_id
                      AND title IN ('BETRAYED REAR', 'CATCH AMISTAD')
                      AND actor.actor_id = a.actor_id);            
                      
                      
