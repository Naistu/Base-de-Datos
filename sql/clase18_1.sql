
CREATE PROCEDURE get_order_by_cust(
    IN cust_no INT,
    OUT shipped INT,
    OUT canceled INT,
    OUT resolved INT,
    OUT disputed INT)
BEGIN
        -- shipped
        SELECT
            count(*) INTO shipped
        FROM
            orders
        WHERE
            customerNumber = cust_no
                AND status = 'Shipped';

        -- canceled
        SELECT
            count(*) INTO canceled
        FROM
            orders
        WHERE
            customerNumber = cust_no
                AND status = 'Canceled';

        -- resolved
        SELECT
            count(*) INTO resolved
        FROM
            orders
        WHERE
            customerNumber = cust_no
                AND status = 'Resolved';

        -- disputed
        SELECT
            count(*) INTO disputed
        FROM
            orders
        WHERE
            customerNumber = cust_no
                AND status = 'Disputed';
END

CALL get_order_by_cust(141,@shipped,@canceled,@resolved,@disputed);
SELECT @shipped,@canceled,@resolved,@disputed;


DELIMITER $$


CREATE PROCEDURE GetCustomerShipping(
        in  p_customerNumber int(11), 
        out p_shiping        varchar(50))
BEGIN
    DECLARE customerCountry varchar(50);

    SELECT country INTO customerCountry
    FROM customers
    WHERE customerNumber = p_customerNumber;

    CASE customerCountry
        WHEN  'USA' THEN
           SET p_shiping = '2-day Shipping';
        WHEN 'Canada' THEN
           SET p_shiping = '3-day Shipping';
        ELSE
           SET p_shiping = '5-day Shipping';
    END CASE;

END$$



SET @customerNo = 112;

SELECT country into @country
FROM customers
WHERE customernumber = @customerNo;

CALL GetCustomerShipping(@customerNo,@shipping);

SELECT @customerNo AS Customer,
       @country    AS Country,
       @shipping   AS Shipping;
       

