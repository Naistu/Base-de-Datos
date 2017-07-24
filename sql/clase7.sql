SELECT * 
FROM (SELECT title,description,rental_rate, rental_rate * 15 AS in_pesos FROM film) t
WHERE in_pesos > 10
AND in_pesos < 70;

SELECT customer_id,first_name,last_name,
(SELECT MAX(amount)
FROM payment
WHERE payment.customer_id = customer.customer_id) AS amount
FROM customer
ORDER BY amount DESC,
		customer_id DESC






 
