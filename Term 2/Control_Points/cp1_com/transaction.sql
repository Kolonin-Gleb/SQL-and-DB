-- Процедура с транзакцией будет вызываться из триггера
-- Входные параметры для процедуры будут передаваться из триггера.
--

-- START TRANSACTION;
-- UPDATE com_client SET money = (money - cost_call) WHERE id = NEW.client_id;
-- INSERT INTO com_billing VALUES (0, 0, cost_min, cost_call);
-- COMMIT;

DELIMITER //

CREATE PROCEDURE payment (IN call_event_id INT, IN call_event_cost FLOAT, IN cost_min FLOAT, IN client_id INT)
COMMENT 'CALL payment(call_event_id, call_event_cost, cost_min, client_id);'
BEGIN
    -- Запрещено создание транзакций, что вызываются через процедуры, что вызываются через триггер.
    -- В связи с этим код закомментирован
    -- START TRANSACTION;
    UPDATE com_client SET money = (money - call_event_cost) WHERE id = client_id;
    INSERT INTO com_billing VALUES (0, call_event_id, cost_min, call_event_cost); -- 0, 0, cost_min, call_event_cost
    -- COMMIT;
END //

DELIMITER ;

