USE Testing_System_Assignment_1;

-- Câu 1: Viết lệnh lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT `Account`.FullName, `Department`.DepartmentName
FROM `Account`
INNER JOIN `Department` ON `Account`.DepartmentID=`Department`.DepartmentID;

-- Câu 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT * FROM `Account`
WHERE CreateDate > '2019-12-20';

-- Câu 3: Viết lệnh để lấy ra tất cả các developer
SELECT P.PositionName, A.FullName
FROM `Position` P
JOIN `Account` A ON P.PositionID = A.PositionID
WHERE PositionName = 'Dev';

-- Câu 4: VIết lệnh lấy ra danh sách các phòng ban có >3 nhân viên
SELECT D.DepartmentName
FROM `Department` D
JOIN `Account` A ON A.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentID
HAVING COUNT(A.DepartmentID) > 3;

-- Câu 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
WITH `CTE_COUNT_Q` AS(
	SELECT Q.QuestionID, Q.Content, COUNT(Q.QuestionID) AS SL
    FROM `Question`  Q
    JOIN `ExamQuestion` EQ ON Q.QuestionID=EQ.QuestionID
    GROUP BY EQ.QuestionID
)
SELECT * FROM `CTE_COUNT_Q` 
WHERE SL = (SELECT MAX(SL) FROM `CTE_COUNT_Q`);

-- Câu 6: Thống kê mỗi category question được sử dụng trong bao nhiêu question
	-- k hiểu câu hỏi

-- Cau 7: Thống kê mỗi Question đc sử dụng trong bao nhiêu Exam
SELECT CQ.CategoryID, CQ.CategoryName, COUNT(Q.CategoryID)
FROM `CategoryQuestion` CQ
JOIN `Question` Q ON CQ.CategoryID = Q.CategoryID
GROUP BY CQ.CategoryID;

-- Câu 8: Lấy ra Question có nhiều câu trả lời nhất 
WITH `CTE_COUNT_Q` AS(
	SELECT Q.Content, COUNT(Q.QuestionID) AS SL
    FROM `Question`  Q
    JOIN `Answer` A ON Q.QuestionID=A.QuestionID
    GROUP BY Q.CategoryID
)
SELECT * FROM `CTE_COUNT_Q` 
WHERE SL = (SELECT MAX(SL) FROM `CTE_COUNT_Q`);

-- Câu 9: Thống kê số lượng account trong mỗi group
SELECT G.GroupName, COUNT(GA.GroupID) AS SLGA
FROM `Group` G
JOIN `GroupAccount` GA ON G.GroupID = GA.GroupID
GROUP BY G.GroupID;

-- Câu 10: Tìm chức vụ có ít người nhất 
WITH `CTE_COUNT_PA` AS(
	SELECT P.PositionName, COUNT(A.PositionID) AS SLPA
    FROM `Position` P
    JOIN `Account` A ON P.PositionID=A.PositionID
    GROUP BY A.PositionID
)
SELECT * FROM `CTE_COUNT_PA` 
WHERE SLPA = (SELECT MIN(SLPA) FROM `CTE_COUNT_PA`);

-- Câu 11: Thống kê mỗi phòng ban có bao nhiêu DEV, TEST, SCRUM MASTER, PM
WITH `CTE_COUNT_PA` AS(
	SELECT P.PositionName, COUNT(A.PositionID) AS SLPA
    FROM `Position` P
    JOIN `Account` A ON P.PositionID=A.PositionID
    GROUP BY A.PositionID
)
SELECT * FROM `CTE_COUNT_PA`;
WITH `CTE_COUNT_DA` AS(
	SELECT D.DepartmentName, COUNT(D.DepartmentID) AS SLDA
    FROM `Department` D
    JOIN `Account` A ON D.DepartmentID=A.DepartmentID
    GROUP BY A.DepartmentID
)
SELECT * FROM `CTE_COUNT_DA`;

-- Câu 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì,...
WITH QT AS(
	SELECT Q.Content, T.TypeName, Q.CreatorID 
	FROM `Question` Q
	JOIN `TypeQuestion` T ON T.TypeID = Q.TypeID
)
SELECT * FROM QT;
-- kbt cách liên kết 3 bảng

-- Câu 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm 
SELECT T.TypeName, COUNT(Q.TypeID)
FROM `TypeQuestion` T
JOIN `Question` Q ON T.TypeID = Q.TypeID
GROUP BY Q.TypeID;

-- Câu 14+15: Lấy ra group k có account nào
SELECT G.GroupName, COUNT(GA.AccountID)
FROM `Group` G
JOIN `GroupAccount` GA ON G.GroupID = GA.GroupID
GROUP BY G.GroupID
HAVING COUNT(GA.AccountID) = 0 OR COUNT(GA.AccountID) = NULL;
-- Điều kiện HAVING chưa đúng nên chạy k hiện dữ liệu

-- Câu 16:Lấy ra question k có answer nào 
-- Cach 1
SELECT Q.Content, COUNT(A.QuestionID) AS SL
FROM `Question` Q
JOIN `Answer` A ON Q.QuestionID = A.QuestionID
GROUP BY A.QuestionID
HAVING SL = 0 OR SL = NULL;

-- Cach 2
WITH `CTE_COUNT_PA` AS(
	SELECT Q.Content, COUNT(A.QuestionID) AS SL
	FROM `Question` Q
	JOIN `Answer` A ON Q.QuestionID = A.QuestionID
	GROUP BY A.QuestionID
)
SELECT * FROM `CTE_COUNT_PA` 
WHERE SL = 0 OR NULL;
-- Cả 2 cách Câu lệnh Where đều k đúng nên k hiện dữ liệu

-- Câu 17: 
-- a) Lấy các account thuộc nhóm thứ 1
-- b) Lấy các account thuộc nhóm thứ 2
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau

-- Câu 18: 
-- a) Lấy các group có lớn hơn 5 thành viên
WITH a AS(
	SELECT G.GroupName, COUNT(GA.AccountID)
	FROM `Group` G
	JOIN `GroupAccount` GA ON G.GroupID = GA.GroupID
	GROUP BY G.GroupID
)
SELECT * FROM a
WHERE COUNT(GA.AccountID) > 5;

-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT G.GroupName, COUNT(GA.AccountID)
FROM `Group` G
JOIN `GroupAccount` GA ON G.GroupID = GA.GroupID
GROUP BY G.GroupID
HAVING COUNT(GA.AccountID) < 7;

-- c) Ghép 2 kết quả từ câu a) và câu b)
