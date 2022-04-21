CREATE TABLE `hw3_pricing` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`day_of_week` varchar(255) NOT NULL,
	`beg_time1` TIME NOT NULL,
	`end_time1` TIME NOT NULL,
	`price1` FLOAT NOT NULL,
	`beg_time2` TIME,
	`end_time2` TIME,
	`price2` FLOAT,
	`beg_time3` TIME,
	`end_time3` TIME,
	`price3` FLOAT,
	PRIMARY KEY (`id`)
);


