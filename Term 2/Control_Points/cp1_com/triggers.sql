DELIMITER //

CREATE TRIGGER out_call
AFTER INSERT
ON com_call
FOR EACH ROW
    DECLARE cost FLOAT DEFAULT NULL;
    SET cost = (SELECT cost FROM com_price WHERE dt_till = NULL);

    UPDATE hw2_cities_count SET hw2_cities_count.cities_count = cities_count;

END //

DELIMITER ;