-- Бекап спроектированной таблицы

-- Структура таблицы

CREATE TABLE `hw3_pricing` (
  `id` int(11) NOT NULL,
  `day_of_week` varchar(255) NOT NULL,
  `beg_time1` time NOT NULL,
  `end_time1` time NOT NULL,
  `price1` float NOT NULL,
  `beg_time2` time DEFAULT NULL,
  `end_time2` time DEFAULT NULL,
  `price2` float DEFAULT NULL,
  `beg_time3` time DEFAULT NULL,
  `end_time3` time DEFAULT NULL,
  `price3` float DEFAULT NULL
);

-- Значения для таблицы

INSERT INTO `hw3_pricing` (`id`, `day_of_week`, `beg_time1`, `end_time1`, `price1`, `beg_time2`, `end_time2`, `price2`, `beg_time3`, `end_time3`, `price3`) VALUES
(1, 'Monday', '00:00:00', '23:59:59', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Tuesday', '00:00:00', '23:59:59', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Wednesday', '00:00:00', '23:59:59', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Thursday', '00:00:00', '23:59:59', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Friday', '00:00:00', '04:00:00', 500, '04:00:01', '20:00:00', 0, '20:00:01', '23:59:59', 100),
(6, 'Saturday', '00:00:00', '04:00:00', 500, '04:00:01', '20:00:00', 0, '20:00:01', '23:59:59', 100),
(7, 'Sunday', '00:00:00', '20:00:00', 0, '20:00:01', '23:59:59', 300, NULL, NULL, NULL);

ALTER TABLE `hw3_pricing`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `hw3_pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

