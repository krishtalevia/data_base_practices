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