use assignment;

SELECT * FROM  `typequestion`;

SELECT * FROM  `categoryquestion`;

# Them 2 linh vuc cau hoi

INSERT INTO `categoryquestion`(Category_ID,Category_Name) values ('5','Sinh Học'), ('6','Giáo Dục');

# Them cau hoi va dap an vao table question va answer

SELECT * FROM `question`;

INSERT INTO `question`(Content, Category_ID, Type_ID, Creator_ID, Create_Date) 
values  ('Thủ Đô của Việt Nam là ?','1','2','1','2023-06-12'),
	('RAM là từ viết tắt của ?','2','1','2','2023-07-06'), #Random Access Memory
	('Rắn di chuyển bằng mấy chấn ?','5','2','1','2023-08-01'),
	('Thấy người gặp nạn ta phải ?','6','2','2','2023-06-30'),
	('Cá mập sống ở đâu ?','5','2','1','2023-07-14'),
        ('PC nghĩa là gì ?','2','1','2','2023-07-20'),
        ('Quang Trung là gì của Nguyễn Huệ ?','3','1','2','2023-08-03'),
        ('7 là số ?','4','2','2','2023-07-31')
;

SELECT * FROM  `answer`;

INSERT INTO `answer`(Content, Question_ID, is_Correct) 
values  ('1','2','0'),
	('2','2','0'),
	('3','2','1'),
	('4','2','0'),
        
	('Daklak','3','0'),
        ('Quảng Nam','3','0'),
        ('Huế','3','0'),
        ('Hà Nội','3','1'),
        
	('Random Access Memory','4','1'),
        ('Root An Macbook','4','0'),
        ('Reset All Memory','4','0'),
        ('Reset An Macbook','4','0'),
        
	('2','5','0'),
        ('4','5','0'),
        ('Rắn không có chân','5','1'),
        ('Tất cả đều sai','5','0'),
        
	('Nhìn','6','0'),
        ('Giúp đỡ','6','1'),
        ('Đi qua','6','0'),
        ('Cho tiền','6','0'),
        
	('Biển','7','1'),
        ('Trên cạn','7','0'),
        ('Đà Lạt','7','0'),
        ('Rừng Amazon','7','0'),
        
	('Pro Computer','8','0'),
        ('Pit Controller','8','0'),
        ('Power Contactor','8','0'),
        ('Personal Computer','8','1'),
        
	('Anh trai','9','0'),
        ('Em trai','9','0'),
        ('Cùng một người','9','1'),
        ('Con trai','9','0'),
        
	('Số nguyên tố','10','0'),
        ('Số tự nhiên','10','0'),
        ('Số nguyên dương','10','0'),
        ('Tất cả đều đúng','10','1')
;

# sắp xếp tăng dần bảng câu hỏi theo ngày tạo

SELECT * FROM `question` ORDER BY Create_Date asc;

# lấy ra dâu trả lời đúng

SELECT * FROM `answer` WHERE  is_Correct = 1;

# lấy ra câu hỏi tạo ra trong ngày hôm nay/ ko có câu nào tạo ra hôm náy

SELECT * FROM `question` WHERE Create_Date = now();

# Thống kê số câu hỏi theo từng lĩnh vực 

SELECT count(*), Category_Name FROM  (
		SELECT  `question`.question_ID, `question`.Content , `question`.Category_ID, `question`.Type_ID, `question`.Creator_ID, `question`.Create_Date,
				`categoryquestion`.Category_Name
		FROM 	`question` JOIN `categoryquestion` ON `question`.Category_ID = `categoryquestion`.Category_ID ) as tonghop
		GROUP BY Category_Name
;

# Thống kê số câu hỏi khó/dễ theo từng lĩnh vực 


SELECT count(*), Category_Name , Type_ID FROM  (
		SELECT  `question`.question_ID, `question`.Content , `question`.Category_ID, `question`.Type_ID, `question`.Creator_ID, `question`.Create_Date,
				`categoryquestion`.Category_Name
		FROM 	`question` JOIN `categoryquestion` ON `question`.Category_ID = `categoryquestion`.Category_ID ) as tonghop
		GROUP BY Category_Name , Type_ID
;

# Số lĩnh vực câu hỏi  được thêm vào bảng question


SELECT count( DISTINCT (Category_ID) ) FROM  (
		SELECT  `question`.question_ID, `question`.Content , `question`.Category_ID, `question`.Type_ID, `question`.Creator_ID, `question`.Create_Date,
				`categoryquestion`.Category_Name
		FROM 	`question` JOIN `categoryquestion` ON `question`.Category_ID = `categoryquestion`.Category_ID ) as tonghop
;
