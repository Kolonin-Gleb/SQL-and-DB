DELIMITER //

CREATE TRIGGER call_event
AFTER INSERT
ON com_call
FOR EACH ROW
BEGIN
    -- DECLARE call_event_id INT DEFAULT NULL; -- id обрабатываемого звонка
    DECLARE cost_min FLOAT DEFAULT NULL;
    DECLARE duration FLOAT DEFAULT NULL;
    -- DECLARE call_event_cost FLOAT DEFAULT NULL;
    -- DECLARE call_event_type VARCHAR(3) DEFAULT NULL; -- Для того, чтобы обрабатывать только выходящие звонки
    -- Переменная хранящая значение кода клиента
    DECLARE call_client_code VARCHAR(13) DEFAULT NULL;

    -- Необходимо получить продолжительность разговора, из строки, на вставку которой сработал этот триггер
    -- Разговор на который срабатывает этот триггер имеет максимальный id => исп. это!
    -- Запрос типа SET duration = (SELECT call_long FROM com_call WHERE id = MAX(id));
    -- Не сработает, поэтму сделаю через лок. пер. для id звонка
    -- SET call_event_id = (SELECT MAX(id) FROM com_call);
    -- SET call_event_type = (SELECT call_type FROM com_call WHERE id = NEW.id);

    IF NEW.call_type = 'out' THEN

        -- Получение номера звонящего
#         SET call_client_code = (SELECT client_phone FROM `com_call` WHERE id = NEW.id);

        -- С помощью SUBSTRING и запроса получить код телефона
        -- номер телефона, сколько символов пропустить с начала, сколько символов взять
        SET call_client_code = SUBSTRING(NEW.abonent_phone, 3, 3);
        SET @cc = call_client_code;

#         SET duration = (SELECT call_long FROM com_call WHERE id = call_event_id);

        SET duration = (ROUND(NEW.call_long / 60));

        -- Получение стоимости минуты основываясь на том, что тариф действует и коде телефона

        SET cost_min = (SELECT code_cost FROM com_price WHERE dt_till IS NULL AND code = call_client_code);
        IF cost_min IS NULL THEN
            SET cost_min = (SELECT code_cost FROM com_price WHERE dt_till IS NULL AND code IS NULL);
        END IF;

        -- В процедуру необх. передать:
        -- Номер обрабатываемого звонка
        -- Стоимость звонка для клиента
        -- Стоимость минуты по тарифу
        -- id клиента, который осуществил звонок БЕРЕТСЯ ИЗ com_call
        CALL payment(NEW.id, (duration * cost_min), cost_min, NEW.client_id);
    END IF;
END //

DELIMITER ;

-- Для отладки
-- SELECT @c;
-- SELECT @cc;
-- Новые тесты триггера

INSERT INTO `com_call` (`client_id`, `client_phone`, `abonent_phone`, `dt`, `call_long`, `call_type`) VALUES
(2, '+74958761239', '+79256347895', '2022-02-12 10:36:01', 100, 'out');


