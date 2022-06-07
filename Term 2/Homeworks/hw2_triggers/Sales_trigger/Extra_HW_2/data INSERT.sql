-- Вставка данных для будущих тестов триггера

shops

INSERT INTO `shops` (`id`, `name`) VALUES ('1', 'shop1'), ('2', 'shop2');

workers

INSERT INTO `workers` (`id`, `shop_id`, `name`) VALUES ('1', '1', 'worker1'), ('2', '2', 'worker2');

shop_sales

INSERT INTO `shops_sales` (`id`, `shop_id`, `dt`, `shop_plan`, `cur_sales`)
VALUES ('1', '1', '2022-05-30 16:00:00', '1000', '0'), ('2', '2', '2022-05-30 16:00:00', '500', '0');

worker_sales

INSERT INTO `workers_sales` (`id`, `worker_id`, `dt`, `worker_plan`, `cur_sales`, `score`, `fixed_salary`, `income`)
VALUES ('1', '1', '2022-05-30 16:00:00', '100', '0', '0', '30000', '30000'), ('2', '2', '2022-05-30 16:00:00', '100', '0', '0', '45000', '45000');

sales

INSERT INTO `sales` (`id`, `worker_id`, `dt`, `new_sales`) VALUES ('1', '1', '2022-05-30 16:00:00', '1');