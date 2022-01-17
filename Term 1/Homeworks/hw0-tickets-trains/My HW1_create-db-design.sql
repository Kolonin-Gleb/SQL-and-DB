CREATE TABLE `trains` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`num` INT NOT NULL,
	`special_name` varchar(50) NOT NULL,
	`type` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `trains_schedule` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`arrival` TIME NOT NULL,
	`departure` TIME NOT NULL,
	`departure_point` TEXT NOT NULL,
	`destination_point` TEXT NOT NULL,
	`station` INT NOT NULL,
	`train_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `tickets` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`passenger_id` INT NOT NULL,
	`train_schedule_id` INT NOT NULL,
	`seat_number` INT NOT NULL,
	`wagon_number` INT NOT NULL,
	`price` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `passengers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`F` varchar(30) NOT NULL,
	`I` varchar(30) NOT NULL,
	`O` varchar(30) NOT NULL,
	`document_number` varchar(30) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `trains_schedule` ADD CONSTRAINT `trains_schedule_fk0` FOREIGN KEY (`train_id`) REFERENCES `trains`(`id`);

ALTER TABLE `tickets` ADD CONSTRAINT `tickets_fk0` FOREIGN KEY (`passenger_id`) REFERENCES `passengers`(`id`);

ALTER TABLE `tickets` ADD CONSTRAINT `tickets_fk1` FOREIGN KEY (`train_schedule_id`) REFERENCES `trains_schedule`(`id`);





