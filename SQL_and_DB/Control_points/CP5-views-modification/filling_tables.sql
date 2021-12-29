Заполните созданную базу данными
(не менее 3х организаций, 
INSERT INTO `cp5_companies` (`id`, `name`) VALUES ('1', 'IThub'), ('2', 'Future Foundation'), ('3', 'Taggart Transcontinental');

не менее 2-х сотрудников в каждой организации, 
INSERT INTO `cp5_workers` (`id`, `company_id`) VALUES ('1', '1'), ('2', '1'), ('3', '2'), ('4', '2'), ('5', '3'), ('6', '3');

UPDATE `cp5_workers` SET `FIO` = 'Колонин Глеб Семёнович' WHERE `cp5_workers`.`id` = 1;
UPDATE `cp5_workers` SET `FIO` = 'Геворкян Марат Вачаганович' WHERE `cp5_workers`.`id` = 2;
UPDATE `cp5_workers` SET `FIO` = 'Синяев Георгий Михайлович' WHERE `cp5_workers`.`id` = 3;
UPDATE `cp5_workers` SET `FIO` = 'Калашников Андрей Максимович' WHERE `cp5_workers`.`id` = 4;
UPDATE `cp5_workers` SET `FIO` = 'Блохина Сима Рудольфовна' WHERE `cp5_workers`.`id` = 5;
UPDATE `cp5_workers` SET `FIO` = 'Колобова Ирина Геласьевна' WHERE `cp5_workers`.`id` = 6;

не менее 3-х категорий товаров) 
INSERT INTO `cp5_categories` (`id`, `name`) VALUES ('1', 'Clothes'), ('2', 'Food'), ('3', 'Technic');

не менее 10 товаров, 
INSERT INTO `cp5_goods` (`id`, `category_id`, `name`) VALUES ('1', '1', 'Hat'), ('2', '1', 'shirt'), ('3', '1', 'jacket'), ('4', '2', 'Burger'), ('5', '2', 'Buckwheat'), ('6', '2', 'Bread'), ('7', '3', 'Laptop'), ('8', '3', 'PC'), ('9', '3', 'Mobile phone'), ('10', '3', 'Wrist watch');


Моё собственное решение:

Не смотря на наличие foreign-keys мне нужно самому
заполнить таблицы с заказами и связочную таблицу заказов и товаров, т.к. они у меня пустые
(не заполнились автоматически).


cp5_orders cp5_orders_goods - таблицы, что я решил заполнять.

Я заполнил их так:

У меня 6 работников, поэтому я создам 6 заказов. Заполнение cp5_orders 

INSERT INTO `cp5_orders` (`id`, `worker_id`, `order_time`) VALUES ('1', '1', '2021-11-22 08:25:30'),
 ('2', '2', '2021-10-01 02:25:30'), 
('3', '3', '2021-06-28 18:25:30'),
('4', '4', '2021-08-19 20:39:05'),
 ('5', '5', '2021-04-01 14:12:46'), 
('6', '6', '2021-02-18 16:39:38');

Заполнение cp5_orders_goods 

INSERT INTO `cp5_orders_goods` (`id`, `order_id`, `good_id`) VALUES ('1', '1', '1'),
 ('2', '1', '2'), ('3', '2', '3'), ('4', '4', '4'), ('5', '4', '5'),
 ('6', '5', '6'), ('7', '6', '8'), ('8', '6', '9'), ('9', '6', '10'), ('10', '3', '8');





