CREATE INDEX postalCode ON customers(postalCode);

-- agrego index full a productsline 
ALTER TABLE products 
ADD FULLTEXT(productline);

SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic');
-- To search for product whose product line 
-- contains Classic or Vintage term, you can perform the following query:
SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic,Vintage');

-- agrego index full a productsname
ALTER TABLE products 
ADD FULLTEXT(productName);	

SELECT productName, productline
FROM products
WHERE MATCH(productName) AGAINST('Ford,1932');


SELECT customer_id, first_name, address
FROM customer
INNER JOIN address USING(address_id);
-- ejercicio 1
SELECT *
FROM address
WHERE postal_code IN (SELECT postal_code
FROM address AS ad
WHERE ad.postal_code LIKE "%2%")

CREATE INDEX addressCode ON address(postal_code);
-- Despues de agregar el index la query fue mas performante

-- ejercicio 2

SELECT first_name 
FROM actor 
WHERE first_name LIKE "%J%";

SELECT last_name
FROM actor
WHERE last_name 
LIKE "%A%"

-- No llega a notarse pero la query es mas perfromante ahora que posee un index.

-- ejercicio 3

SELECT *
FROM film
WHERE description LIKE '%Astounding%';

ALTER TABLE film_text 
ADD FULLTEXT(description);

SELECT *
FROM film_text
WHERE MATCH(description) AGAINST('Astounding');

-- con el fulltext index funciona mucho mas rapido
