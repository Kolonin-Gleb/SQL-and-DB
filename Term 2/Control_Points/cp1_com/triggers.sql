DELIMITER //

CREATE TRIGGER call_event
AFTER INSERT
ON com_call
FOR EACH ROW
BEGIN
    DECLARE call_event_id INT DEFAULT NULL; -- id обрабатываемого звонка
    DECLARE cost_min FLOAT DEFAULT NULL;
    DECLARE duration FLOAT DEFAULT NULL;
    DECLARE call_event_cost FLOAT DEFAULT NULL;
    DECLARE call_event_type VARCHAR(3) DEFAULT NULL; -- Для того, чтобы обрабатывать только выходящие звонки

    -- Необходимо получить продолжительность разговора, из строки, на вставку которой сработал этот триггер
    -- Разговор на который срабатывает этот триггер имеет максимальный id => исп. это!
    -- Запрос типа SET duration = (SELECT call_long FROM com_call WHERE id = MAX(id));
    -- Не сработает, поэтму сделаю через лок. пер. для id звонка
    SET call_event_id = (SELECT MAX(id) FROM com_call);
    SET call_event_type = (SELECT call_type FROM com_call WHERE id = call_event_id);

    IF call_event_type = 'out' THEN
        SET duration = (SELECT call_long FROM com_call WHERE id = call_event_id);
        SET duration = (ROUND(duration));

        SET cost_min = (SELECT cost FROM com_price WHERE dt_till IS NULL);

        SET call_event_cost = duration * cost_min;

        -- В процедуру необх. передать:
        -- Номер обрабатываемого звонка
        -- Стоимость звонка для клиента
        -- Стоимость минуты по тарифу
        -- id клиента, который осуществил звонок БЕРЕТСЯ ИЗ com_call
        CALL payment(call_event_id, call_event_cost, cost_min, NEW.client_id);
    END IF;
END //

DELIMITER ;

-- Тест Триггера

-- Данный тест только добавит запись в com_call
INSERT INTO `com_call` (`id`, `client_id`, `client_phone`, `abonent_phone`, `dt`, `call_long`, `call_type`) VALUES
(1, 1, '+74958761239', '+79256347895', '2022-02-12 10:36:01', 1.5, 'in');

-- Данный тест добавит запись в com_call и спишет деньги за 2 минуты у 1 клиента
INSERT INTO `com_call` (`id`, `client_id`, `client_phone`, `abonent_phone`, `dt`, `call_long`, `call_type`) VALUES
(2, 1, '+74958761239', '+79256347895', '2022-02-12 10:37:01', 1.5, 'out');

-- Ещё один тест, чтобы проверить работу транзакци
INSERT INTO `com_call` (`client_id`, `client_phone`, `abonent_phone`, `dt`, `call_long`, `call_type`) VALUES
(2, '+79222547895', '+79258877895', '2022-02-12 10:37:06', 10, 'out');


