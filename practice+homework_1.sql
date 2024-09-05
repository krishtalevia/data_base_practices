-- В данном случае запросы не сохранялись

CREATE TABLE `Employees` (
	`EmployeeID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	`FirstName` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`LastName` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`DateOfBirth` DATE NOT NULL,
	`HireDate` DATE NOT NULL,
	`Salary` MEDIUMINT(9) NULL DEFAULT NULL,
	`Position` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`EmployeeID`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=11
;

CREATE TABLE `MonstersIncEmployees` (
	`EmployeeID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	`MonsterName` VARCHAR(75) NOT NULL COLLATE 'utf8_general_ci',
	`MonsterType` VARCHAR(10) NOT NULL DEFAULT 'Монстр' COLLATE 'utf8_general_ci',
	`Department` VARCHAR(100) NOT NULL DEFAULT 'Нулевой отдел' COLLATE 'utf8_general_ci',
	`ScareLevel` INT(11) NOT NULL,
	PRIMARY KEY (`EmployeeID`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=11
;

CREATE TABLE `books_table` (
	`NAME` VARCHAR(64) NOT NULL COLLATE 'utf8_general_ci',
	`Author` VARCHAR(64) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`Year` INT(10) UNSIGNED NULL DEFAULT NULL,
	`Reader` VARCHAR(64) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`Publisher` VARCHAR(64) NULL DEFAULT 'Художественная литература' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`NAME`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `students_table` (
	`StudentID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	`StudentName` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Sex` VARCHAR(1) NOT NULL COLLATE 'utf8_general_ci',
	`DateOfBirth` DATE NOT NULL,
	`IIAN` VARCHAR(15) NOT NULL COLLATE 'utf8_general_ci',
	`Course` TINYINT(4) NOT NULL,
	`StudentGroup` VARCHAR(7) NOT NULL COLLATE 'utf8_general_ci',
	`GPA` FLOAT NOT NULL,
	`Hobby` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`StudentID`) USING BTREE,
	UNIQUE INDEX `IIAN` (`IIAN`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=16
;
