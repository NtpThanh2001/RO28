-- Xoa Database di neu ton tai
DROP DATABASE IF EXISTS Testing_System_Assignment_1;

CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

-- Xoa bang neu ton tai
DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department` (
	DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE KEY
);
   

DROP TABLE IF EXISTS `Position`;
CREATE  TABLE `Position` (
	PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
	AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) NOT NULL UNIQUE KEY,
    Username VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName VARCHAR(100) NOT NULL UNIQUE KEY,
    DepartmentID TINYINT UNSIGNED NOT NULL,
    PositionID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES `Department`(DepartmentID) ON DELETE CASCADE,
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(50) NOT NULL,
    CreatorID TINYINT,
    CreateDate DATETIME DEFAULT NOW()
);

DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount`(
	GroupID TINYINT UNSIGNED NOT NULL,
    AccountID TINYINT UNSIGNED NOT NULL,
    JoinDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (GroupID) REFERENCES `Group` (GroupID) ON DELETE CASCADE,
    FOREIGN KEY (AccountID) REFERENCES `Account` (AccountID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `TypeQuestion`;
CREATE TABLE `TypeQuestion`(
	TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName ENUM('Essay','Multiple-Choice') NOT NULL
);

DROP TABLE IF EXISTS `CategoryQuestion`;
CREATE TABLE `CategoryQuestion`(
	CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS `Question`;
CREATE TABLE `Question`(
	QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(50),
    CategoryID TINYINT UNSIGNED,
    TypeID TINYINT UNSIGNED,
    CreatorID TINYINT,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (TypeID) REFERENCES `TypeQuestion` (TypeID) ON DELETE CASCADE,
	FOREIGN KEY (CategoryID) REFERENCES `CategoryQuestion` (CategoryID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `Answer`;
CREATE TABLE `Answer`(
	AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(50),
    QuestionID TINYINT UNSIGNED,
    isCorrect BOOL,
    FOREIGN KEY (QuestionID) REFERENCES `Question` (QuestionID)
);

DROP TABLE IF EXISTS `Exam`;
CREATE TABLE `Exam` (
	ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    sCode VARCHAR(50),
    Title VARCHAR (50),
    CategoryID TINYINT,
    Duration TINYINT,
    CreatorID TINYINT,
    CreateDate DATETIME DEFAULT NOW()
);

DROP TABLE if EXISTS `ExamQuestion`;
CREATE TABLE `ExamQuestion`(
	ExamID TINYINT UNSIGNED,
    QuestionID TINYINT UNSIGNED,
    FOREIGN KEY (ExamID) REFERENCES `Exam` (ExamID) ON DELETE CASCADE,
    FOREIGN KEY (QuestionID) REFERENCES `Question` (QuestionID) ON DELETE CASCADE
);

-- Thêm dữ liệu vào các bảng
INSERT INTO `Department`(DepartmentName)
VALUES
	('Marketing'),
    ('Sale'),
    ('Bảo vệ'),
    ('Nhân sự'),
    ('Kỹ thuật'),
    ('Tài chính'),
    ('Phó giám đốc'),
    ('Giám đốc'),
    ('Thư kí'),
    ('No person'),
    ('Bán hàng');
    
INSERT INTO `Position`(PositionName)
VALUES 
	('Dev'),
    ('Test'),
    ('Scrum Master'),
    ('PM');
    
INSERT INTO `Account`(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
VALUES 
	('Email1@gmail.com', 'Username1', 'Fullname1', 5, 1, '2020-03-05'),
    ('Email2@gmail.com', 'Username2', 'Fullname2', 1, 2, '2020-03-05'),
    ('Email3@gmail.com', 'Username3', 'Fullname3', 2, 2, '2020-03-07'),
    ('Email4@gmail.com', 'Username4', 'Fullname4', 3, 4, '2020-03-08'),
    ('Email5@gmail.com', 'Username5', 'Fullname5', 4, 4, '2020-03-10'),
    ('Email6@gmail.com', 'Username6', 'Fullname6', 6, 3, '2020-04-05'),
    ('Email7@gmail.com', 'Username7', 'Fullname7', 2, 2, NULL),
    ('Email8@gmail.com', 'Username8', 'Fullname8', 8, 1, '2020-04-07'),
    ('Email9@gmail.com', 'Username9', 'Fullname9', 2, 2, '2020-04-07'),
    ('Email10@gmail.com', 'Username10', 'Fullname10', 10, 1, '2020-04-09'),
    ('Email11@gmail.com', 'Username11', 'Fullname11', 10, 1, DEFAULT),
    ('Email12@gmail.com', 'Username12', 'Fullname12', 10, 1, DEFAULT);
    
INSERT INTO `Group`(GroupName, CreatorID, CreateDate)
VALUES 
	('Testing System', 5, '2019-03-05'),
    ('Development', 1, '2020-03-07'),
    ('VTI Sale 01', 2, '2020-03-09'),
    ('VTI Sale 02', 3, '2020-03-10'),
    ('VTI Sale 03', 4, '2020-03-28'),
    ('VTI Creator', 6, '2020-04-06'),
    ('VTI Marketing 01', 7, '2020-04-07'),
    ('Management', 8, '2020-04-08'),
    ('Chat with love', 9, '2020-04-09'),
    ('Vi Ti Ai', 10, '2020-04-10');
    
INSERT INTO `GroupAccount`(GroupID, AccountID, JoinDate)
VALUES 
	(1, 1, '2019-03-05'),
    (1, 2, '2020-03-07'),
    (3, 3, '2020-03-09'),
    (3, 4, '2020-03-10'),
    (5, 5, '2020-03-28'),
    (1, 3, '2020-04-06'),
    (1, 7, '2020-04-07'),
    (8, 3, '2020-04-08'),
    (1, 9, '2020-04-09'),
    (10, 10, '2020-04-10');
    
INSERT INTO TypeQuestion(TypeName)
VALUES
	('Essay'),
    ('Multiple-Choice');
    
INSERT INTO CategoryQuestion(CategoryName)
VALUES
	('Java'),
    ('ASP.NET'),
    ('ADO.NET'),
    ('SQL'),
    ('Postman'),
    ('Ruby'),
    ('Python'),
    ('C++'),
    ('C Sharp'),
    ('PHP');
    
INSERT INTO Question(Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES 
	('Câu hỏi về Java', 1, '1', '2', '2020-04-05'),
    ('Câu Hỏi về PHP', 10, '2', '2', '2020-04-05'),
    ('Hỏi về C#', 9, '2', '3', '2020-04-06'),
    ('Hỏi về Ruby', 6, '1', '4', '2020-04-06'),
    ('Hỏi về Postman', 5, '1', '5', '2020-04-06'),
    ('Hỏi về ADO.NET', 3, '2', '6', '2020-04-06'),
    ('Hỏi về ASP.NET', 2, '1', '7', '2020-04-06'),
    ('Hỏi về C++', 8, '1', '8', '2020-04-07'),
    ('Hỏi về SQL', 4, '2', '9', '2020-04-07'),
    ('Hỏi về Python', 7, '1', '10', '2020-04-07');
    
INSERT INTO Answer(Content, QuestionID, isCorrect)
VALUES
	('Trả lời 01', 1, 0),
    ('Trả lời 02', 1, 1),
    ('Trả lời 03', 1, 0),
    ('Trả lời 04', 1, 1),
    ('Trả lời 05', 2, 1),
    ('Trả lời 06', 3, 1),
    ('Trả lời 07', 4, 0),
    ('Trả lời 08', 8, 0),
    ('Trả lời 09', 9, 1),
    ('Trả lời 10', 10, 1);
    
INSERT INTO Exam (sCode, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES 
	('VTIQ001', 'Đề thi C#', 1, 60, '5', '2019-04-05'),
    ('VTIQ002', 'Đề thi PHP', 10, 60, '2', '2019-04-05'),
    ('VTIQ003', 'Đề thi C++', 9, 120, '2', '2019-04-07'),
    ('VTIQ004', 'Đề thi Java', 6, 60, '3', '2020-04-08'),
    ('VTIQ005', 'Đề thi Ruby', 5, 120, '4', '2020-04-10'),
    ('VTIQ006', 'Đề thi Postman', 3,60,'6', '2020-04-05'),
    ('VTIQ007', 'Đề thi SQL', 2, 60, '7', '2020-04-05'),
    ('VTIQ008', 'Đề thi Python', 8, 60, '8', '2020-04-07'),
    ('VTIQ009', 'Đề thi ADO.NET', 4, 90, '9', '2020-04-07'),
    ('VTIQ010', 'Đề thi ASP.NET', 7, 90, '10', '2020-04-08');
    
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUES 
	(1, 5),
    (2, 10),
    (3, 4),
    (4, 3),
    (5, 7),
    (6, 10),
    (7, 2),
    (8, 10),
    (9, 9),
    (10, 8);


