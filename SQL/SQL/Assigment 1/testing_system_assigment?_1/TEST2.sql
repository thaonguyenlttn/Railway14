DROP DATABASE IF EXISTS testing_system_assignment_1;
 
CREATE DATABASE IF NOT EXISTS testing_system_assignment_1;
USE  `testing_system_assignment_1`;

DROP TABLE IF EXISTS `Department`;

CREATE TABLE  `Department`  (
	          `DepartmentID`          TINYINT  PRIMARY KEY AUTO_INCREMENT,
	          `DepartmentName`        VARCHAR(50) UNIQUE KEY
		);
INSERT INTO  `Department`(`DepartmentID`,`DepartmentName`)
VALUES			        ('2', 'Sales'),
						('1', 'Marketing'),
                        ('3','HR'),
                        ('4', 'R&D'),
                        ('5', 'Dev');
SELECT * FROM Department;

DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
	        `PositionID`		    TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
            `PositionName`	        ENUM ('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL
    );
INSERT Position         (PositionID, PositionName)
VALUES			        ('1','Dev'),
						('2','Test'),
						('3','Scrum Master'),
                        ('4','PM'),
                        ('5','Dev');

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
            `AccountID`		       TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
            `Email`			        VARCHAR(50) UNIQUE KEY CHECK (LENGTH (Email) > 10),
            `Username`		        VARCHAR(50) UNIQUE KEY NOT NULL CHECK (LENGTH (Username)>= 6),
            `FullName`		        VARCHAR(50) NOT NULL CHECK (LENGTH (Fullname) >= 6),
            `DepartmentID` 	        TINYINT UNSIGNED UNIQUE NOT NULL,
             `PositionID`		    TINYINT UNSIGNED,
             `CreateDate`		    DATETIME DEFAULT NOW()
);
 INSERT INTO `Account`(`AccountID`, `Email`  ,`Username`,`Fullname`,`DepartmentID`,`PositionID`,`CreateDate`)
VALUES          ('1','email01@gnmail.com','lisa','ngo thi ly','1','1','2020-12-01'),
                ('2','email02@gnmail.com','elsa','ngo thi anh','2','2','2020-12-02'),
                ('3','email03@gnmail.com','rosy','ngo thi xuan','3','3','2020-12-03'),
                ('4','email04@gnmail.com','harry','ngo thi thu','4','4','2020-12-04'),
                ('5','email05@gnmail.com','emi','ngo thi dong','5','5','2020-12-04');
Select * from `Account`;

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
		`GroupID`		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        `GroupName`	    VARCHAR(50) NOT NULL,
        `CreatorID`		TINYINT UNIQUE KEY ,
        `CreateDate`	DATETIME DEFAULT NOW()
        );
INSERT INTO `Group`(`GroupID`,`GroupName`,`CreatorID`,`CreateDate`)
VALUES              ('1','group1','1','2020-12-01'),
                    ('2','group2','2','2020-12-02'),
                    ('3','group3','3','2020-12-03'),
                    ('4','group4','4','2020-12-04'),
                    ('5','group5','5','2020-12-05');
Select * from `Group`;

DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount` (
		`GroupID`		TINYINT  UNSIGNED NOT NULL,
        `AccountID`		TINYINT  NOT NULL,
        `JointDate`		DATETIME DEFAULT NOW()
	);
INSERT INTO GroupAccount (GroupID, AccountID)
VALUES 					( '1', 		'1'),
						( '2',  	'2'),
                        ( '3',  	'3'),
                        ( '4',  	'4'),
                        ( '5',  	'5');
Select * from GroupAccount;

DROP TABLE IF EXISTS `TypeQuestion`;
CREATE TABLE  `TypeQuestion` (
		`TypeID`			TINYINT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        `TypeName`	        ENUM ('Essay', 'Multiple-Choice')  NOT NULL
        );
INSERT INTO `Typequestion`( TypeID,TypeName)
VALUES					(1, 'Essay'),
						(2, 'Multiple-Choice');
Select * from TypeQuestion;

 DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE 	`CategoryQuestion` (
		`CategoryID`	  TINYINT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        `CategoryName`	  VARCHAR(50)UNIQUE KEY NOT NULL
        );
INSERT INTO `CategoryQuestion`(CategoryID,CategoryName)
VALUES 						(1, 'Java'),
							(2, 'NET'),
                            (3,'SQL'),
                            (4, 'Python'),
                            (5, 'Ruby');
Select * from CategoryQuestion;

DROP TABLE IF EXISTS `Question`;
CREATE TABLE 	   `Question` (
	QuestionID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
    Content			VARCHAR(50) NOT NULL CHECK (LENGTH (Content) >10),
    CategoryID		TINYINT UNSIGNED NOT NULL,
    TypeID			TINYINT UNSIGNED NOT NULL,
    CreatorID		SMALLINT UNSIGNED NOT NULL,
    CreateDate		DATETIME DEFAULT NOW()
    );
INSERT INTO question (QuestionID,  Content,		      CategoryID,       TypeID, CreatorID)
VALUES 				(1,            'Câu hỏi về Java',		   1, 			1, 	   5),
					(2,            'Câu hỏi về NET',			2, 			2, 	    2),
                    (3,            'Câu hỏi về SQL',			3, 			2, 	    1),
                    (4,            'Câu hỏi về Python',		    4, 			1, 	    3),
                    (5,            'Câu hỏi về Ruby',		    5, 			2, 	  4);
Select * from `Question`;

DROP TABLE IF EXISTS  Answer;
CREATE TABLE 	     `Answer`(
    AnswerID      TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content       VARCHAR(100) NOT NULL CHECK (LENGTH(Content) > 10),
    QuestionID    TINYINT UNSIGNED,
    isCorrect     ENUM ('Dung','Sai')
);
INSERT INTO Answer (AnswerID, Content, QuestionID, isCorrect)
VALUES             (1, 'Câu trả lời 1', 1, 'Sai'),
                    (2, 'Câu trả lời 2', 2, 'Dung'),
                    (3, 'Câu trả lời 3', 3, 'Sai'),
                    (4, 'Câu trả lời 4', 4, 'Dung'),
                    (5, 'Câu trả lời 5', 5, 'Sai');
Select * from Answer;

DROP TABLE IF EXISTS Exam;
CREATE TABLE 	`Exam`(
    ExamID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Code			TINYINT UNIQUE KEY NOT NULL,
    Title			VARCHAR(50) NOT NULL CHECK(LENGTH ( Title) > 6),
    CategoryID 		TINYINT UNSIGNED NOT NULL,
    Duration		TINYINT NOT NULL ,
    CreatorID		SMALLINT UNSIGNED NOT NULL,
    CreateDate		DATE
        );
INSERT INTO exam( ExamID,Code, Title, 		CategoryID, 	Duration,	 CreatorID,		CreateDate)
VALUES			(1, 011,	'Đề thi Java',		 	4,			60,  		1,			'2020-12-01'),
				(2, 012,	'Đề thi C++',	    	1,			120, 		2,			'2020-12-01'),
                (3, 013,	'Đề thi Python',	    3,			60,  		1,			'2020-12-01'),
                (4, 014,	'Đề thi SQL',	    	2,			90,  		3,			'2020-12-01'),
				(5, 015,	'Đề thi Postman',	    5,			60,  		4,			'2020-12-01');
Select * from Exam;

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE 	`ExamQuestion`(
    ExamID     TINYINT UNSIGNED NOT NULL,
    QuestionID TINYINT UNSIGNED NOT NULL
);
INSERT INTO ExamQuestion(ExamID,QuestionID)
VALUES 					(1,			1),
						(2,			2),
                        (3,			3),
                        (4,			4),
                        (5,			5);

Select * from ExamQuestion;




#### Thuc hanh lenh select
SELECT DepartmentID from Department;

select * from Department;


SELECT DepartmentID
from Department
where DepartmentName = 'Sales';

SELECT *
from `Account`
where length(FullName) = (Select Max(Length(FullName)) from Account);

WITH QQQ AS
 (SELECT Fullname AS 'Ten', character_length(fullname) as 'dodai' from `account` order by (`dodai`) DESC )
SELECT * FROM QQQ
limit 1 ;

SELECT       *
FROM        `Account`
Where        character_length(FullName) = (Select Max(character_length(FullName)) from Account)
LIMIT 1;

Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id =3
SELECT       *
FROM        `Account`
Where        character_length(FullName) = (Select Max(character_length(FullName)) from Account) and departmentID = 3
;

Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT       GroupName
FRom         `Group`
WHERE        CreateDate < '2019-12-20';

Lấy ra ID của question có >= 4 câu trả lời
Select      QuestionID, count(*) AS SL
From        `Answer`
group by    QuestionID
HAVING     'SL' >= 4;

Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày
20/12/2019
Select * from Exam;
SELECT Code
From Exam
Where Duration >= 60 and CreateDate  < 2019-12-20;

Question 9: Lấy ra 5 group được tạo gần đây nhất
Select * from `Group`;
SELECT  *
FROM    `Group`
ODER BY  CreateDate DESC
LIMIT 5;


Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT * FROM `ACCOUNT`;
Select AccountID, Count(*)
from   Account
where  DepartmentID = 2;

Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT  FULLNAME
FROM    Account
WHERE   FullName LIKE 'D%O';

Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM  Exam
WHERE        CreateDate > 2019-12-20;

Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
SELECT * FROM   Question;
DELETE FROM     Question
WHERE           Content LIKE 'Câu hỏi%';

Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
email thành loc.nguyenba@vti.com.vn
UPDATE  `Account`
set      FullName = 'Nguyễn Bá Lôc', Email = 'loc.nguyenba@vti.com.vn'
WHERE    AccountID = 5;
select * from `Account`;

Question 15: update account có id = 5 sẽ thuộc group có id = 4
SELECT * FROM `GROUPACCOUNT`;
UPDATE `GroupAccount`
SET     GroupID =  4
WHERE   AccountID = 5;
SELECT * FROM `GROUPACCOUNT`;

select *
from `Group`
where groupid = (select `groupid` from `group` where `creatorid`= 5);

Select creatorID, Count(*) as 'SL'
from `account`
group by ((creatorID)
Having creatorID IN (1,2);

Đếm mỗi phòng có bao nhiêu nhân viên
select departmentid, count(*)
from `account`
group by (departmentID);
