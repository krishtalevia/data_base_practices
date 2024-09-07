USE seschool_04;

CREATE TABLE Movies (
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100),
release_year YEAR,
genre VARCHAR(100),
rating DECIMAL(3,1) CHECK (rating BETWEEN 1.0 AND 10.0)
);

INSERT INTO Movies (title, release_year, genre, rating)
VALUES
('The Thing', 1982, 'Horror', 8.2),
('Alien', 1979, 'Sci-Fi', 8.5),
('The Terminator', 1984, 'Action', 8.1),
('Dune', 2021, 'Sci-Fi', 8.0),
('Blade Runner', 1982, 'Sci-Fi', 8.1),
('Titanic', 1997, 'Romance', 7.8),
('Gladiator', 2000, 'Action', 8.5),
('The Lord of the Rings: The Return of the King', 2003, 'Fantasy', 9.0),
('John Wick', 2014, 'Action', 7.4),
('Mad Max: Fury Road', 2015, 'Action', 8.1),
('La La Land', 2016, 'Musical', 8.0);

INSERT INTO Actors (full_name, birth_year, nationality)
VALUES
('Louis de Funès', 1914, 'French'),
('Pierre Richard', 1934, 'French'),
('Owen Wilson', 1968, 'American'),
('Ben Stiller', 1965, 'American'),
('Keanu Reeves', 1964, 'Canadian'),
('Denzel Washington', 1954, 'American'),
('Bob Odenkirk', 1962, 'American'),
('Bryan Cranston', 1956, 'American'),
('Aaron Paul', 1979, 'American'),
('Kurt Russell', 1951, 'American');

CREATE TABLE Actors (
id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(50) NOT NULL,
birth_year YEAR,
nationality VARCHAR(50)
);

CREATE TABLE Movie_Actors (
movie_id INT,
actor_id INT,
actor_role VARCHAR(50),
FOREIGN KEY (movie_id) REFERENCES Movies(id),
FOREIGN KEY (actor_id) REFERENCES Actors(id)
);

-- Задача №1.1
SELECT * FROM Movies
WHERE release_year > 2010 AND rating > 8.0
ORDER BY rating DESC;

-- Задача №1.2
SELECT genre
FROM Movies
GROUP BY genre
ORDER BY genre;

-- Задача №1.3
SELECT *
FROM Movies
ORDER BY rating DESC LIMIT 10;

-- Задача №1.4
SELECT * FROM Actors
WHERE birth_year < 1980
ORDER BY birth_year;

-- Задача №1.5
SELECT * FROM Movies
WHERE genre = 'Sci-Fi'
ORDER BY title;

-- Задача №1.6
SELECT * FROM Actors
GROUP BY nationality
ORDER BY nationality DESC;

-- Задача №1.7
SELECT title, rating FROM Movies
WHERE rating < 5.0
ORDER BY rating DESC;

-- Задача №1.8
SELECT * FROM Movies
ORDER BY release_year DESC
LIMIT 5;

-- Задача №1.9
SELECT * FROM Actors
ORDER BY birth_year ASC
LIMIT 3;