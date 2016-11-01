


/* Name- Gurpreet Singh, Student No. - 7557259*/
/* Question 1*/
PRINT '--QUESTION 1--'
DELETE FROM PERSON WHERE NUMBER = 7424476 ;
DELETE FROM COURSE WHERE NUMBER = 'BUS1070' AND NUMBER = 'LIBS1010';


/* Question2 */
PRINT '--QUESTION 2--'
SELECT C.NUMBER AS 'NUMBER', C.HOURS AS 'CREDIT HOURS', C.CREDITS AS 'CREDITS', C.NAME AS 'COURSENAME'
FROM COURSE C  
WHERE C.NUMBER IN (SELECT PC.COURSENUMBER FROM ProgramCourse PC WHERE PC.semester = 1 AND 
      PC.programCode IN ( SELECT P.code FROM Program p WHERE P.acronym = 'ITID'))
	  ORDER BY C.number ASC;

/* Question 3*/
PRINT '--QUESTION 3--'
SELECT P.NUMBER , P.LASTNAME ,P.FIRSTNAME
FROM PERSON P 
WHERE P.NUMBER IN (SELECT PA.STUDENTNUMBER FROM Payment PA WHERE PA.amount > 1000 AND
          PA.paymentMethodId IN(SELECT PM.id FROM PaymentMethod PM WHERE PM.explanation IN ('CASH','CERTIFIED CHEQUE')))
		  ORDER BY P.lastName;

/* Question 4*/
PRINT '--QUESTION 4--'
SELECT P.FIRSTNAME, P.LASTNAME
FROM PERSON P 
WHERE P.NUMBER IN (SELECT S.NUMBER FROM Student S WHERE S.isInternational = 1 AND 
		S.number IN (SELECT SP.studentNumber FROM StudentProgram SP WHERE SP.programCode IN 
					(SELECT P.CODE FROM Program P WHERE P.credentialCode IN 
					(SELECT C.CODE FROM Credential C WHERE C.code IN ('OCGC')))))
					ORDER BY P.lastName;

/* Question 5*/
PRINT '--QUESTION 5--'
INSERT INTO Person
	(number, lastname, firstname, street, city, provinceCode, countrycode, postalcode,
	mainPhone, alternatePhone, collegeEmail, personalEmail, birthdate) 
		VALUES
	('7424476', 'Taneja', 'Indu', 'FLAT NO. 100 TRIVENI APARTMENTS PITAM PURA','NEW DELHI', NULL, 'IND', '110034',
	'6610242','94324060195','iteneja@conestogac.on.ca', 'iteneja@bsnl.co.in','1989-10-07 00:00:00.000');
SELECT * FROM Person P
	WHERE P.number = 7424476;


/* Question 6*/
PRINT '--QUESTION 6--'
INSERT INTO Student
	(number, isInternational, academicStatusCode, financialStatusCode, sequentialNumber, balance, localStreet,
	localCity, localProvinceCode, localCountryCode, localPostalCode, localPhone)
	VALUES
	('7424476', 1,'N', 'P',0, 1130, '442 GIBSON ST N', 
	'Kitchener', 'ON', 'CAN', 'N2M 4T4', '(226) 147-2985');
SELECT S.number, S.isInternational, S.academicStatusCode,
		S.financialStatusCode, S.sequentialNumber, S.balance
		FROM Student S
		WHERE S.number = 7424476;
SELECT S.localStreet 
	FROM Student S
	WHERE S.number = 7424476;
SELECT S.localCity, S.localPostalCode
	FROM Student S
	WHERE S.number = 7424476;


/* Question 7*/
PRINT '--QUESTION 7--'
INSERT INTO StudentProgram
	(studentNumber, programCode, semester, programStatusCode)
	VALUES
	('7424476','0066C','1','G');
SELECT SP.studentNumber, SP.programCode, 
		SP.semester, SP.programStatusCode
		FROM StudentProgram SP
		WHERE SP.studentNumber = 7424476;

/* Question 8*/
PRINT '--QUESTION 8--'
INSERT INTO CourseStudent
(CourseOfferingId, studentNumber, finalMark)
VALUES
(62, 7424476, 0);
SELECT CourseStudent.CourseOfferingId, CourseStudent.studentNumber, CourseStudent.finalMark
	FROM CourseStudent
	WHERE CourseStudent.studentNumber = 7424476;


/* Question 9*/
PRINT '--QUESTION 9--'
DELETE FROM Course
	WHERE Course.number = 'LIBS1010';
INSERT INTO Course
(number, hours, credits, name, frenchName)
VALUES
('LIBS1010', 45, 3, 'Critical Thiking Skills','Pensée Critique');
SELECT * FROM Course
	WHERE Course.number = 'LIBS1010';


/* Question 10*/
PRINT '--QUESTION 10--'
INSERT INTO Course
VALUES
('BUS1070', 45, 3, 'Introduction To Human Relations','Introduction aux relations humaines');
SELECT * FROM Course
	WHERE Course.number = 'BUS1070';


/* Question 11*/
PRINT '--QUESTION 11--'
UPDATE IncidentalFee
	SET IncidentalFee.amountPerSemester = 100.00
	WHERE IncidentalFee.id IN (SELECT IncidentalFee.id 
							   FROM IncidentalFee
							   WHERE IncidentalFee.item = 'Technology Enhancement Fee');
BEGIN TRANSACTION
UPDATE IncidentalFee
	SET IncidentalFee.amountPerSemester = 150.00
	WHERE IncidentalFee.id IN (SELECT IncidentalFee.id 
									FROM IncidentalFee
									WHERE IncidentalFee.item = 'Technology Enhancement Fee');
ROLLBACK;
SELECT IncidentalFee.amountPerSemester
	FROM IncidentalFee
	WHERE IncidentalFee.item = 'Technology Enhancement Fee';

/* Question 12*/
PRINT '--QUESTION 12--'

BEGIN TRANSACTION
UPDATE IncidentalFee
	SET IncidentalFee.amountPerSemester = 200.00
	WHERE IncidentalFee.id IN (SELECT IncidentalFee.id 
								FROM IncidentalFee
								WHERE IncidentalFee.item = 'Technology Enhancement Fee');
COMMIT;
SELECT IncidentalFee.amountPerSemester
	FROM IncidentalFee
	WHERE IncidentalFee.item = 'Technology Enhancement Fee';