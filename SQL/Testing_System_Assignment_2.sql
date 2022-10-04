DROP DATABASE IF EXISTS Testing_System_Assignment_2;

CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;

-- Exercise 1
DROP TABLE IF EXISTS `Trainee`;
CREATE TABLE `Trainee` (
	TraineeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(50) NOT NULL,
    Birth_Date DATETIME DEFAULT NOW(),
    Gender ENUM ('Male','Female', 'Unknown') NOT NULL,
	ET_IQ INT CHECK (ET_IQ BETWEEN 1 AND 20) NOT NULL,
    ET_Gmath INT CHECK (ET_Gmath BETWEEN 1 AND 20) NOT NULL,
    ET_English INT CHECK (ET_English BETWEEN 1 AND 50) NOT NULL, 
    Traning_Class TINYINT NOT NULL,
    Evaluation_Notes VARCHAR(100)
);

ALTER TABLE `Trainee`
ADD VTI_Account VARCHAR(50) NOT NULL UNIQUE;

-- Exercise 2
DROP TABLE IF EXISTS `Fresher_1`;
CREATE TABLE `Fresher_1`(
	FresherID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FresherName VARCHAR(50),
    `Code` VARCHAR(5),
    ModifiedDate DATETIME DEFAULT NOW()
);

-- Exercise 3
DROP TABLE IF EXISTS `Fresher_2`;
CREATE TABLE `Fresher_2`(
	FresherID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
);


