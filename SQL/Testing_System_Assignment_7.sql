USE Testing_System_Assignment_1;

-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước
DROP TRIGGER IF EXISTS trigger_GroupYear;
DELIMITER $$
	CREATE TRIGGER trigger_GroupYear
	BEFORE INSERT ON `Group`
	FOR EACH ROW
	BEGIN
		DECLARE create_date DATETIME;
		SET create_date = DATE_SUB(NOW(), INTERVAL 1 YEAR);
		IF (NEW.CreateDate <= create_date) THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'Khong the them du lieu vao vi ngay tao da qua 1 nam';
		END IF;
	END $$
DELIMITER $$;

INSERT INTO `Group`(GroupName, CreatorID, CreateDate)
VALUE ('2', '1', '2018-4-10 00:00:00'); 

-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào department "Sale" nữa, khi thêm thì hiện ra thông báo "Department "Sale" cannot add more user"
DROP TRIGGER IF EXISTS trigger_NotAddUserToSale;
DELIMITER $$
	CREATE TRIGGER trigger_NotAddUserToSale
	BEFORE INSERT ON `Account`
	FOR EACH ROW
	BEGIN
		DECLARE v_UserID TINYINT; 
		SELECT d.DepartmentID INTO v_UserID FROM `Department` d
        WHERE d.DepartmentName = 'Sale';
        IF (NEW.DepartmentID = v_UserID) THEN
        SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'Department "Sale" cannot add more user';
		END IF;
	END $$
DELIMITER $$;

INSERT INTO `Account`(Email, Username, Fullname, DepartmentID, PositionID, CreateDate)
VALUE ('1', '1', '1', '2', '1', '2020-11-13 00:00:00');

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS trigger_UserGroup;
DELIMITER $$
	CREATE TRIGGER trigger_UserGroup
	BEFORE INSERT ON `GroupAccount`
	FOR EACH ROW
	BEGIN
		DECLARE v_CountGroupID TINYINT;
        SELECT COUNT(GA.GroupID) INTO v_CountGroupID FROM `GroupAccount` GA
        WHERE GA.GroupID = NEW.GroupID;
        IF (v_CountGroupID >= 5) THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'khong the them user vao group';
		END IF;
	END $$
DELIMITER $$;

INSERT INTO  `GroupAccount`(GroupID, AccountID, JoinDate)
VALUE (1, 2, '2020-05-11 00:00:00');

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS trigger_Question;
DELIMITER $$
	CREATE TRIGGER trigger_Question
	BEFORE INSERT ON `ExamQuestion`
	FOR EACH ROW
	BEGIN
		DECLARE v_CountExamID TINYINT;
        SELECT COUNT(EQ.ExamID) INTO v_CountExamID FROM `ExamQuestion` EQ
        WHERE EQ.ExamID = NEW.ExamID;
        IF (v_CountExamID >= 10) THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'khong the them cau hoi vao bai thi';
		END IF;
	END $$
DELIMITER $$;

INSERT INTO `ExamQuestion` (ExamID, QuestionID)
VALUE (6, 9);

-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là admin@gmail.com (đây là tài khoản admin, không cho phép user xóa), còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó
DROP TRIGGER IF EXISTS trigger_deleteUser;
DELIMITER $$
	CREATE TRIGGER trigger_deleteUser
	BEFORE DELETE ON `Account`
	FOR EACH ROW
	BEGIN
		DECLARE v_email VARCHAR(50);
        SET  v_email = 'admin@gmail.com';
        IF (OLD.Email = v_email) THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'đây là tài khoản admin, không cho phép xóa';
		END IF;
	END $$
DELIMITER $$;

DELETE FROM `Account` A WHERE A.Email = 'admin@gmail.com';

-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table Account, hãy tạo trigger cho phép người dùng khi tạo account không điền vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
DROP TRIGGER IF EXISTS trigger_waitingDep;
DELIMITER $$
	CREATE TRIGGER trigger_waitingDep
	BEFORE INSERT ON `Account`
	FOR EACH ROW
	BEGIN
		DECLARE v_waitingRoom VARCHAR(50);
        SELECT D.DepartmentID INTO v_waitingRoom FROM `Department` D
        WHERE D.DepartmentName = 'Waiting Department';
        IF (NEW.DepartmentID IS NULL) THEN
			SET NEW.DepartmentID = v_waitingRoom;
		END IF;
	END $$
DELIMITER $$;

INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate)
VALUE ('1', '1', '1', NULL, '1', '2019-07-15 00:00:00');

-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi question, trong đó có tối đa 2 đáp án đúng.
DROP TRIGGER IF EXISTS trigger_AnswerToExam;
DELIMITER $$
	CREATE TRIGGER trigger_AnswerToExam
	BEFORE INSERT ON `Answer`
	FOR EACH ROW
	BEGIN
		DECLARE v_CountQuestionID TINYINT;
        DECLARE v_AnswerIsCorrect TINYINT;
        SELECT COUNT(A.QuestionID) INTO v_CountQuestionID FROM `Answer` A
        WHERE A.QuestionID = NEW.QuestionID;
        SELECT COUNT(A.AnswerID) INTO v_AnswerIsCorrect FROM `Answer` A
        WHERE A.QuestionID = NEW.QuestionID AND A.isCorrect = NEW.isCorrect;
        IF (v_CountQuestionID >= 4) OR (v_AnswerIsCorrect >= 2) THEN
        SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'khong the them du lieu!';
		END IF;
	END $$
DELIMITER $$;

INSERT INTO `Answer` (Content, QuestionID, isCorrect)
VALUE ('Trả lời 02', 1, 1);

-- Question 8: Viết trigger sửa lại dữ liệu cho đúng:
-- Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
-- Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database
ALTER TABLE `Account`
ADD sGender VARCHAR(50);

DROP TRIGGER IF EXISTS trigger_Gender;
DELIMITER $$
	CREATE TRIGGER trigger_Gender
	BEFORE INSERT ON `Account`
	FOR EACH ROW
	BEGIN
		IF NEW.sGender = 'Nam' THEN
		SET NEW.sGender = 'M';
		ELSEIF NEW.sGender = 'Nu' THEN
		SET NEW.sGender = 'F';
		ELSEIF NEW.sGender = 'Chưa xác định' THEN
		SET NEW.sGender = 'U';
		END IF ;
	END $$
DELIMITER $$;

INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate, sGender)
VALUE ('1', '1', '1', '1', '1', '2019-07-15 00:00:00', 'Nam');

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DROP TRIGGER IF EXISTS trigger_NotDelExamFor2Day;
DELIMITER $$
	CREATE TRIGGER trigger_NotDelExamFor2Day
	BEFORE DELETE ON `Exam`
	FOR EACH ROW
	BEGIN
		DECLARE v_CreateDate DATETIME;
		SET v_CreateDate = DATE_SUB(NOW(), INTERVAL 2 DAY);
		IF (OLD.CreateDate = v_CreateDate) THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'Khong the xoa bai thi';
		END IF ;
	END $$
DELIMITER $$;

INSERT INTO `Exam` (sCode, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUE ('1', '1', 1, 1, 1, '2022-10-09 00:00:00');

DELETE FROM `Exam` E WHERE E.ExamID =15;

-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các question khi question đó chưa nằm trong exam nào
DROP TRIGGER IF EXISTS trigger_CheckUpdateQuestion;
DELIMITER $$
	CREATE TRIGGER trigger_CheckUpdateQuestion
	BEFORE UPDATE ON `ExamQuestion`
	FOR EACH ROW
	BEGIN
		DECLARE v_update DATETIME;
        
	END $$
DELIMITER $$;

BEFORE DELETE ON `Exam`


