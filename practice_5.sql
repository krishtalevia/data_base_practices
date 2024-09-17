-- 1
SELECT *
FROM `products`
WHERE `price` > (SELECT AVG(`price`) FROM `products`);

-- 2
SELECT `categories`.`category_name`
FROM `categories`
	WHERE category_id IN
		(SELECT category_id FROM products WHERE price > 100);

-- 3
SELECT `products`.`product_name`, (
	SELECT COUNT(*)
	FROM `products` AS `this_product`
	WHERE `this_product`.`category_id` = `products`.`category_id`)
GROUP BY `products`.`product_name`;

-- 4
SELECT `products`.*
FROM `products`
GROUP BY `products`.`product_name`
HAVING `price` > (SELECT AVG(`price`) FROM `products`.`category_id`);

-- 5
SELECT `categories`.`category_name`
FROM `categories`
	JOIN `products` ON `categories`.`category_id` = `products`.`product_id`
GROUP BY `categories`.`category_name`
HAVING AVG(`price`) > (SELECT AVG(`price`) FROM `categories`);

-- 6
SELECT `categories`.`category_name`, (
	SELECT MAX(`price`) IN `categories`.`category_id`)
FROM `categories`
GROUP BY `categories`;

-- 7
SELECT `products`.*
FROM `products`
GROUP BY `category_id`
HAVING `price` = (
	SELECT MAX(`price`)
	FROM `products`
	GROUP BY `category_id`
	);

-- 8
SELECT *
FROM `products`
GROUP BY `category_id`
HAVING COUNT(*) > AVG((SELECT COUNT(*) FROM `products` GROUP BY `category_id`));

-- 9
SELECT `products`.`product_name`, `products`.`price`
FROM `products`
WHERE `products`.`price` > (
	SELECT AVG(`p2`.`price`) 
	FROM `products` AS `p2` 
	WHERE `p2`.`category_id` = `products`.`category_id`
);

-- 10
SELECT `products`.*
FROM `products`
GROUP BY `category_id`
HAVING MIN(`price`) > (
	SELECT AVG(`price`)
	FROM `products`
);

-- 11
SELECT `product_name`, `price`
FROM `products`
WHERE `price` < (
	SELECT MIN(`price`)
	FROM `products`
	GROUP BY `category_id`
	ORDER BY MIN(`price`)
);

-- 12
SELECT `categories`.*
FROM `categories`
GROUP BY `category_id`
HAVING COUNT(`product_id`) = MAX((SELECT(`product_id` FROM `products`
	GROUP BY `category_id`));
	
-- 13
SELECT `products`.*
FROM `products` AS `this_products`
WHERE `price` < (SELECT MIN(`price`)
	FROM `products`
	WHERE `category_id` != `this_products`.`category_id`
	);
	
-- 14
SELECT `categories`.*
FROM `categories`
JOIN `products` ON `products`.`category_id` = `categories`.`category_id`
GROUP BY `categories`.`category_id`
HAVING COUNT(`product_id`) < (SELECT MIN(`product_count`)
	FROM (SELECT COUNT(`product_id`) AS `product_count`
	FROM `products`
	GROUP BY `category_id`));
	
-- 15
SELECT `products`.*
FROM `products`
WHERE `price` > AVG(
	(SELECT `price` 
	FROM `products`
	GROUP BY `category_id`
	HAVING COUNT(*) > 5));

-- 16
SELECT `categories`.*
FROM `categories`
JOIN `products` ON `products`.`category_id` = `categories`.`category_id`
GROUP BY `categories`.`category_id`
WHERE `category_id` IN (
	SELECT `category_id`
	FROM `products`
	WHERE `price` > 200);
	
-- 17
SELECT `products`.* 
FROM `products` AS `this_products`
GROUP BY `products`.`product_name`
HAVING `price` > (
	SELECT MAX(`price`) 
	FROM `products` AS `another_products`
	WHERE `this_products` != `another_products`.`category_id`

-- 18
SELECT `categories`.*
FROM `categories`
JOIN `products` ON `products`.`category_id` = `categories`.`category_id`
GROUP BY `categories`.`category_name`
HAVING `category_id` IN (
	SELECT `category_id`
	FROM `products`
	GROUP BY `category_id`
	HAVING AVG(`price`) > 150);
	
-- 19
SELECT `products`.*
FROM `products` AS `this_products`
GROUP BY `products`.`products_name`
HAVING `products`.`price` < (
	SELECT MIN(`products`.`price`)
	FROM `products`
	WHERE `products`.`category_id` = `this_products`.`category_id`)
	* 2);

-- 20
SELECT `categories`.*
FROM `categories`
JOIN `products` ON `products`.`category_id` = `categories`.`category_id`
GROUP BY `categories`.`category_id`
HAVING COUNT(`product_id`) > (
	SELECT AVG(`product_count`)
	FROM (
		SELECT COUNT(`product_id`) AS `product_count`
		FROM `products`
		GROUP BY `categories`.`category_id`) AS `category_count`)
	AND AVG(`price`) < (
		SELECT AVG(`price`)
		FROM `products`);
	