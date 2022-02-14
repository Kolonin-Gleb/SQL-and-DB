DELIMITER //

CREATE TRIGGER out_call
AFTER INSERT
ON com_call
FOR EACH ROW
BEGIN
    DECLARE cost_min FLOAT DEFAULT NULL;
    DECLARE duration FLOAT DEFAULT NULL;
    DECLARE cost_call FLOAT DEFAULT NULL;
    SET cost_min = (SELECT cost FROM com_price WHERE dt_till = NULL);
    SET duration = (SELECT call_long FROM com_call WHERE New.call_long);
    SET duration = (ROUND(duration));

    SET cost_call = duration * cost_min;

    INSERT INTO com_billing VALUES (0, 0, cost_min, cost_call);
    UPDATE com_client SET money = (money - cost_call) WHERE client_id = com_client.id;

END //

DELIMITER ;

