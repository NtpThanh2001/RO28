-- Xoa Database di neu ton tai
Drop Database if EXISTS Testing_System_Assignment_1;

CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

-- Xoa bang neu ton tai
DROP TABLE if EXISTS `Department`;

CREATE TABLE `Department` (
	DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName nvarchar(30) NOT NULL UNIQUE KEY
);
    
DROP TABLE if EXISTS `Position`;
CREATE  TABLE `Position` (
	PositionID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

CREATE TABLE `Account` (
	AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) NOT NULL UNIQUE KEY,
    Username VARCHAR(30) NOT NULL UNIQUE KEY,
    FullName VARCHAR(30) NOT NULL UNIQUE KEY,
    DepartmentID TINYINT ,
    PositionID TINYINT ,
    CreateDate DATETIME,
    FOREIGN KEY (DepartmentID) REFERENCES `Department` (DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Posittion` (PositionID)
    -- lỗi 2 dòng foreign key, k chạy đc
);

CREATE TABLE `Group`(
	GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName nvarchar(30) NOT NULL,
    CreatorID INT,
    CreateDate DATETIME
);

CREATE TABLE `GroupAccount`(
	GroupID TINYINT,
    AccountID TINYINT,
    JoinDate DATETIME,
    CONSTRAINT FK_GROUPACCOUNT FOREIGN KEY (GroupID) REFERENCES `Group` (GroupID)
    -- lỗi khóa ngoại, k chạy đc
);

CREATE TABLE `TypeQuestion`(
	TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName ENUM('Essay','Multiple-Choice') NOT NULL
);

CREATE TABLE `CategoryQuestion`(
	CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName ENUM('Java', '.NET', 'SQL', 'Postman', 'Ruby') NOT NULL
);

CREATE TABLE `Question`(
	QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content NVARCHAR(30),
    CategoryID TINYINT,
    TypeID TINYINT,
    CreatorID INT,
    CreateDate DATETIME,
    FOREIGN KEY (TypeID) REFERENCES `TypeQuestion` (TypeID) ON DELETE NO ACTION ON  UPDATE NO ACTION,
	FOREIGN KEY (CategoryID) REFERENCES `CategoryQuestion` (CategoryID) ON DELETE NO ACTION ON UPDATE NO ACTION
	-- lỗi khóa ngoại, k chạy đc
);

CREATE TABLE `Answer`(
	AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(30),
    QuestionID INT,
    isCorrect BOOL,
    FOREIGN KEY (QuestionID) REFERENCES `Question` (QuestionID)
    -- lỗi khóa ngoại
);

CREATE TABLE `Exam` (
	ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    sCode VARCHAR(30),
    Title VARCHAR (30),
    CategoryID TINYINT,
    Duration TIME,
    CreatorID INT,
    CreateDate DATETIME
);

CREATE TABLE `ExamQuestion`(
	ExamID TINYINT,
    QuestionID TINYINT,
    FOREIGN KEY (ExamID) REFERENCES `Exam` (ExamID),
    FOREIGN KEY (QuestionID) REFERENCES `Question` (QuestionID)
    -- lỗi khóa ngoại
);
    
    