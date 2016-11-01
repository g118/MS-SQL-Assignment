
-- Name- Gurpreet Singh ,  St.No. - 7557259--
--1. Create a database called CollegeDB
PRINT '***QUESTION 1 ***'
PRINT ''
CREATE DATABASE CollegeDB;

USE CollegeDB;


PRINT '***QUESTION 2 ***'
PRINT ''
CREATE TABLE Student
	(ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	FirstName VARCHAR(255), 
	LastName VARCHAR(255)
	);

PRINT '***QUESTION 3 : Create table Address, which contains (ID, StudentID, Street, City, PostaCode, PhoneNumber, Email)Make surethat ID is generated automaticallyCreate foreign key referencing student table. Make sure that address is deleted when student is delete.***'
PRINT ''
CREATE TABLE Address
	(ID INT NOT NULL IDENTITY(1,1)  PRIMARY KEY,
	StudentID INT FOREIGN KEY REFERENCES Student(ID) ON DELETE CASCADE, 
	Street VARCHAR(255), 
	City VARCHAR(255),
	PostalCode VARCHAR(255),
	PhoneNumber VARCHAR(255),
	Email VARCHAR(255)
	);

PRINT '***QUESTION 4 : Create Course table containing (ID, Name, CourseCode, Description)Make Sure that ID is generated using identity.***'
PRINT ''
CREATE TABLE Course
	(ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	Name VARCHAR(255), 
	CourseCode VARCHAR(255),
	Description VARCHAR(255)
	);

PRINT '***QUESTION 5 : Create a lookup table Semester with fields (ID, Description), where ID is a char(3) field using the same rules as semester ID in SIS database (F09 for Fall 2009)Create a primary key constraint for ID field.***'
PRINT ''
CREATE TABLE Semester
	(ID VARCHAR(3) NOT NULL PRIMARY KEY, 
	Description VARCHAR(255)
	);

PRINT '***QUESTION 6 : Create a connection table(StudentCourse), which will record which student had which courses in which semester using the following fields (StudentID, CourseID, SemesterID, Mark)Create Primary Key constraint using all three id key fields in the tableCreate Foreign Key Constraints for all three id keys referencing proper tables(Student, Course, Semester)Make sure that when the record for each course is created, the default value for the mark is 0 (Zero).***'
PRINT ''
CREATE TABLE StudentCourse
	(StudentID INT,
	CourseID INT,
	SemesterID VARCHAR(3),
	Mark INT DEFAULT 0.00,
	CONSTRAINT StudentCourse_StudentID_fk FOREIGN KEY(StudentID) REFERENCES Student(ID) ON DELETE CASCADE,
	CONSTRAINT StudentCourse_CourseID_fk FOREIGN KEY(CourseID) REFERENCES Course(ID) ON DELETE CASCADE,
	CONSTRAINT StudentCourse_SemesterID_fk FOREIGN KEY(SemesterID) REFERENCES Semester(ID) ON DELETE CASCADE,
	CONSTRAINT StudentCourse_StudentID_CourseID_SemesterID_pk PRIMARY KEY (StudentID, CourseID, SemesterID) 
	);

PRINT '***QUESTION 7 : Insert Records for Three Students into the student table. The names of the students are Carey Mahoney, Moses Hightower and Debbie Callahan.***'
PRINT ''
INSERT INTO Student(FirstName, LastName)
VALUES
('Carey', 'Mahoney');

INSERT INTO Student(FirstName, LastName)
VALUES
('Moses', 'Hightower');

INSERT INTO Student(FirstName, LastName)
VALUES
('Debbie', 'Callahan');

PRINT '***QUESTION 8 : Using IDs of the students insert their home and local addresses into the Address table. Use Google Maps to get street and city names. Do not insert gibberish.***'
PRINT ''
SET IDENTITY_INSERT Address ON
INSERT INTO Address(ID, Street, City, PostalCode, PhoneNumber, Email)
VALUES
(1, '575 Glen Manor Blvd.', 'WATERLOO', 'N2L 4T7', '(519) 188-2222', 'cmahoney@gmail.com');
INSERT INTO Address(ID, Street, City, PostalCode, PhoneNumber, Email)
VALUES
(2, '554 Mount Anne Dr.', 'WATERLOO', 'N2E 2S6', '(519) 000-7555', 'mhightower@gmail.com');
INSERT INTO Address(ID, Street, City, PostalCode, PhoneNumber, Email)
VALUES
(3, '183 Cedarvale Cres.', 'WATERLOO', 'N2L 4S8', '(519) 555-3569', 'dcallahan@gmail.com');
SET IDENTITY_INSERT Address OFF


PRINT '***QUESTION 9 : Insert 4 courses into the Course table. You can use your own courses as a reference for names and course codes.***'
PRINT ''
INSERT INTO Course(Name, CourseCode, Description)
VALUES
('Programming: Database Management', 'PROG8080', 'SQL queries');
INSERT INTO Course(Name, CourseCode, Description)
VALUES
('Programming: Software Development', 'PROG1245', 'C Sharp');
INSERT INTO Course(Name, CourseCode, Description)
VALUES
('Programming: Web Technology', 'PROG2240', 'HTML CSS');
INSERT INTO Course(Name, CourseCode, Description)
VALUES
('Data Structures', 'PROG 2020', 'DATA STRUCTURES');


PRINT '***QUESTION 10 : Insert records for Fall 2015, Winter 2016 and Summer 2016 Semester.***'
PRINT ''
INSERT INTO Semester(ID, Description)
VALUES
('F15', 'Fall 2015');
INSERT INTO Semester(ID, Description)
VALUES
('W16', 'Winter 2016');
INSERT INTO Semester(ID, Description)
VALUES
('S16', 'Summer 2016');

PRINT '***QUESTION 11 : Enroll students into courses by inserting proper records into the StudentCourse table. Use 2 courses per student. Enroll all of them into Fall 2015 semester. Do not give them marks.***'
PRINT ''
INSERT INTO StudentCourse(StudentID, CourseID, SemesterID)
VALUES
(1,1,'F15');
INSERT INTO StudentCourse(StudentID, CourseID, SemesterID)
VALUES
(1,2,'F15');
INSERT INTO StudentCourse(StudentID, CourseID, SemesterID)
VALUES
(2,3,'F15');
INSERT INTO StudentCourse(StudentID, CourseID, SemesterID)
VALUES
(2,4,'F15');
INSERT INTO StudentCourse(StudentID, CourseID, SemesterID)
VALUES
(3,1,'F15');
INSERT INTO StudentCourse(StudentID, CourseID, SemesterID)
VALUES
(3,2,'F15');


PRINT '***QUESTION 12 : Update marks for all courses for Moses Hightower, giving him grades of your choice.***'
PRINT ''
UPDATE StudentCourse
SET Mark = 65
WHERE StudentID = 1 AND CourseID = 1;
UPDATE StudentCourse
SET Mark = 95
WHERE StudentID = 1 AND CourseID = 2;

PRINT '***QUESTION 13 : Delete all records for Debbie Callahan in the proper order. Make sure, that you do not use extra delete operations where cascade delete was specified.***'
PRINT ''
DELETE FROM StudentCourse WHERE StudentID in (SELECT ID FROM Student WHERE FirstName='Debbie');
DELETE FROM Student WHERE FirstName='Debbie';

select * from StudentCourse;