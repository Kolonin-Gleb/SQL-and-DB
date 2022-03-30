CREATE TABLE `table_3_rows` (
  `id` int NOT NULL,
  `company` varchar(100) NOT NULL,
  `product` varchar(100) NOT NULL
);

ALTER TABLE `table_3_rows`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `table_3_rows`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

INSERT INTO `table_3_rows` (`id`, `company`, `product`) VALUES
(1, 'IThub', 'Education'),
(2, 'Tesla', 'Electocars'),
(3, 'SpaceX', 'Rockets');






