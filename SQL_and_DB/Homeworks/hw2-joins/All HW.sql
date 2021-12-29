-- create and fill tables

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
(4, 'Системный администратор', 'Windows, Linux', '128'),
(5, 'Дизайнер', 'Paint', '72'),
(6, 'Дизайнер', 'Paint3D', '72');

CREATE TABLE `hw2_workers_private` (
  `id` int DEFAULT NULL,
  `FIO` varchar(100) DEFAULT NULL
);

INSERT INTO `hw2_workers_private` (`id`, `FIO`) VALUES
(1, 'Колонин Глеб Семёнович'),
(2, 'Сергеева С.С'),
(3, 'Петров П.П.'),
(4, 'Николаев Н.Н.'),
(7, 'Молчанов Игорь Александрович'),
(10, 'Валынов Дмитрий Олегович');

-- create views

CREATE OR REPLACE VIEW hw2_full_join (FIO, postition) AS 

SELECT
    hw2_workers_private.FIO,
    hw2_workers_public.qualification
FROM
    hw2_workers_public
LEFT OUTER JOIN hw2_workers_private ON hw2_workers_private.id = hw2_workers_public.id
UNION

SELECT
    hw2_workers_private.FIO,
    hw2_workers_public.qualification
FROM
    hw2_workers_public
RIGHT OUTER JOIN hw2_workers_private ON hw2_workers_private.id = hw2_workers_public.id;

CREATE OR REPLACE VIEW hw2_full_null_join (FIO, postition) AS 

SELECT
    hw2_workers_private.FIO,
    hw2_workers_public.qualification
FROM
    hw2_workers_public
LEFT OUTER JOIN hw2_workers_private ON hw2_workers_private.id = hw2_workers_public.id
WHERE hw2_workers_private.id IS NULL
UNION
SELECT
    hw2_workers_private.FIO,
    hw2_workers_public.qualification
FROM
    hw2_workers_public
RIGHT OUTER JOIN hw2_workers_private ON hw2_workers_private.id = hw2_workers_public.id
WHERE hw2_workers_public.id IS NULL;


CREATE OR REPLACE VIEW hw2_inner_join (FIO, postition) AS 

SELECT
    hw2_workers_private.FIO,
    hw2_workers_public.position
FROM
    hw2_workers_public
INNER JOIN hw2_workers_private ON hw2_workers_private.id = hw2_workers_public.id;


CREATE OR REPLACE VIEW hw2_left_join (FIO, postition) AS 

SELECT
    hw2_workers_private.FIO,
    hw2_workers_public.position
FROM
    hw2_workers_public
LEFT JOIN hw2_workers_private ON hw2_workers_private.id = hw2_workers_public.id;


CREATE OR REPLACE VIEW hw2_left_null_join (FIO, postition) AS 

SELECT
    hw2_workers_private.FIO AS,
    hw2_workers_public.position
FROM
    hw2_workers_public
LEFT JOIN hw2_workers_private ON hw2_workers_private.id = hw2_workers_public.id
WHERE hw2_workers_private.id IS NULL;


CREATE OR REPLACE VIEW hw2_right_join (FIO, postition) AS 

SELECT
    hw2_workers_private.FIO,
    hw2_workers_public.position
FROM
    hw2_workers_public
RIGHT JOIN hw2_workers_private ON hw2_workers_private.id = hw2_workers_public.id;


CREATE OR REPLACE VIEW hw2_right_null_join (FIO, postition) AS 
SELECT
    hw2_workers_private.FIO,
    hw2_workers_public.position
FROM
    hw2_workers_public
RIGHT JOIN hw2_workers_private ON hw2_workers_private.id = hw2_workers_public.id
WHERE hw2_workers_public.id IS NULL;