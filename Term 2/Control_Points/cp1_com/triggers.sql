DELIMITER //

CREATE TRIGGER out_call
AFTER INSERT
ON com_call
FOR EACH ROW
BEGIN
    DECLARE out_call_id INT DEFAULT NULL; -- id обрабатываемого звонка
    DECLARE cost_min FLOAT DEFAULT NULL;
    DECLARE duration FLOAT DEFAULT NULL;
    DECLARE cost_call FLOAT DEFAULT NULL;
    SET cost_min = (SELECT cost FROM com_price WHERE dt_till IS NULL);
    -- Необходимо получить продолжительность разговора, из строки, на вставку которой сработал этот триггер
    -- Разговор на который срабатывает этот триггер имеет максимальный id => исп. это!
    -- Запрос типа SET duration = (SELECT call_long FROM com_call WHERE id = MAX(id));
    -- Не сработает, поэтму сделаю через лок. пер. для id звонка
    SET out_call_id = (SELECT MAX(id) FROM com_call);
    SET duration = (SELECT call_long FROM com_call WHERE id = out_call_id);
    SET duration = (ROUND(duration));

    SET cost_call = duration * cost_min; -- Не должен иметь значение NULL

    INSERT INTO com_billing VALUES (0, 0, cost_min, cost_call);
    UPDATE com_client SET money = (money - cost_call) WHERE id = NEW.client_id;
END //

DELIMITER ;

-- Тест Триггера

INSERT INTO `com_call` (`id`, `client_id`, `client_phone`, `abonent_phone`, `dt`, `call_long`, `call_type`) VALUES
(1, 1, '+74958761239', '+79256347895', '2022-02-12 10:36:01', 98.43, 'in');

-- (2, 1, '+74958761239', '+74995628796', '2022-02-12 13:01:19', 149.32, 'in'),
-- (7, 2, '+74991278563', '+79165548947', '2022-02-12 17:40:21', 287.29, 'out')
