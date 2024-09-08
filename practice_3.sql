CREATE TABLE Customers (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
first_name VARCHAR(10),
gender VARCHAR(10),
age INT
);

CREATE TABLE Orders (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
customer_id INT NOT NULL,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

CREATE TABLE Dishes (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
dish_name VARCHAR(20),
price DECIMAL(5,2),
category VARCHAR(20)
);

CREATE TABLE Order_Dishes (
order_id INT,
dish_id INT,
quantity INT,
FOREIGN KEY (order_id) REFERENCES Orders(id),
FOREIGN KEY (dish_id) REFERENCES Dishes(id)
);

INSERT INTO Customers (first_name, gender, age) VALUES
('Иван', 'Мужской', 20),
('Степан', 'Мужской', 25),
('Евгения', 'Женский', 23),
('Мария', 'Женский', 30),
('Борис', 'Мужской', 55);

INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2024-09-01'),
(2, '2024-09-02'),
(3, '2024-09-03'),
(4, '2024-09-02'),
(5, '2024-09-05');

INSERT INTO Dishes (dish_name, price, category) VALUES
('Салат Цезарь', 10.0, 'Салат'),
('Маргарита', 12.5, 'Основное блюдо'),
('Чизкейк', 25.5, 'Десерт'),
('Греческий салат', 5.5, 'Салат'),
('Гренки', 8.5, 'Закуска');

INSERT INTO Order_Dishes (order_id, dish_id, quantity) 
VALUES
(1, 2, 2),
(2, 1, 1),
(3, 3, 3),
(4, 4, 1),
(5, 5, 2);

-- Задача №1
SELECT Customers.first_name, Orders.order_date
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.id
ORDER BY Customers.first_name, Orders.order_date;

-- Задача №2
SELECT Customers.first_name AS 'Имя клиента', Dishes.dish_name AS 'Название блюда'
FROM Order_Dishes
JOIN Orders ON Order_Dishes.order_id = Orders.id
JOIN Customers ON Orders.customer_id = Customers.id
JOIN Dishes ON Order_Dishes.dish_id = Dishes.id
ORDER BY Customers.first_name, Dishes.dish_name;

-- Задча №3
SELECT Customers.first_name AS 'Имя клиента', 
SUM(Dishes.price * Order_Dishes.quantity) AS 'Сумма всех заказов'
FROM Order_Dishes
JOIN Orders ON Order_Dishes.order_id = Orders.id
JOIN Customers ON Orders.customer_id = Customers.id
JOIN Dishes ON Order_Dishes.dish_id = Dishes.id
GROUP BY Customers.first_name
ORDER BY Dishes.price DESC;

-- Задача №4
SELECT Customers.first_name AS 'Имя клиента', Order_Dishes.quantity AS 'Кол-во блюд'
FROM Order_Dishes
JOIN Orders ON Order_Dishes.order_id = Orders.id
JOIN Customers ON Orders.customer_id = Customers.id
JOIN Dishes ON Order_Dishes.dish_id = Dishes.id
GROUP BY Customers.first_name
ORDER BY Order_Dishes.quantity DESC;


-- Задача №5
SELECT Dishes.dish_name AS 'Название блюда', Order_Dishes.quantity AS 'Кол-во заказов'
FROM Order_Dishes
JOIN Orders ON Order_Dishes.order_id = Orders.id
JOIN Dishes ON Order_Dishes.dish_id = Dishes.id
GROUP BY Dishes.dish_name
ORDER BY Order_Dishes.quantity DESC;

-- Задача №6
SELECT Customers.first_name
FROM Order_Dishes
JOIN Orders ON Order_Dishes.order_id = Orders.id
JOIN Dishes ON Order_Dishes.dish_id = Dishes.id
JOIN Customers ON Orders.customer_id = Customers.id
GROUP BY Customers.first_name
HAVING SUM(Dishes.price * Order_Dishes.quantity) > 50.0;

-- Задача №7
SELECT Customers.first_name AS 'Имя клиента', 
	Orders.order_date AS 'Дата', 
	Order_Dishes.quantity AS 'Кол-во'
FROM Order_Dishes
JOIN Orders ON Order_Dishes.order_id = Orders.id
JOIN Dishes ON Order_Dishes.dish_id = Dishes.id
JOIN Customers ON Orders.customer_id = Customers.id
GROUP BY Customers.first_name, Order_Dishes.quantity;

-- Задача №8
SELECT Dishes.category AS 'Категория',  
	Order_Dishes.quantity AS 'Кол-во'
FROM Order_Dishes
JOIN Orders ON Order_Dishes.order_id = Orders.id
JOIN Dishes ON Order_Dishes.dish_id = Dishes.id
GROUP BY Order_Dishes.quantity DESC;
