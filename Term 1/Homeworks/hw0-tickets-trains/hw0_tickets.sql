-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 29, 2021 at 07:30 AM
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
-- Database: `hw0_tickets`
--

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `id` int NOT NULL,
  `F` varchar(30) NOT NULL,
  `I` varchar(30) NOT NULL,
  `O` varchar(30) NOT NULL,
  `document_number` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`id`, `F`, `I`, `O`, `document_number`) VALUES
(1, 'Kolonin', 'Gleb', 'Semyonovich', '22 11 2004');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int NOT NULL,
  `passenger_id` int NOT NULL,
  `train_schedule_id` int NOT NULL,
  `seat_number` int NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `passenger_id`, `train_schedule_id`, `seat_number`, `price`) VALUES
(1, 1, 1, 24, 500);

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `id` int NOT NULL,
  `num` int NOT NULL,
  `special_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`id`, `num`, `special_name`, `type`) VALUES
(1, 24, 'Lockheed TT', 'Express');

-- --------------------------------------------------------

--
-- Table structure for table `trains_schedule`
--

CREATE TABLE `trains_schedule` (
  `id` int NOT NULL,
  `arrival` time NOT NULL,
  `departure` time NOT NULL,
  `departure_point` text NOT NULL,
  `destination_point` text NOT NULL,
  `station` int DEFAULT NULL,
  `train_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trains_schedule`
--

INSERT INTO `trains_schedule` (`id`, `arrival`, `departure`, `departure_point`, `destination_point`, `station`, `train_id`) VALUES
(1, '07:30:00', '08:00:00', 'Washington', 'New York ', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_fk0` (`passenger_id`),
  ADD KEY `tickets_fk1` (`train_schedule_id`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trains_schedule`
--
ALTER TABLE `trains_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trains_schedule_fk0` (`train_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trains`
--
ALTER TABLE `trains`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trains_schedule`
--
ALTER TABLE `trains_schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_fk0` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`),
  ADD CONSTRAINT `tickets_fk1` FOREIGN KEY (`train_schedule_id`) REFERENCES `trains_schedule` (`id`);

--
-- Constraints for table `trains_schedule`
--
ALTER TABLE `trains_schedule`
  ADD CONSTRAINT `trains_schedule_fk0` FOREIGN KEY (`train_id`) REFERENCES `trains` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
