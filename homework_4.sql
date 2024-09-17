-- Задачи

-- 1
SELECT `Players`.`player_name`, `Players`.`level`
FROM `Players`
GROUP BY `Players`;

-- 2
SELECT `Players`.`player_name`
FROM `Players`
WHERE `Guilds`.`guild_id` = 3;

-- 3
SELECT `Players`.`player_name`, `Players`.`level`
FROM `Players`
WHERE `level` >= 10;

-- 4
SELECT `Items`.`item_name`
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Players`.`player_name` = 'Алекс';

-- 5 
SELECT `Items`.`item_name`
FROM `Items`
WHERE `rarity` = 'Редкий';

-- 6
SELECT `Items`.`item_name`
FROM `Items`
WHERE `item_type` = 'Оружие';

--7
SELECT `Guilds`.`guild_name`, COUNT(`Players`.`player_id`)
FROM `Players`
JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
GROUP BY `Guilds`.`guild_name`;

-- 8
SELECT `Players`.`player_name`
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `item_type` = 'Броня';

-- 9
SELECT `Players`.`player_name`
FROM `Players`
JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `Players`.`level` > 5 AND `Guild`.`guild_level` >= 2
GROUP BY `Players`.`player_name`;

-- 10
SELECT `Players`.`player_name`
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Items`.`rarity` = 'Эпический'
GROUP BY `Players`.`player_name`;

-- 11
SELECT `Items`.`item_name`,
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Players`.`level` > 15
GROUP BY `Items`.`item_name`;

-- 12
SELECT `Items`.`item_name`
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `Guilds`.`guild_name` = 'Клан Дракона'
GROUP BY `Items`.`item_name`;

-- 13
SELECT `Players`.`player_name`
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
GROUP BY `Players`.`player_name`
HAVING COUNT(`item_id`) < 1;

-- 14
SELECT `Players`.`player_name`
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Items`.`item_type` = 'Зелье' AND `Players`.`level` > 8
GROUP BY `Players`.`player_name`;

-- 15
SELECT `Items`.`item_name`
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
WHERE `Guilds`.`guild_level` > 3
GROUP BY `Items`.`item_name`;

-- 16
SELECT `Players`.`player_name`
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
GROUP BY `Items`.`item_name`
HAVING `Players`.`experience_point` > 500
AND COUNT(`Items`.`item_type` = 'Оружие') >= 1;

-- 17
SELECT `Guilds.guild_name`
FROM `Players`
JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`guild_id`
GROUP BY `Guilds`.`guild_name`
HAVING COUNT(`Players`.`guild_id` > 1) = 0; 

-- 18
SELECT `Players`.`player_name`, `Items`.`item_name`
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Items`.`rarity` = `Редкий`
GROUP BY `Players`.`player_name`, `Items`.`item_name`;

-- 19
SELECT `Players`.`player_name`
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
GROUP BY `Players`.`player_name`
HAVING COUNT(`Items`.`item_type` = `Зелье`) < 1;
  
-- 20
SELECT `Players`.`player_name`
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Players`.`level` > 20
AND `Items`.`rarity` = 'Эпический'
GROUP BY `Players`.`player_name`
HAVING COUNT(`Items`.`item_id`) > 1;

-- Задачи на подзапросы

-- 1 
SELECT `Players`.`player_name`
FROM `Players`
WHERE `experience_point` > (
	SELECT `experience_point`
	FROM `Players`
	WHERE `player_name` = 'Марк'
);


-- 2 
SELECT `Players`.`player_name`
FROM `Players`
JOIN `Items` ON `Players`.`player_id` = `Items`.`player_id`
WHERE `Players`.`player_id` IN (
	SELECT `Items`.`player_id`
	FROM `Items`
	WHERE `Items`.`item_type` = 'Броня'
);

-- 3
SELECT `Items`.`item_name`
FROM `Items`
JOIN `Players` ON `Items`.`player_id` = `Players`.`player_id`
WHERE `Players`.`guild_id` = (
	SELECT `guild_id`
	FROM `Guilds`
	WHERE `level` = (SELECT MAX(`level`) FROM `Guilds`)
);
	