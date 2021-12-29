-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 29, 2021 at 07:33 AM
-- Server version: 8.0.24
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hw1_views_modification`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `hw1_all_data_view`
-- (See below for the actual view)
--
CREATE TABLE `hw1_all_data_view` (
`id` int
,`FIO` varchar(100)
,`position` varchar(100)
,`qualification` varchar(100)
,`salary` float
,`department_number` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `hw1_expensive_workers_view`
-- (See below for the actual view)
--
CREATE TABLE `hw1_expensive_workers_view` (
`id` int
,`FIO` varchar(100)
,`position` varchar(100)
,`qualification` varchar(100)
,`salary` float
,`department_number` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `hw1_unupdatable_view`
-- (See below for the actual view)
--
CREATE TABLE `hw1_unupdatable_view` (
`FIO` varchar(100)
,`position` varchar(100)
,`qualification` varchar(100)
,`department_number` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `hw1_updatable_view`
-- (See below for the actual view)
--
CREATE TABLE `hw1_updatable_view` (
`FIO` varchar(100)
,`position` varchar(100)
,`qualification` varchar(100)
,`department_number` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `hw1_workers_private`
--

CREATE TABLE `hw1_workers_private` (
  `id` int DEFAULT NULL,
  `FIO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hw1_workers_private`
--

INSERT INTO `hw1_workers_private` (`id`, `FIO`) VALUES
(1, 'Колонин Глеб Семёнович'),
(2, 'Сергеева С.С'),
(3, 'Петров П.П.'),
(4, 'Николаев Н.Н.');

-- --------------------------------------------------------

--
-- Table structure for table `hw1_workers_public`
--

CREATE TABLE `hw1_workers_public` (
  `id` int NOT NULL,
  `position` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `department_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hw1_workers_public`
--

INSERT INTO `hw1_workers_public` (`id`, `position`, `qualification`, `department_number`) VALUES
(1, 'Программист', 'C++', '24'),
(2, 'Администратор БД', 'DB2', '42'),
(3, 'Программист', 'Java, VB', '128'),
(4, 'Системный администратор', 'Windows, Linux', '128');

-- --------------------------------------------------------

--
-- Table structure for table `hw1_workers_salary`
--

CREATE TABLE `hw1_workers_salary` (
  `id` int NOT NULL,
  `salary` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hw1_workers_salary`
--

INSERT INTO `hw1_workers_salary` (`id`, `salary`) VALUES
(1, 1000),
(2, 700.5),
(3, 32.005),
(4, 400.99);

-- --------------------------------------------------------

--
-- Structure for view `hw1_all_data_view`
--
DROP TABLE IF EXISTS `hw1_all_data_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `hw1_all_data_view` (`id`, `FIO`, `position`, `qualification`, `salary`, `department_number`) AS    select `hw1_workers_public`.`id` AS `id`,`hw1_workers_private`.`FIO` AS `FIO`,`hw1_workers_public`.`position` AS `position`,`hw1_workers_public`.`qualification` AS `qualification`,`hw1_workers_salary`.`salary` AS `salary`,`hw1_workers_public`.`department_number` AS `department_number` from ((`hw1_workers_public` join `hw1_workers_private`) join `hw1_workers_salary`) where ((`hw1_workers_public`.`id` = `hw1_workers_private`.`id`) and (`hw1_workers_public`.`id` = `hw1_workers_salary`.`id`))   ;

-- --------------------------------------------------------

--
-- Structure for view `hw1_expensive_workers_view`
--
DROP TABLE IF EXISTS `hw1_expensive_workers_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `hw1_expensive_workers_view`  AS SELECT `hw1_all_data_view`.`id` AS `id`, `hw1_all_data_view`.`FIO` AS `FIO`, `hw1_all_data_view`.`position` AS `position`, `hw1_all_data_view`.`qualification` AS `qualification`, `hw1_all_data_view`.`salary` AS `salary`, `hw1_all_data_view`.`department_number` AS `department_number` FROM `hw1_all_data_view` WHERE (`hw1_all_data_view`.`salary` > 500) ;

-- --------------------------------------------------------

--
-- Structure for view `hw1_unupdatable_view`
--
DROP TABLE IF EXISTS `hw1_unupdatable_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `hw1_unupdatable_view` (`FIO`, `position`, `qualification`, `department_number`) AS    select upper(`hw1_workers_private`.`FIO`) AS `UPPER(``FIO``)`,upper(`hw1_workers_public`.`position`) AS `UPPER(``position``)`,upper(`hw1_workers_public`.`qualification`) AS `UPPER(``qualification``)`,(`hw1_workers_public`.`department_number` * 2) AS ```department_number``*2` from (`hw1_workers_public` join `hw1_workers_private`) where (`hw1_workers_public`.`id` = `hw1_workers_private`.`id`)   ;

-- --------------------------------------------------------

--
-- Structure for view `hw1_updatable_view`
--
DROP TABLE IF EXISTS `hw1_updatable_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `hw1_updatable_view` (`FIO`, `position`, `qualification`, `department_number`) AS    select `hw1_workers_private`.`FIO` AS `FIO`,`hw1_workers_public`.`position` AS `position`,`hw1_workers_public`.`qualification` AS `qualification`,`hw1_workers_public`.`department_number` AS `department_number` from (`hw1_workers_public` join `hw1_workers_private`) where (`hw1_workers_public`.`id` = `hw1_workers_private`.`id`)   ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
