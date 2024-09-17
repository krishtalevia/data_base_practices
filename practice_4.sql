USE seschool_04;

-- 1.
SELECT `Users.name`
FROM `Users` 
	INNER JOIN `Reviews` ON `Users.id` = `Reviews.id_user`
	INNER JOIN `Orders` ON `Users.id` = `Orders.id_user`
WHERE `Reviews.score` > 4;

-- 2.
SELECT `Users.name`
FROM `Users`
	INNER JOIN `Orders` ON `Users.id` = `Orders.id_user`
WHERE `Orders.sum` > 1000;

-- 3
SELECT `Orders.id_user`, `Orders.sum`, `Orders.date`, `Users.name`
FROM `Orders`
	INNER JOIN `Users` ON `Orders.id` = `Orders.id_user`;

-- 4
SELECT `Users.name`, `Users.Country`
FROM `Users`
	INNER JOIN `Reviews` ON `Users.id` = `Reviews.user_id`
GROUP BY `Users.id`
HAVING COUNT(*) > 1;

-- 5
SELECT `Orders.sum`, `Orders.date`
FROM `Orders`
	INNER JOIN `Users` ON `Orders.id_user` = `Users.id`
	INNER JOIN `Revews` ON `Users.id` = `Reviews.user_id`
WHERE `Reviews.score` < 3;

-- 6
SELECT `Users.name`, `Reviews.text`
FROM `Users`
	INNER JOIN `Odrers` ON `Users.id` = `Orders.user_id`
	INNER JOIN `Reviews` ON `Users.id` = `Reviews.user_id`
WHERE `Orders.date` > '2024-09-01';

-- 7
SELECT `Users.name`, AVG(`Orders.sum`)
FROM `Users`
	INNER JOIN `Orders` ON `User.id` = `Orders.user_id`
GROUP BY `Orders.sum`;

-- 8
SELECT `Users.name`, `Users.country`
FROM `Users`
	INNER JOIN `Orders` ON `Users.id` = `Orders.user_id`
	INNER JOIN `Reviews` ON `Users.id` = `Reviews.id`
WHERE COUNT(`Orders.user_id`) > 1 AND `Reviews.score` > 3
AND `Users.country` = 'Россия';

-- 9
SELECT `Users.name`
FROM `Users`
	INNER JOIN `Reviews` ON `Users.id` = `Reviews.user_id`
GROUP BY `Users.name`
HAVING COUNT(*) < 0;

-- 10
SELECT `Reviews.text`
FROM `Reviews`
	INNER JOIN `Users` ON `Reviews.user_id` = `User.id`
	INNER JOIN `Orders` ON `Reviews.user_id` = `Orders.user_id`
WHERE `Orders.sum` < 2000;