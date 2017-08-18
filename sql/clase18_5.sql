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






-- ejercicio 2

CREATE PROCEDURE LosNombres (IN p_country VARCHAR(10), OUT name_list VARCHAR(4000))
BEGIN
	DECLARE v_finished INTEGER DEFAULT 0;
	DECLARE v_name VARCHAR(100) DEFAULT "";
	DECLARE v_second VARCHAR(100) DEFAULT "";

    -- declare cursor for names
    DEClARE nombres_c CURSOR FOR 
    SELECT first_name, last_name
    FROM customer
    INNER JOIN address USING(address_id)
    INNER JOIN city USING(city_id)
    INNER JOIN country USING(country_id)
    WHERE country=p_country;

    -- declare NOT FOUND handler
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;

    OPEN nombres_c;

    get_name: LOOP

        FETCH nombres_c INTO v_name,v_second;

        IF v_finished = 1 THEN 
            LEAVE get_name;
        END IF;

        -- build name list
        SET name_list = CONCAT(v_name," ",v_second," ; ",name_list);

    END LOOP get_name;

    CLOSE nombres_c;

END

SET @name_list ="";
CALL Losnombres('Francia',@name_list);
SELECT @name_list;



-- ejercicio 3
