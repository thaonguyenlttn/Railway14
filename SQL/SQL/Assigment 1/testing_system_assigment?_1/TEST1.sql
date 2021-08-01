DROP DATABASE IF EXISTS testing_system_assignment_1;
 
CREATE DATABASE IF NOT EXISTS testing_system_assignment_1;
USE  `testing_system_assignment_1`;

DROP TABLE IF EXISTS `Department`;
CREATE TABLE  `Department` (
	`DepartmentID` INT,
	`DepartmentName` VARCHAR(50)
  );

CREATE TABLE `Possition`(
	`PossitionID` INT,
    `PossitionName` VARCHAR(50)
    );

CREATE TABLE  `Account`(
	`AccountID`     INT,
    `Email`			     VARCHAR(50),
     `Username`     VARCHAR(50),
     `Fullname`	      VARCHAR(50),
     `DepartmentID` INT,
     `PossitionID`     INT,
     `CreateDate`     Date
     );
     
CREATE TABLE `Group`(			
		`GroupID`		INT,
        `GroupName`	VARCHAR(50),
        `CreatorID`		INT,
        `CreateDate`	Date
        );

CREATE TABLE `GroupAccount` (
		`GroupID`		INT,
        `AccountID`		INT,
        `JointDate`		Date
        );

CREATE TABLE  `TypeQuestion` (
		`TypeID`			INT, 
        `TypeName`	VARCHAR(50)
        );
        
CREATE TABLE 	`CategoryQuestion` (
		`CategoryID`	INT,
        `CategoryName`	VARCHAR(50)
        );

CREATE TABLE 	`Question` (
		`QuestionID	`	INT,
        `Content`			VARCHAR(50),
        `CategoryID	` 	INT,
        `TypeID`			INT,
        `CreatorID`		INT,
        `Creatordate`	Date
        );
        
CREATE TABLE 	`Answer` (
		`AnswerID`		INT,		
        `Content`			VARCHAR(50),
        `QuestionID`	INT, 
        `isCorrect`		ENum('Correct','Uncorrect')
		);
        
CREATE TABLE 	`Exam`(
		`ExamID`			INT,
        `Code`				INT,
        `Title`				VARCHAR(50),
        `CategoryID`	VARCHAR(100),
        `Duration`		Time,
        `CreatorID`		INT,
        `CreatorDate`	Date
        );

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE 	`ExamQuestion`(
		`ExamID`			INT,
        `QuestionID`	INT
        );


