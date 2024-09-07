USE seschool_04;

CREATE TABLE Movies (
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100),
release_year YEAR,
genre VARCHAR(100),
rating DECIMAL(3,1) CHECK (rating BETWEEN 1.0 AND 10.0)
);
