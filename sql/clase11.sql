-- ejercicio 1
SELECT country, (SELECT COUNT(*)
				FROM city c2
				WHERE c1.country_id = c2.country_id) AS city
FROM country c1;				
-- grupBy
SELECT  country, COUNT(*)
FROM city a, country b
WHERE a.country_id = b.country_id
GROUP BY country

-- ejercicio 2
SELECT country, (SELECT COUNT(*) av
				FROM city c2
				WHERE c1.country_id = c2.country_id) AS citi
FROM country c1
WHERE (SELECT COUNT(*) 
				FROM city c2
				WHERE c1.country_id = c2.country_id) > 10;
				
-- grupBy
SELECT  country, COUNT(*)
FROM city a, country b
WHERE a.country_id = b.country_id
GROUP BY country
HAVING COUNT(*) >10
ORDER BY 2 DESC; 
				
-- ejercicio 3				
SELECT c1.first_name, c1.last_name, a1.address, COUNT(*), SUM(p1.amount) as total
FROM customer c1, rental r1, address a1, payment p1
WHERE c1.customer_id = r1.customer_id
AND a1.address_id = c1.address_id
AND p1.rental_id = r1.rental_id
GROUP BY c1.first_name, c1.last_name, a1.address
ORDER BY total DESC;

-- innner join
SELECT c.first_name, c.last_name, address,COUNT(rental.rental_id),SUM(payment.amount)
FROM customer c
INNER JOIN address USING(address_id)
INNER JOIN rental USING(customer_id)
INNER JOIN payment USING(rental_id)
GROUP BY 1,2,3
ORDER BY 5 DESC;

-- 4
SELECT title
FROM film
WHERE film.film_id NOT IN(SELECT film_id FROM inventory);


-- 5
SELECT *
FROM (SELECT title, inventory_id
FROM film 
INNER JOIN inventory USING(film_id)) a
WHERE a.inventory_id NOT IN (SELECT DISTINCT inventory_id FROM rental);
-- 5 left join
SELECT title, inventory_id
FROM film
INNER JOIN inventory USING(film_id)
LEFT JOIN rental USING(inventory_id)
WHERE rental.rental_id IS NULL;

-- 6
SELECT first_name, last_name, store_id, title, rental_date, return_date
FROM customer
JOIN rental USING (customer_id)
JOIN inventory USING (inventory_id)

-- Get the amount of cities per country in the database. Sort them by country, country_id.
SELECT country, COUNT(*)
FROM city
INNER JOIN country c USING (country_id)
GROUP BY c.country DESC
HAVING COUNT(*) < 10;