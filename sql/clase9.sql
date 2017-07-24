SELECT rating, COUNT(*)
FROM film
GROUP BY rating


SELECT c.customer_id, first_name, last_name, COUNT(*)
FROM rental r1, customer c
WHERE c.customer_id = r1.customer_id
GROUP BY c.customer_id, first_name, last_name
HAVING COUNT(*) = 30

SELECT rating, COUNT(*)
FROM film
GROUP BY rating


SELECT rating, AVG(`length`)
FROM film
GROUP BY rating
HAVING AVG(`length`) > (SELECT AVG(`length`) FROM film)

SELECT DISTINCT rating, (SELECT COUNT(*) FROM film f3 WHERE f3.rating = f1.rating) AS total
FROM film f1
WHERE (SELECT COUNT(*) FROM film f2 WHERE f2.rating = f1.rating) < 195


SELECT film.title, language.name
FROM film, `language`
WHERE film.language_id = language.language_id
AND film.`length` > 100 AND language.name = 'English'


