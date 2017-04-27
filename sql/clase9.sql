SELECT rating, COUNT(*)
FROM film
GROUP BY rating


SELECT c.customer_id, first_name, last_name, COUNT(*)
FROM rental r1, customer c
WHERE c.customer_id = r1.customer_id
GROUP BY c.customer_id, first_name, last_name
HAVING COUNT(*) = 1

SELECT rating, COUNT(*)
FROM film
GROUP BY rating
HAVING COUNT(*) < 195

SELECT rating, AVG(`length`)
FROM film
GROUP BY rating
HAVING AVG(`length`) > (SELECT AVG(`length`) FROM film)

SELECT DISTINCT rating, (SELECT COUNT(*) FROM film f3 WHERE f3.rating = f1.rating) AS total
FROM film f1
WHERE (SELECT COUNT(*) FROM film f2 WHERE f2.rating = f1.rating) < 195



