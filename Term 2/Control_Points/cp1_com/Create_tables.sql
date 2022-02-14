CREATE TABLE `com_billing` (
  `id` int(10) UNSIGNED NOT NULL,
  `call_id` int(10) UNSIGNED NOT NULL,
  `cost_minute` float NOT NULL,
  `cost_call` float NOT NULL
);

ALTER TABLE `com_billing`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `com_billing`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

--
CREATE TABLE `com_call` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `client_phone` varchar(13) NOT NULL COMMENT 'номер клиента компании',
  `abonent_phone` varchar(13) NOT NULL COMMENT 'номер абонента',
  `dt` datetime NOT NULL COMMENT 'время начала звонка',
  `call_long` float NOT NULL COMMENT 'продолжительность звонка в секундах',
  `call_type` enum('in','out') NOT NULL COMMENT 'тип звонка: in - входящий, out - исходящий'
);

ALTER TABLE `com_call`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `com_call`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;
--

CREATE TABLE `com_client` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL COMMENT 'Наименование клиента',
  `money` float NOT NULL COMMENT 'Деньги на счету клиента'
);


ALTER TABLE `com_client`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `com_client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

--

CREATE TABLE `com_price` (
  `id` int(10) UNSIGNED NOT NULL,
  `dt_from` datetime NOT NULL COMMENT 'Дата и время начала действия тарифа',
  `dt_till` datetime DEFAULT NULL COMMENT 'Дата и время окончания действия тарифа. Если NULL - действует по настоящее время',
  `cost` float NOT NULL COMMENT 'Стоимость минуты'
);

ALTER TABLE `com_price`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `com_price`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;


