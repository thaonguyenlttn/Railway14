DROP DATABASE IF EXISTS testing_system_assignment_1;
 
CREATE DATABASE IF NOT EXISTS testing_system_assignment_1;
USE  `testing_system_assignment_1`;

DROP TABLE IF EXISTS `Department`;

CREATE TABLE  `Department`  (
	`DepartmentID`  TINYINT  PRIMARY KEY,
	`DepartmentName` VARCHAR(50) UNIQUE KEY
		);


CREATE TABLE `Possition`(
	`PossitionID` TINYINT  PRIMARY KEY,
    `PossitionName` VARCHAR(50)
    );

CREATE TABLE `Account` (
    `AccountID` 	TINYINT PRIMARY KEY,
    `Email` 			VARCHAR(50) UNIQUE KEY,
    `Username` 	VARCHAR(50)UNIQUE KEY NOT NULL,
    `Fullname` 		VARCHAR(50),
    `DepartmentID` 	TINYINT UNSIGNED,
    `PossitionID` 		TINYINT unsigned,
    `CreateDate` 		DATE
);
     
CREATE TABLE `Group`(			
		`GroupID`		TINYINT PRIMARY KEY,
        `GroupName`	VARCHAR(50),
        `CreatorID`		TINYINT UNIQUE KEY,
        `CreateDate`	Date
        );

DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount` (
		`GroupID`		TINYINT PRIMARY KEY ,
        `AccountID`		TINYINT UNIQUE KEY,
        `JointDate`		Date
	);
    

CREATE TABLE  `TypeQuestion` (
		`TypeID`			tinyint PRIMARY KEY, 
        `TypeName`	VARCHAR(50)
        );
        
CREATE TABLE 	`CategoryQuestion` (
		`CategoryID`	TINYINT  PRIMARY KEY,
        `CategoryName`	VARCHAR(50)
        );

CREATE TABLE 	`Question` (
		`QuestionID	`	TINYINT PRIMARY KEY,
        `Content`			VARCHAR(50),
        `CategoryID	` 	TINYINT,
        `TypeID`			TINYINT,
        `CreatorID`		TINYINT UNIQUE KEY,
        `Creatordate`	Date
        );
        
CREATE TABLE 	`Answer` (
		`AnswerID`		INT PRIMARY KEY,		
        `Content`			VARCHAR(50),
        `QuestionID`	INT, 
        `isCorrect`		ENum('Correct','Uncorrect')
		);
        
CREATE TABLE 	`Exam`(
		`ExamID`			INT PRIMARY KEY,=
        `Code`				INT UNIQUE KEY,
        `Title`				VARCHAR(50),
        `CategoryID`	VARCHAR(100),
        `Duration`		Time,
        `CreatorID`		INT UNIQUE KEY,
        `CreatorDate`	Date
        );

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE 	`ExamQuestion`(
		`ExamID`			INT,
        `QuestionID`	INT
        );
        
INSERT INTO  `Department`(`DepartmentID`,`DepartmentName`) 
VALUES			('1', 'Marketing'),
						('2', 'Sales'),
                        ('3','HR'),
                        ('4', 'R&D'),
                        ('5', 'Dev');
SELECT * FROM Answer WHERE AnswerID = 1;
SELECT * FROM Department;
                        
INSERT INTO `Possition`(`PossitionID`,`PossitionName`)
VALUES			('1','Truong_phong'),
						('2','Nhan_vien');
                        


