CREATE TABLE `cp2_trainers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`f` varchar(50) NOT NULL,
	`i` varchar(50) NOT NULL,
	`o` varchar(50) NOT NULL,
	`tel` varchar(50) NOT NULL,
	`specialization` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cp2_specializations` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cp2_clients` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`f` varchar(50) NOT NULL,
	`i` varchar(50) NOT NULL,
	`o` varchar(50) NOT NULL,
	`tel` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cp2_fit_centers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`adress` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cp2_trainings` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`dt` DATETIME NOT NULL,
	`fit_center_id` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `cp2_trainers` ADD CONSTRAINT `cp2_trainers_fk0` FOREIGN KEY (`specialization`) REFERENCES `cp2_specializations`(`name`);

ALTER TABLE `cp2_trainings` ADD CONSTRAINT `cp2_trainings_fk0` FOREIGN KEY (`fit_center_id`) REFERENCES `cp2_fit_centers`(`id`);






