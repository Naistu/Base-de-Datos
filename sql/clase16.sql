CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
);



insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),
(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),
(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing');


CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);


DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit (action, employeeNumber, lastname, changedat)
                         VALUES ('update', OLD.employeeNumber, OLD.lastname, NOW())
END $$
DELIMITER ;


UPDATE employees 
SET lastName = 'Phan'
WHERE employeeNumber = 1056;
    
SELECT *
FROM employees_audit;

-- ejercicio 1

insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(1002,'Murphy','Diane','x5800', NULL,'1',NULL,'President');

-- ejercicio 2

UPDATE employee set employeeNumber = employeeNumber - 20;
UPDATE employee set employeeNumber = employeeNumber + 20;

-- ejercicio 3
ALTER TABLE employees
	ADD `age` INT NOT NULL CHECK (age >=16 AND age <=70);

-- ejercicio 4
-- las tablas actor y film tienen su propia primary key(actor_id & film_id)
-- Dentro de la tabla film_actor, tenemos ambas primary keys, entonces de esta forma podemos relacionar la tabla actor con la tabla film

-- ejercicio 5

ALTER TABLE employees_audit ADD lastUpdate DATETIME DEFAULT NULL;
ALTER TABLE employees_audit ADD lastUpdateUser VARCHAR(32) DEFAULT  "";
DELIMITER $$
CREATE TRIGGER employee_lastUpdate 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
    employeeNumber = OLD.employeeNumber,
    lastname = OLD.lastname,
    lastUpdateUser = SELECT CURRENT_USER()
    lastUpdate = NOW();
     
END$$
DELIMITER ;
DESCRIBE employees_audit;

-- ejercicio 6  

-- ins_film inserta un nuevo film_text
BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
END
-- upd_film hace un update a un film_text ya existente

BEGIN
	IF (old.title != new.title) OR (old.description != new.description) OR (old.film_id != new.film_id)
	THEN
	    UPDATE film_text
	        SET title=new.title,
	            description=new.description,
	            film_id=new.film_id
	    WHERE film_id=old.film_id;
	END IF;
END
-- del_film elimina el film_text de la pelicula eliminada

BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
END
