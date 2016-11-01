
/* NAME- GURPREET SINGH
STUDENT NO. - 7557259*/


PRINT '--QUESTION 1--'
SELECT (SELECT C.number
		FROM course c 
		where c.number = CoursePrerequisiteAnd.courseNumber) AS "Course Code",
		(SELECT C.name
		FROM course c
		WHERE c.number = CoursePrerequisiteAnd.courseNumber) AS "Course Name"
FROM CoursePrerequisiteAnd
where CoursePrerequisiteAnd.courseNumber = 'COMP2280'
ORDER BY CoursePrerequisiteAnd.courseNumber;

PRINT '--QUESTION 2--'
Select P.number AS "Number", P.firstname AS "Firstname", P.lastname AS "Lastname",
		(SELECT E.schoolcode
		 FROM Employee E
		 where P.number = E.number) AS "Schoolcode",
		(SELECT E.extension
		 FROM Employee E
		 WHERE P.number = E.number) AS "Extension"
FROM Person P
where P.lastname LIKE 'W%'
ORDER BY P.number;

PRINT '--QUESTION 3--'
SELECT P.number, P.firstname, P.lastname, P.city
FROM person P left outer join student ON (p.number = student.number)
WHERE P.number NOT IN (SELECT Student.number FROM Student)
ORDER BY P.lastname

PRINT '--QUESTION 4--'
SELECT Software.uniqueId AS "Unique ID", Software.product AS "Product Name"
FROM Software 
WHERE Software.uniqueId IN
	(SELECT LabSoftware.softwareUniqueId 
	 FROM Labsoftware
	 WHERE LabSoftware.roomId IN 
	(SELECT Room.id 
	 FROM Room 
	 WHERE Room.number = '2A205'))
ORDER BY Software.product;

PRINT '--QUESTION 5--'
SELECT CourseOffering.sessionCode AS "Session Code", CourseOffering.courseNumber AS "Course Number",
	(SELECT P.firstName
	 FROM Person P
	 WHERE P.number = CourseOffering.employeeNumber) AS "First Name",
	(SELECT P.lastName
	 FROM Person P 
	 WHERE P.number = CourseOffering.employeeNumber) AS "Last Name",
	(SELECT E.extension
	 FROM Employee E
	 WHERE E.number = dbo.CourseOffering.employeeNumber) AS "Extension"
FROM CourseOffering
WHERE CourseOffering.sessionCode = 'F10'
ORDER BY CourseOffering.courseNumber;

PRINT '--QUESTION 6--'
SELECT StudentOffence.notes AS "Reason",
	(SELECT (P.firstName + P.lastName)
	 FROM Person P
	 WHERE P.number = StudentOffence.studentNumber) AS "Name",
	(SELECT P.personalEmail
	 FROM Person P
	 WHERE P.number = dbo.StudentOffence.studentNumber) AS "Personal Email",
	(SELECT P.collegeEmail
	 FROM Person P
	 WHERE P.number = dbo.StudentOffence.studentNumber) AS "College Email"
FROM dbo.StudentOffence
ORDER BY dbo.StudentOffence.studentNumber;

PRINT '--QUESTION 7--'
SELECT e1.number AS "Employee", e1.reportsTo AS "Employee Reports To", e2.reportsTo AS "Supervisor Reports To"
FROM Employee AS e1 LEFT OUTER JOIN Employee AS e2
ON e1.reportsTo = e2.number;

PRINT '--QUESTION 8--'
SELECT Employee.schoolCode AS "School Code", Employee.extension AS "Extension",
	   (SELECT LOWER(LEFT(Person.firstName,1)+SUBSTRING(Person.lastName,1,7))
FROM Person
WHERE Person.number = Employee.number AND (LEFT(Person.lastName,1)) = 'K') AS "User Id"
FROM  Employee
ORDER BY "User Id" ASC;

PRINT '--QUESTION 9--'
SELECT Distinct Course.number AS "Number",Course.hours AS "Hours",Course.credits AS "Credits", Course.name AS "Name"
FROM Course LEFT JOIN CourseOffering
ON Course.number=CourseOffering.courseNumber 
WHERE CHARINDEX( 'Programming', Course.name) > 0 and SUBSTRING(CourseOffering.sessionCode,1,3) != 'F16'
ORDER BY dbo.Course.number;

