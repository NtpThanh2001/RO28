DROP DATABASE IF EXISTS ThucTap;

CREATE DATABASE ThucTap;
USE ThucTap;

-- 1. Tạo table với các ràng buộc và kiểu dữ liệu
CREATE TABLE `GiangVien`(
	magv TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    hoten VARCHAR(100),
    luong INT
);

CREATE TABLE `SinhVien`(
	masv TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    hoten VARCHAR(100),
    namsinh DATETIME,
    quequan VARCHAR(100)
);

CREATE TABLE `DeTai`(
	madt TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tendt VARCHAR(100),
    kinhphi INT,
    noithuctap VARCHAR(100)
);

CREATE TABLE `HuongDan`(
	id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    masv TINYINT,
    madt TINYINT,
    magv TINYINT, 
    ketqua TINYINT
);

-- Thêm ít nhất 3 bản ghi vào table
INSERT INTO `GiangVien` (hoten, luong)
VALUES 
	('Tran Tien Dung', 5000000),
    ('Trinh Thi Xuan', 7500000),
    ('Le Huu Dung', 6000000);
    
INSERT INTO `SinhVien` (hoten, namsinh, quequan)
VALUES 
	('Vu Dinh Hoa', '2001-1-2', 'Ha Dong'),
    ('Nguyen Tuan Anh', '2000-2-3', 'Son Tay'),
    ('Duong Van Tu', '2001-3-4', 'Vinh Phuc'),
    ('Truong Hong Hanh', '20014-5', 'Dong Anh'),
	('Nguyen Dinh Tai', '2001-5-6', 'Ha Noi');

INSERT INTO `DeTai`(tendt, kinhphi, noithuctap)
VALUES 
	('CONG NGHE SINH HOC', 500000, 'Ha Noi'),
    ('CONG NGHE THONG TIN', 500000, 'Ha Noi'),
    ('CONG NGHE THUC PHAM', 500000, 'Ha Noi');
    
INSERT INTO `HuongDan`(masv, madt, magv, ketqua)
VALUES 
	(2, 1, 3, 8),
    (3, 2, 1, 10),
    (1, 3, 2, 9),
    (4, 1, 2, 8),
    (5, NULL, NULL, NULL);
    
-- 2a) Lấy tất cả các sinh viên chưa có đề tài hướng dẫn
SELECT s.*
FROM `HuongDan` h
RIGHT JOIN  `SinhVien` s ON s.masv = h.masv
WHERE h.madt IS NULL;

-- 2b, Lấy ra số sinh viên làm đề tài 'CONG NGHE SINH HOC'
SELECT d.tendt, COUNT(h.madt) AS sosv
FROM `HuongDan` h
JOIN `DeTai` d 
ON h.madt = d.madt
WHERE d.tendt = 'CONG NGHE SINH HOC';

-- 3. Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm: mã số, họ tên và tên đề tài
-- (Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có")
DROP VIEW IF EXISTS `SinhVienInfo`;
CREATE VIEW SinhVienInfo AS
SELECT s.masv, s.hoten, CASE
	WHEN d.tendt IS NULL THEN 'chua co'
    ELSE d.tendt END AS DT
FROM (( `HuongDan` h
RIGHT JOIN `SinhVien` s ON s.masv = h.masv)
LEFT JOIN `DeTai` d ON d.madt = h.madt);

SELECT * FROM SinhVienInfo;

-- 4. Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1900 thì hiện ra thông báo "năm sinh phải > 1900"
DROP TRIGGER IF EXISTS trg_dkNsSV;
DELIMITER $$
	CREATE TRIGGER trg_dkNsSV
	BEFORE INSERT ON `SinhVien`
	FOR EACH ROW
	BEGIN
		IF (YEAR(NEW.namsinh) <=1900) THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'năm sinh phải > 1900';
		END IF;
	END $$
DELIMITER $$;

INSERT INTO `SinhVien`(hoten, namsinh, quequan)
VALUE ('Tong Van Quy', '1899-5-6', 'Hai Phong');

-- 5. Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông tin trong table HuongDan liên quan tới sinh viên đó sẽ bị xóa đi
-- DELETE FROM `SinhVien`  WHERE masv = 5;