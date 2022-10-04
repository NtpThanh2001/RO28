USE Testing_System_Assignment_1;

-- Câu 1: Thêm ít nhất 10 record vào mỗi table

-- Câu 2: Lấy ra tất cả các phòng ban 
SELECT * FROM `Department`;

-- Câu 3: Lấy ra id phòng ban sale
SELECT DepartmentID
FROM `Department` 
WHERE DepartmentName = 'Sale';

-- Câu 4: Lấy ra thông tin account có fullname dài nhất
SELECT * FROM `Account`
WHERE length(Fullname) = (SELECT MAX(length(Fullname)) FROM `Account`);

-- Câu 5: Lấy ra thông tin account có fullname dài nhất và thuộc phòng ban có id = 3
SELECT * FROM `Account`
WHERE length(Fullname) = (SELECT MAX(length(Fullname)) FROM `Account`) AND DepartmentID = 3;

-- Câu 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT GroupName
FROM `Group`
WHERE CreateDate < '2019-12-20';

-- Câu 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT QuestionID
FROM `Answer`
GROUP BY QuestionID 
HAVING COUNT(QuestionID) >= 4;

-- Câu 8: Lấy ra mã đề thi có thời gian thi >= 60p và được tạo trước ngày 20/12/2019
SELECT sCode
FROM `Exam`
WHERE Duration >= 60 AND CreateDate < '2019-12-20';

-- Câu 9: Lấy ra 5 group đc tạo gần đây nhất
SELECT * FROM `Group`;

-- Câu 10: Đếm số nhân viên thuộc department có id=2
SELECT COUNT(DepartmentName)
FROM `Department`
WHERE DepartmentID = 2;
 
-- Câu 11: Lấy nhân viên có tên bắt đầu bằng chữ 'D' và kết thúc bằng chữ 'o'
SELECT * FROM `Account`
WHERE Username LIKE 'D%' AND Username LIKE '%o';

-- Câu 12: Xóa tất cả các exam đc tạo trước 20/12/2019
DELETE  FROM `Exam`
WHERE CreateDate < '2019-12-20';

-- Câu 13: Xóa tất cả Question bắt đầu bằng chữ 'câu hỏi'
DELETE  FROM `Question`
WHERE  Content LIKE 'Câu hỏi%';

-- Câu 14: UPDATE thông tin của account có id =5 thành tên 'Nguyễn Bá Lộc' và email thành 'loc.nguyenba@vti.com.vn'
UPDATE  `Account`
SET Username = 'Nguyễn Bá Lộc' 
	AND Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

-- Câu 15: UPDATE account có id =5 sẽ thuộc group có id=4
UPDATE  `Account`
SET ;

