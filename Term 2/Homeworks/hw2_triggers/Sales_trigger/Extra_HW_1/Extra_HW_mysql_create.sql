CREATE TABLE `shops` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `workers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`shop_id` INT NOT NULL,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `shops_sales` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`shop_id` INT NOT NULL,
	`dt` DATETIME NOT NULL,
	`shop_plan` INT NOT NULL,
	`cur_sales` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `workers_sales` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`worker_id` INT NOT NULL,
	`dt` DATETIME NOT NULL,
	`worker_plan` INT NOT NULL,
	`cur_sales` INT NOT NULL,
	`score` INT NOT NULL,
	`fixed_salary` FLOAT NOT NULL,
	`income` FLOAT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `workers` ADD CONSTRAINT `workers_fk0` FOREIGN KEY (`shop_id`) REFERENCES `shops`(`id`);

ALTER TABLE `shops_sales` ADD CONSTRAINT `shops_sales_fk0` FOREIGN KEY (`shop_id`) REFERENCES `shops`(`id`);

ALTER TABLE `workers_sales` ADD CONSTRAINT `workers_sales_fk0` FOREIGN KEY (`worker_id`) REFERENCES `workers`(`id`);

