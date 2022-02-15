DELIMITER //

CREATE TRIGGER call_event
AFTER INSERT
ON com_call
FOR EACH ROW
BEGIN
    DECLARE cost_min FLOAT DEFAULT NULL;
    DECLARE duration FLOAT DEFAULT NULL;
    -- Переменная хранящая значение кода клиента
    DECLARE call_client_code VARCHAR(13) DEFAULT NULL;

    IF NEW.call_type = 'out' THEN
        -- С помощью SUBSTRING получить код телефона
        -- номер телефона, с какого исмовола начать извелечение, сколько символов взять
        SET call_client_code = SUBSTRING(NEW.abonent_phone, 3, 3);
        -- SET @cc = call_client_code; -- Удобный способ отладки

        SET duration = (ROUND(NEW.call_long / 60));

        -- Получение стоимости минуты основываясь на том, что тариф действует и коде телефона

        SET cost_min = (SELECT code_cost FROM com_price WHERE dt_till IS NULL AND code = call_client_code);
        IF cost_min IS NULL THEN
            SET cost_min = (SELECT code_cost FROM com_price WHERE dt_till IS NULL AND code IS NULL);
        END IF;

        -- В процедуру необх. передать:
        -- Номер обрабатываемого звонка (на доб. которого и сработал триггер)
        -- Стоимость звонка для клиента
        -- Стоимость минуты по тарифу
        -- id клиента, который осуществил звонок (на доб. которого и сработал триггер)
        CALL payment(NEW.id, (duration * cost_min), cost_min, NEW.client_id);
    END IF;
END //

DELIMITER ;

-- Для вывода отладочной информации
-- SELECT @c;
-- SELECT @cc;


-- Новые тесты триггера

INSERT INTO `com_call` (`client_id`, `client_phone`, `abonent_phone`, `dt`, `call_long`, `call_type`) VALUES
(2, '+74958761239', '+79256347895', '2022-02-12 10:36:01', 100, 'out');


