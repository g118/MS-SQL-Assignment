/****** Script for SelectTopNRows command from SSMS  ******/

/* Name-		 Gurpreet Singh
   Student No. - 7557259	*/

/*Question 1.*/
print 'Question 1'
SELECT *
FROM AcademicStatus;

/*Question 2.*/
print 'Question 2'
SELECT number,academicstatuscode
FROM student
WHERE academicstatuscode ='D'
ORDER BY number desc;

/*Question 3.*/
print 'Question 3'
SELECT number,academicstatuscode
FROM student
WHERE academicstatuscode='D' OR academicStatusCode='s'
ORDER BY number asc;

/*Question 4.*/
print 'Question 4'
SELECT number,AcademicStatuscode
FROM student
WHERE  NOT academicStatusCode='N'
ORDER BY number asc;

/*Question 5.*/
print 'Question 5'
SELECT number,AcademicStatuscode
FROM student
WHERE academicStatusCode !='N'
ORDER BY number asc;

/*Question 6.*/
print 'Question 6'
SELECT DISTINCT countrycode
FROM person;

/*Question 7.*/
print 'Question 7'
SELECT amountPerSemester AS 'Current Fee', Item AS 'Incidental Fee', 
amountPerSemester *1.1 AS 'Increased Fee' 
FROM IncidentalFee
ORDER by item asc; 

/*Question 8.*/
print 'Question 8'
SELECT *
FROM coursestudent
WHERE finalmark <55 AND finalmark >0;

/*Question 9.*/
print 'Question 9'
SELECT number
FROM room
WHERE capacity>='40' AND memory='4GB' AND campuscode='D';

/*Question 10.*/
print 'Question 10'
SELECT number, schoolcode,campuscode
FROM employee
WHERE schoolcode='TAP' AND
(campuscode='D' OR campuscode='G' OR Campuscode='W')
 
