/* Lenh xoa Database */
DROP DATABASE IF EXISTS `Testing_System_1`;
/* Lenh tao Database */
CREATE DATABASE IF NOT EXISTS `Testing_System_1`;
/* Lenh su dung Database */
USE `Testing_System_1`;


/*------------------- Create table ----------------------- */

/* Lenh xoa bang */
DROP TABLE IF EXISTS `Department`;
/* Len tao bang va cac cot du lieu cua bang--*/
CREATE TABLE `Department`
(
    `DepartmentID`   TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `DepartmentName` VARCHAR(50) NOT NULL UNIQUE KEY
);
Select * From `Department`;

DROP TABLE IF EXISTS `Position`;
CREATE TABLE IF NOT EXISTS `Position`
(
    `PositionID`   TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `PositionName` ENUM ('Dev1', 'Dev2', 'Test', 'Scrum Master', 'PM')
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE IF NOT EXISTS `Account`
(
    `AccountID`    MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Email`        VARCHAR(100) UNIQUE,
    `Username`     VARCHAR(50) NOT NULL,
    `Fullname`     VARCHAR(50),
    `DepartmentID` TINYINT UNSIGNED,
    `PositionID`  TINYINT UNSIGNED,
    `CreateDate`   DATETIME
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE IF NOT EXISTS `Group`
(
    `GroupID`    MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `GroupName`  VARCHAR(50) NOT NULL,
    `CreatorID`  MEDIUMINT UNSIGNED,
    `CreateDate` DATETIME
);

DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE IF NOT EXISTS `GroupAccount`
(
    `GroupID`   MEDIUMINT,
    `AccountID` MEDIUMINT,
    `JoinDate`  DATETIME DEFAULT NOW()
);

DROP TABLE IF EXISTS `TypeQuestion`;
CREATE TABLE IF NOT EXISTS `TypeQuestion`
(
    `TypeID`   TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `TypeName` VARCHAR(50)
);

DROP TABLE IF EXISTS `CategoryQuestion`;
CREATE TABLE IF NOT EXISTS `CategoryQuestion`
(
    `CategoryID`   TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `CategoryName` ENUM ('Java', 'SQL', '.NET', 'Ruby', 'Python', 'NodeJS' , 'HTML', 'CSS', 'JavaScript')
);

DROP TABLE IF EXISTS `Question`;
CREATE TABLE IF NOT EXISTS `Question`
(
    `QuestionID` TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Content`    VARCHAR(50),
    `CategoryID` TINYINT UNSIGNED,
    `TypeID`     TINYINT UNSIGNED,
    `CreatorID`  MEDIUMINT UNSIGNED,
    `CreateDate` DATETIME
);

DROP TABLE IF EXISTS `Answer`;
CREATE TABLE IF NOT EXISTS `Answer`
(
    `AnswerID`   TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Content`    VARCHAR(50),
    `QuestionID` TINYINT UNSIGNED,
    `isCorrect`  BIT
);

DROP TABLE IF EXISTS `Exam`;
CREATE TABLE IF NOT EXISTS `Exam`
(
    `ExamID`     TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Code`       VARCHAR(20) NOT NULL,
    `Title`      VARCHAR(50) NOT NULL,
    `CategoryID` TINYINT UNSIGNED,
    `Duration`   TINYINT,
    `CreatorID`  MEDIUMINT UNSIGNED,
    `CreateDate` DATETIME
);


DROP TABLE IF EXISTS `ExamQuestion`;
CREATE TABLE IF NOT EXISTS `ExamQuestion`
(
    `ExamID`     TINYINT UNSIGNED,
    `QuestionID` TINYINT UNSIGNED
);


/* ---------------------- INSERT DATA ---------------------------- */
/* INSERT DATA bang Department */
INSERT INTO `Department`(`DepartmentName`)
VALUES ('Phong Ky Thuat 1'),
       ('Phong Ky Thuat 2'),
       ('Phong Dev 1'),
       ('Phong Dev 2'),
       ('Phong Sale'),
       ('Phong Marketing'),
       ('Phong Giam Doc'),
       ('Phong Tai Chinh');

/* Lenh sua bang `Position` sua kieu du lieu cot `PositionName` */
ALTER TABLE `Position`
    MODIFY COLUMN `PositionName` ENUM ('Dev1', 'Dev2', 'PM', 'Leader', 'Scrum Master' , 'Test');
/* INSERT DATA bang Position */
INSERT INTO `Position`(`PositionName`)
VALUES ('Dev1'),
       ('Dev2'),
       ('Test'),
       ('PM'),
       ('Leader'),
       ('Scrum Master');

/* INSERT DATA bang Account */
INSERT INTO `Account`(`Email`, `Username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`)
VALUES ('vti_account1@vtiacademy.com', 'vti1', 'Nguyen Van Tinh', 1, 1, '2019-12-01'),
       ('vti_account2@vtiacademy.com', 'vti2', 'Trinh Hoai Linh', 1, 2, '2020-12-01'),
       ('vti_account3@vtiacademy.com', 'vti3', 'Nguyen Van Test', 1, 1, '2020-07-01'),
       ('vti_account4@vtiacademy.com', 'vti4', 'Tran Van Tinh', 1, 2, '2019-09-01'),
       ('vti_account5@vtiacademy.com', 'account5', 'Ho Van Tinh', 3, 2, '2021-07-01'),
       ('vti_account6@vtiacademy.com', 'account_vti6', 'Cao Thai Son', 3, 1, NOW()),
       ('vti_7@vtiacademy.com', 'account_vti7', 'Tam Th???t T??ng', 3, 3, '2020-10-01'),
       ('vti_8@vtiacademy.com', 'account_vti8', 'Nguyen Quynh Thu', 3, 4, '2019-04-01'),
       ('vti_9@vtiacademy.com', 'account_vti9', 'Tran Kim Tuyen', 2, 1, NOW()),
       ('vti_account10@vtiacademy.com', 'account_vti10', 'Nguyen Ba Dao', 1, 5, '2019-10-01'),
       ('vti_account11@vtiacademy.com', 'account_vti11', 'Nguyen Van Binh', 1, 3, '2020-12-01');

/* INSERT DATA bang Group */
INSERT INTO `Group`(`GroupName`, `CreatorID`, CreateDate)
VALUES ('Nhom 1', '3', '2021-04-03'),
       ('Nhom 2', '3', '2019-01-03'),
       ('Nhom 3', '2', '2020-04-03'),
       ('Nhom 4', '1', NOW()),
       ('Nhom 5', '3', '2021-06-03'),
       ('Nhom 6', '1', '2020-04-03'),
       ('Nhom 7', '5', '2021-04-03'),
       ('Nhom 8', '5', '2019-05-03'),
       ('Nhom 9', '3', '2019-01-03'),
       ('Nhom 10', '1', NOW());

/* INSERT DATA bang GroupAccount */
INSERT INTO `GroupAccount`(`GroupID`, `AccountID`, `JoinDate`)
VALUES ('1', '1', '2021-06-01'),
       ('1', '3', '2020-01-01'),
       ('1', '2', NOW()),
       ('1', '4', '2021-06-01'),
       ('2', '1', '2021-06-01'),
       ('2', '10', '2019-05-01'),
       ('5', '1', '2021-06-01'),
       ('5', '3', '2020-01-01'),
       ('5', '4', '2021-07-01'),
       ('3', '1', '2021-06-01'),
       ('9', '2', '2021-06-01'),
       ('10', '1', NOW());

/* INSERT DATA bang TypeQuestion */
INSERT INTO `TypeQuestion`(`TypeName`)
VALUES ('Trac nghiem'),
       ('Tu Luan');

/* INSERT DATA bang CategoryQuestion */
/*`CategoryName` ENUM ('Java', 'SQL', '.NET', 'Ruby', 'Python', 'NodeJS' , 'HTML', 'CSS', 'JavaScript')*/
INSERT INTO `CategoryQuestion` (`CategoryName`)
VALUES ('Java'),
       ('SQL'),
       ('HTML'),
       ('CSS '),
       ('.NET'),
       ('Python'),
       ('Ruby'),
       ('JavaScript');
/* INSERT DATA bang Question */
INSERT INTO `Question`(`Content`, CategoryID, TypeID, CreatorID, CreateDate)
VALUES ('C??u h???i SQL 1', 2, 2, 1, '2021-04-01'),
       ('C??u h???i SQL 2', 2, 2, 2, '2020-01-01'),
       ('C??u h???i JAVA 1', 1, 1, 10, '2021-07-01'),
       ('C??u h???i JAVA 2', 1, 2, 5, '2021-06-01'),
       ('C??u h???i HTML 1', 3, 1, 2, NOW()),
       ('C??u h???i HTML 2', 3, 2, 2, NOW());


/* INSERT DATA bang Answer */
INSERT INTO `Answer` (`Content`, `QuestionID`, `isCorrect`)
VALUES ('C??u tr??? l???i 1 - question SQL 1', 1, 1),
       ('C??u tr??? l???i 2 - question SQL 1', 1, 0),
       ('C??u tr??? l???i 3 - question SQL 1', 1, 0),
       ('C??u tr??? l???i 4 - question SQL 1', 1, 1),
       ('C??u tr??? l???i 1 - question SQL 2', 2, 0),
       ('C??u tr??? l???i 2 - question SQL 2', 2, 0),
       ('C??u tr??? l???i 3 - question SQL 2', 2, 0),
       ('C??u tr??? l???i 4 - question SQL 2', 2, 1),
       ('C??u tr??? l???i 1 - question JAVA 1', 3, 0),
       ('C??u tr??? l???i 2 - question JAVA 1', 3, 1),
       ('C??u tr??? l???i 1 - question JAVA 2', 4, 0),
       ('C??u tr??? l???i 2 - question JAVA 2', 4, 0),
       ('C??u tr??? l???i 3 - question JAVA 2', 4, 0),
       ('C??u tr??? l???i 4 - question JAVA 2', 4, 1),
       ('C??u tr??? l???i 1 - question HTML 1', 5, 1),
       ('C??u tr??? l???i 2 - question HTML 2', 5, 0);

/* INSERT DATA bang Exam */
INSERT INTO `Exam`(`Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`)
VALUES ('MS_01', 'De thi 01', 1, 90, 1, NOW()),
       ('MS_02', 'De thi 02', 1, 60, 5, NOW()),
       ('MS_03', 'De thi 03', 2, 60, 9, NOW()),
       ('MS_04', 'De thi 04', 2, 90, 1, NOW()),
       ('MS_05', 'De thi 05', 1, 60, 2, NOW()),
       ('MS_06', 'De thi 06', 2, 90, 2, NOW()),
       ('MS_07', 'De thi 07', 1, 60, 1, NOW());

/* INSERT DATA bang Examquestion */
INSERT INTO `ExamQuestion`
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (5, 2),
       (6, 2),
       (7, 2),
       (8, 2),
       (9, 3),
       (10, 3),
       (11, 4),
       (12, 4),
       (13, 4),
       (14, 4),
       (15, 5),
       (16, 5);

####TH???C H??NH V???I C??U L???NH JOIN

Question 1: Vi???t l???nh ????? l???y ra danh s??ch nh??n vi??n v?? th??ng tin ph??ng ban c???a h???
SELECT     Fullname, A.DepartmentID, D.Departmentname
FROM       `Account` A
JOIN        `Department`  D  ON  A.AccountID = D.DepartmentID
ORDER BY    A.DepartmentID;
??? ra c?? 8 k???t qu?????

Question 2: Vi???t l???nh ????? l???y ra th??ng tin c??c account ???????c t???o sau ng??y 20/12/2010
SELECT      username, fullname, email
FROM        `Account`
WHERE        CreateDate > '2020-12-20';
Question 3: Vi???t l???nh ????? l???y ra t???t c??? c??c developer
SELECT      Fullname, P.PositionName
FROM        `Account` A
JOIN         `Position` P ON A.PositionID = P.PositionID
WHERE        `PositionName` LIKE 'Dev%';
Question 4: Vi???t l???nh ????? l???y ra danh s??ch c??c ph??ng ban c?? >3 nh??n vi??n
SELECT      D.DepartmentName, A.DepartmentID, COUNT(A.DepartmentID) AS SL
FROM        `Account` A
JOIN         Department D ON A.DepartmentID = D.DepartmentID
GROUP BY    A.DepartmentID
HAVING      SL > 3;
Question 5: Vi???t l???nh ????? l???y ra danh s??ch c??u h???i ???????c s??? d???ng trong ????? thi nhi???u
nh???t?
SELECT    QuestionID,  COUNT(QuestionID) AS SL
FROM     `ExamQuestion`
Group by  QuestionID;

SELECT MAX(T.SL)
FROM (SELECT    QuestionID,  COUNT(QuestionID) AS SL
FROM     `ExamQuestion`
Group by  QuestionID) AS T;

SELECT    Q.Content, EQ.QuestionID, COUNT(EQ.QuestionID) AS SL
FROM      ExamQuestion EQ
JOIN      Question Q ON EQ.QuestionID = Q.QuestionID
GROUP BY  EQ.QuestionID
HAVING    `SL` = (SELECT MAX(T.SL)
FROM (SELECT    QuestionID,  COUNT(QuestionID) AS SL
FROM     `ExamQuestion`
Group by  QuestionID) AS T);

Question 6: Th??ng k?? m???i category Question ???????c s??? d???ng trong bao nhi??u Question
SELECT    CQ.CategoryName, Q.CategoryID, COUNT(Q.CategoryID) AS SL
FROM      Question Q
JOIN      CategoryQuestion CQ ON CQ.CategoryID = Q.CategoryID
GROUP BY  Q.CategoryID;

Question 7: Th??ng k?? m???i Question ???????c s??? d???ng trong bao nhi??u Exam

SELECT      Q.Content, COUNT(EQ.QuestionID) AS SL
FROM        Question Q
LEFT JOIN   ExamQuestion EQ ON Q.QuestionID = EQ.QuestionID
GROUP BY    Q.QuestionID;

Question 9: Th???ng k?? s??? l?????ng account trong m???i group
SELECT      G.GroupName, G.GroupID, COUNT(GA.AccountID)
FROM        `Group` G
LEFT JOIN   GroupAccount GA ON G.GroupID = GA.GroupID
GROUP BY    G.GroupID;
#??? Answer l???i d??ng JOIN
Question 10: T??m ch???c v??? c?? ??t ng?????i nh???t
SELECT      P.PositionName, COUNT(A.PositionID) AS SL
FROM        Position P
JOIN        `Account` A ON P.PositionID = A.PositionID
GROUP BY    A.PositionID
HAVING      `SL` = (SELECT MIN(Q.SL)
                    FROM (SELECT PositionID, COUNT(PositionID) AS SL
                    FROM `Account`
                    Group BY PositionID) AS Q);

Question 11: Th???ng k?? m???i ph??ng ban c?? bao nhi??u dev, test, scrum master, PM
SELECT      D.DepartmentName,P.PositionName,P.PositionID,COUNT(A.PositionID) AS SL
FROM        `Account`  A
JOIN        Position P ON P.PositionID = A.PositionID
JOIN        Department D ON D.DepartmentID = A.DepartmentID
GROUP BY    P.PositionID, D.DepartmentName;

Question 12: L???y th??ng tin chi ti???t c???a c??u h???i bao g???m: th??ng tin c?? b???n c???a
question, lo???i c??u h???i, ai l?? ng?????i t???o ra c??u h???i, c??u tr??? l???i l?? g??, ...
SELECT   Q.QuestionID, AN.Content, Q.Content, T.TypeName, A.FullName
FROM     Question Q
JOIN     Answer  AN  ON Q.QuestionID = AN.QuestionID
JOIN     TypeQuestion T ON T.TypeID = Q.TypeID
JOIN     `account` A ON A.AccountID = Q.CreatorID;

Question 13: L???y ra s??? l?????ng c??u h???i c???a m???i lo???i t??? lu???n hay tr???c nghi???m
SELECT  T.TypeName, COUNT(Q.QuestionID) AS SL
FROM   Question Q
JOIN   TypeQuestion T ON Q.TypeID = T.TypeID
GROUP BY T.TypeName ;

Question 14:L???y ra group kh??ng c?? account n??o
SELECT      G.GroupID, GA.AccountID
FROM        `Group` G
LEFT JOIN   GroupAccount GA ON G.GroupID = GA.GroupID
WHERE       GA.AccountID IS NULL;

Question 16: L???y ra question kh??ng c?? answer n??o
SELECT      A.Content,Q.QuestionID
FROM        Question Q
LEFT JOIN   Answer A ON Q.QuestionID = A.QuestionID
WHERE       A.Content IS NULL;

Question 17:
a) L???y c??c account thu???c nh??m th??? 1
SELECT A.Fullname
FROM  `Account` A
JOIN   GroupAccount GA ON A.AccountID = GA.AccountID
WHERE  GA.GroupID = 1;

b) L???y c??c account thu???c nh??m th??? 2
SELECT A.Fullname
FROM  `Account` A
JOIN   GroupAccount GA ON A.AccountID = GA.AccountID
WHERE  GA.GroupID = 2;

SELECT A.Fullname
FROM  `Account` A
JOIN   GroupAccount GA ON A.AccountID = GA.AccountID
WHERE  GA.GroupID = 1
UNION
SELECT A.Fullname
FROM  `Account` A
JOIN   GroupAccount GA ON A.AccountID = GA.AccountID
WHERE  GA.GroupID = 2;

Question 18:
a) L???y c??c group c?? l???n h??n 5 th??nh vi??n
SELECT      GA.GroupID, G.GroupName, COUNT(GA.GroupID) AS SL
FROM        `Group` G
JOIN        `GroupAccount` GA ON G.GroupID = GA.GroupID
GROUP BY     GA.GroupID
HAVING       SL >=  5;
b) L???y c??c group c?? nh??? h??n 7 th??nh vi??n
SELECT      GA.GroupID, G.GroupName, COUNT(GA.GroupID) AS SL
FROM        `Group` G
JOIN        `GroupAccount` GA ON G.GroupID = GA.GroupID
GROUP BY     GA.GroupID
HAVING       SL  <= 7 ;

SELECT      GA.GroupID, G.GroupName, COUNT(GA.GroupID) AS SL
FROM        `Group` G
JOIN        `GroupAccount` GA ON G.GroupID = GA.GroupID
GROUP BY     GA.GroupID
HAVING       SL >=  5
UNION
SELECT      GA.GroupID, G.GroupName, COUNT(GA.GroupID) AS SL
FROM        `Group` G
JOIN        `GroupAccount` GA ON G.GroupID = GA.GroupID
GROUP BY     GA.GroupID
HAVING       SL  <= 7 ;

 #Ph??ng ban kh??ng c?? nh??n vi??n n??o (c?? th??? d??ng
 -->C??ch 1:
SELECT D.DepartmentName, D.DepartmentID
FROM   Department D
Left Join `Account` A ON D.DepartmentID = A.DepartmentID
Where   A.AccountID IS NULL;
--> C??ch 2:
SElECT D.DepartmentName, D.DepartmentID
FROM   `Department` D
WHERE  DepartmentID NOT IN (SELECT DepartmentID FROM `Account`);

 # TH???NG K?? M???I CATEGORY QUESTION S??? D???NG TRONG BAO NHI??U QUESTION
SELECT CQ.CategoryName,CQ.CategoryID, COUNT(Q.CATEGORYID) AS SL
FROM  `Question` Q
RIGHT JOIN CategoryQuestion CQ  ON CQ.CategoryID = Q.CategoryID
GROUP BY (CQ.CategoryID);

