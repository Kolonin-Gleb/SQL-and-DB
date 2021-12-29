CREATE TABLE `hw3_countries` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
);


INSERT INTO `hw3_countries` (`id`, `name`) VALUES
(1, 'США'),
(2, 'Канада'),
(3, 'Россия'),
(4, 'Китай');


CREATE TABLE `hw3_goods` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_producer_id` int NOT NULL,
  `country_export_id` int NOT NULL,
  `price` float NOT NULL
);

INSERT INTO `hw3_goods` (`id`, `name`, `country_producer_id`, `country_export_id`, `price`) VALUES
(1, 'Компьютер', 4, 1, 1000),
(2, 'Снаряжение для альпинистов', 2, 2, 100),
(3, 'АК-47', 3, 3, 300),
(4, 'Лего', 4, 1, 50),
(5, 'Новый товар', 4, 3, 100.55);


CREATE TABLE `hw3_goods_all_data` (
`id` int
,`name` varchar(255)
,`country_producer_name` varchar(255)
,`country_export_name` varchar(255)
,`price` float
);