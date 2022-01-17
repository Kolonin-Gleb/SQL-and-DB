CREATE TABLE `hw2_workers_private` (
  `id` int DEFAULT NULL,
  `FIO` varchar(100) DEFAULT NULL
);

INSERT INTO `hw2_workers_private` (`id`, `FIO`) VALUES
(1, 'Колонин Глеб Семёнович'),
(2, 'Сергеева С.С'),
(3, 'Петров П.П.'),
(4, 'Николаев Н.Н.');

CREATE TABLE `hw2_workers_public` (
  `id` int NOT NULL,
  `position` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `department_number` varchar(100) DEFAULT NULL
);


INSERT INTO `hw2_workers_public` (`id`, `position`, `qualification`, `department_number`) VALUES
(1, 'Программист', 'C++', '24'),
(2, 'Администратор БД', 'DB2', '42'),
(3, 'Программист', 'Java, VB', '128'),
(4, 'Системный администратор', 'Windows, Linux', '128');


CREATE TABLE `hw2_workers_salary` (
  `id` int NOT NULL,
  `salary` float NOT NULL
);


INSERT INTO `hw2_workers_salary` (`id`, `salary`) VALUES
(1, 1000),
(2, 700.5),
(3, 32.005),
(4, 400.99);
