USE Testing_System_Assignment_1;

-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS PB_account;
DELIMITER $$
CREATE PROCEDURE PB_account(IN in_dep_name VARCHAR(50))
	BEGIN
	SELECT A.AccountID, A.FullName, D.DepartmentName 
    FROM `Account` A
	INNER JOIN `Department` D ON D.DepartmentID = A.DepartmentID
	WHERE D.DepartmentName = in_dep_name;
	END$$
DELIMITER ;
Call PB_account('Sale');

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS SL_account;
DELIMITER $$
CREATE PROCEDURE SL_account(IN in_group_account VARCHAR(50))
	BEGIN
	SELECT G.GroupName, COUNT(GA.GroupID) AS SL
    FROM `Group` G
	INNER JOIN `GroupAccount` GA ON GA.GroupID = G.GroupID
    WHERE G.GroupName = in_group_account;
	END$$
DELIMITER ;
Call SL_account('Testing System');

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại


-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS max_id_typequestion;
DELIMITER $$
CREATE PROCEDURE max_id_typequestion()
	BEGIN
	WITH CTE_count_typeid AS(
		SELECT TQ.TypeName, COUNT(Q.TypeID) AS SL
		FROM `TypeQuestion` TQ
		INNER JOIN `Question` Q ON Q.TypeID = TQ.TypeID	
		GROUP BY Q.TypeID
    )
    SELECT * FROM `CTE_count_typeid`
    WHERE SL = (SELECT MAX(SL) FROM `CTE_count_typeid`);
	END$$
DELIMITER ;
CALL max_id_typequestion();

DROP PROCEDURE IF EXISTS sp_GetCountQuesFromType;
DELIMITER $$
CREATE PROCEDURE sp_GetCountQuesFromType(OUT v_ID TINYINT)
BEGIN
WITH CTE_CountTypeID AS (
SELECT count(q.TypeID) AS SL FROM question q
GROUP BY q.TypeID)
SELECT q.TypeID INTO v_ID FROM question q
GROUP BY q.TypeID
HAVING COUNT(q.TypeID) = (SELECT max(SL) FROM CTE_CountTypeID);
END$$
DELIMITER ;
SET @ID =0;
Call sp_GetCountQuesFromType(@ID);
SELECT @ID;

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
SET @ID =1;
Call max_id_typequestion(@ID);
SELECT * FROM `TypeQuestion` WHERE TypeID = @ID;

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS sp_getNameAccOrNameGroup;
DELIMITER $$
CREATE PROCEDURE sp_getNameAccOrNameGroup( IN var_String VARCHAR(50))
BEGIN
	SELECT g.GroupName FROM `Group` g WHERE g.GroupName LIKE CONCAT("%",var_String,"%")
	UNION
	SELECT a.Username FROM `Account` a WHERE a.Username LIKE CONCAT("%",var_String,"%");
	END$$
DELIMITER ;
Call sp_getNameAccOrNameGroup('s');

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán:
	-- username sẽ giống email nhưng bỏ phần @..mail đi
	-- positionID: sẽ có default là developer
	-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công
DROP PROCEDURE IF EXISTS sp_insertAccount;
DELIMITER $$
CREATE PROCEDURE sp_insertAccount
	( IN var_Email VARCHAR(50),
	IN var_Fullname VARCHAR(50))
BEGIN
	DECLARE v_Username VARCHAR(50) DEFAULT SUBSTRING_INDEX(var_Email, '@', 1);
	DECLARE v_DepartmentID TINYINT UNSIGNED DEFAULT 11;
	DECLARE v_PositionID TINYINT UNSIGNED DEFAULT 1;
	DECLARE v_CreateDate DATETIME DEFAULT now();
	INSERT INTO `Account` (`Email`, `Username`, `FullName`,
	`DepartmentID`, `PositionID`, `CreateDate`)
	VALUES (var_Email, v_Username, var_Fullname,
	v_DepartmentID, v_PositionID, v_CreateDate);
END$$
DELIMITER ;
Call sp_insertAccount('daonq@viettel.com.vn','Nguyen dao');

-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
DROP PROCEDURE IF EXISTS sp_getMaxNameQuesFormNameType;
DELIMITER $$
CREATE PROCEDURE sp_getMaxNameQuesFormNameType( IN var_Choice VARCHAR(50))
BEGIN
	DECLARE v_TypeID TINYINT UNSIGNED; -- Tạo biến 
	SELECT tq.TypeID INTO v_TypeID -- lấy tq.typeid gán cho biến vừa tạo
    FROM `TypeQuestion` tq
    WHERE tq.TypeName = var_Choice; 
	IF var_Choice = 'Essay' THEN
		WITH CTE_lengthContent AS(
			SELECT LENGTH(Content) AS L
            FROM `Question`
            WHERE TypeID = v_TypeID)
            SELECT * FROM `Question`
            WHERE TypeID = v_TypeID AND LENGTH(Content) = (SELECT MAX(L) FROM `CTE_lengthContent`);
	ELSEIF var_Choice = 'Multiple_choice' THEN
		WITH CTE_lengthContent AS(
			SELECT LENGTH(Content) AS L
            FROM `Question`
            WHERE TypeID = v_TypeID)
            SELECT * FROM `Question`
            WHERE TypeID = v_TypeID AND LENGTH(Content) = (SELECT MAX(L) FROM `CTE_lengthContent`);
	END IF;
END$$
DELIMITER ;
CALL sp_getMaxNameQuesFormNameType('Essay');
        
-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
DROP PROCEDURE IF EXISTS sp_DeleteExamWithID;
DELIMITER $$
CREATE PROCEDURE sp_DeleteExamWithID (IN in_ExamID TINYINT UNSIGNED)
BEGIN
	DELETE FROM examquestion WHERE ExamID = in_ExamID;
	DELETE FROM Exam WHERE ExamID = in_ExamID;
END$$
DELIMITER ;
CALL sp_DeleteExamWithID(7);

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa) Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng ban default là phòng ban chờ việc
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay

-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")