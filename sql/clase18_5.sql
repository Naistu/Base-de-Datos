-- ejercicio 1

CREATE FUNCTION Laspelis(p_pelis INT,p_store INT) RETURNS INT(10)
BEGIN
    DECLARE cant INT(10);
	SELECT COUNT(*) INTO cant
	FROM inventory
	INNER JOIN store USING(store_id)
	INNER JOIN film USING(film_id)
	WHERE film_id=p_pelis
	AND store_id = p_store;
    RETURN (cant);
END

SELECT Laspelis(5,2);

CREATE FUNCTION GetCountOfFilmByID(p_id_film INT, p_id_store INT) RETURNS INT(11)
	DETERMINISTIC
BEGIN
	DECLARE amount_films INT(11)
	
	SELECT COUNT(*) INTO amount_films
	FROM film
	INNER JOIN inventory USING(film_id)
	INNER JOIN store USING(store_id)
	WHERE film_id = p_id_film
	AND store_id = p_id_store
	
	RETURN (amount_films)
END;

SELECT GetCountOfFilmByID(1,2);




-- ejercicio 2

DROP PROCEDURE IF EXISTS sakila.Losnombres ;

DELIMITER $$
$$
CREATE PROCEDURE Losnombres (IN country VARCHAR(100),OUT names_list TEXT)
BEGIN
	
	DECLARE v_finished INTEGER DEFAULT 0;
	DECLARE v_nombre varchar(100) DEFAULT "";
	DECLARE v_apellido varchar(100) DEFAULT "";
	
	DECLARE nombres_c CURSOR FOR 
        SELECT first_name,last_name FROM customer
        INNER JOIN address USING(address_id)
        INNER JOIN city USING(city_id)
        INNER JOIN country USING(country_id)
        WHERE country = country;
   	
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;
	
	OPEN nombres_c;
	
	get_names: LOOP

        FETCH nombres_c INTO v_nombre,v_apellido;

        IF v_finished = 1 THEN 
            LEAVE get_names;
        END IF;

        SET names_list = CONCAT(" ",v_nombre," ",v_apellido," ; ",names_list);

    END LOOP get_names;

    CLOSE nombres_c;
END $$
DELIMITER ;

SET @names_list = "";
CALL Losnombres('Francia',@names_list);
SELECT @names_list;


-- ejercicio 3
