
CREATE TABLE film(
	film_id INT(20) AUTO_INCREMENT NOT NULL,
	title VARCHAR(30) NOT NULL,
	description TEXT(100),
	relase_year DATE,
	PRIMARY KEY (film_id)
	);
	
CREATE TABLE actor(
	actor_id INT(20) AUTO_INCREMENT NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (actor_id)
	);
	
CREATE TABLE film_actor(
	actor_id INT(20) ,
	film_id INT(20),
	last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		
	FOREIGN KEY (film_id) REFERENCES film(film_id),
	PRIMARY KEY (film_id, actor_id)
	);	
	
ALTER TABLE film
	CHANGE  release_year YEAR DEFAULT;	
	
INSERT INTO imdb.actor
( first_name, last_name)
VALUES( 'Brian', 'Cranston');

INSERT INTO imdb.film
(film_id, title, description, relase_year, last_update)
VALUES(0, 'Hulk', 'ahhhh', '98-09-13', '12-12-12');


INSERT INTO imdb.film_actor
(actor_id, film_id)
VALUES(13, 1);


SELECT * FROM film_actor	


	