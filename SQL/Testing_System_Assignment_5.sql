USE Testing_System_Assignment_1;

-- Câu 1: Tạo view chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW Department_Sale AS
SELECT A.FullName, D.DepartmentName
FROM `Account` A
JOIN `Department` D 
ON D.DepartmentID = A.DepartmentID
WHERE D.DepartmentName = 'Sale';
SELECT * FROM Department_Sale;

-- Câu 2: Tạo view chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW Account_GroupMax AS
WITH `CTE_COUNT_Account` AS(
	SELECT A.FullName, COUNT(GA.GroupID) AS SL
    FROM `Account` A
    JOIN `GroupAccount` GA ON A.AccountID = GA.AccountID
    GROUP BY GA.GroupID
)
SELECT * FROM `CTE_COUNT_Account`
WHERE SL = (SELECT MAX(SL) FROM `CTE_COUNT_Account`);
SELECT * FROM Account_GroupMax;

-- Câu 3: Tạo view chứa câu hỏi có những content quá dài( content quá 300 từ được coi là quá dài) và xóa nó đi
CREATE VIEW Content_Max AS
SELECT Content
FROM `Question`
WHERE LENGTH(Content) > 300;
SELECT * FROM Content_Max;
DROP VIEW Content_Max;

-- Câu 4: Tạo view chứa danh sách các phòng ban có nhiều nhân viên nhất 
CREATE VIEW Department_Max AS
WITH `CTE_COUNT_Department` AS(
	SELECT D.DepartmentName, COUNT(A.DepartmentID) AS SL
    FROM `Department` D 
    JOIN `Account` A ON A.DepartmentID = D.DepartmentID
    GROUP BY A.DepartmentID
)
SELECT * FROM `CTE_COUNT_Department`
WHERE SL = (SELECT MAX(SL) FROM `CTE_COUNT_Department`);
SELECT * FROM Department_Max;

-- Câu 5: Tạo view chứa tất cả các câu hỏi do user họ Nguyễn tạo
CREATE VIEW Creator_Nguyen AS
SELECT Q.Content
FROM `Question` Q
WHERE CreatorID = 'Nguyen';
SELECT * FROM Creator_Nguyen;
-- kbt cach lam