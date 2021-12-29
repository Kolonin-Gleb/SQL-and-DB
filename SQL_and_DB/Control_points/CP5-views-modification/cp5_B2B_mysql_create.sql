CREATE TABLE `cp5_orders` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`worker_id` INT NOT NULL,
	`order_time` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cp5_categories` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cp5_companies` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cp5_workers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`company_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `cp5_workers` ADD COLUMN FIO VARCHAR (100);

CREATE TABLE `cp5_goods` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`category_id` INT NOT NULL,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cp5_orders_goods` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`order_id` INT NOT NULL,
	`good_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `cp5_orders` ADD CONSTRAINT `cp5_orders_fk0` FOREIGN KEY (`worker_id`) REFERENCES `cp5_workers`(`id`);

ALTER TABLE `cp5_workers` ADD CONSTRAINT `cp5_workers_fk0` FOREIGN KEY (`company_id`) REFERENCES `cp5_companies`(`id`);

ALTER TABLE `cp5_goods` ADD CONSTRAINT `cp5_goods_fk0` FOREIGN KEY (`category_id`) REFERENCES `cp5_categories`(`id`);

ALTER TABLE `cp5_orders_goods` ADD CONSTRAINT `cp5_orders_goods_fk0` FOREIGN KEY (`order_id`) REFERENCES `cp5_orders`(`id`);

ALTER TABLE `cp5_orders_goods` ADD CONSTRAINT `cp5_orders_goods_fk1` FOREIGN KEY (`good_id`) REFERENCES `cp5_goods`(`id`);









