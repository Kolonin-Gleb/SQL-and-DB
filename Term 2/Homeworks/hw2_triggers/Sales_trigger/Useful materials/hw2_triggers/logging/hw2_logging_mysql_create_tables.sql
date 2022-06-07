CREATE TABLE `hw2_news` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` varchar(60) NOT NULL,
	`info` varchar(255) NOT NULL,
	`dt` DATE NOT NULL,
	`author` varchar(60) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `hw2_logging` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`news_id` INT NOT NULL,
	`dt_before_change` DATE NOT NULL,
	`dt_after_change` DATE NOT NULL,
	`title_before_change` varchar(60) NOT NULL,
	`title_after_change` varchar(60) NOT NULL,
	`info_before_change` varchar(255) NOT NULL,
	`info_after_change` varchar(255) NOT NULL,
	`dt_edition` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `hw2_logging` ADD CONSTRAINT `hw2_logging_fk0` FOREIGN KEY (`news_id`) REFERENCES `hw2_news`(`id`);



