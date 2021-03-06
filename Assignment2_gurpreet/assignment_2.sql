

/* Name- Gurpreet Singh, Student No. - 7557259*/
/* Question 1*/
PRINT '--QUESTION 1--'
Select Distinct Len(Firstname) AS 'First Name Length'
From Person
Order By 'First Name Length' DESC;

/*Question 2*/
PRINT '--QUESTION 2--'
Select Firstname, LEFT(Firstname,1) AS 'FIRST INITIAL', LOWER(Left(Firstname,1)) AS 'LOWER FIRST INITIAL'
From Person 
Where Left(Lastname,1)='P'
Order By Firstname ASC;

/*Question 3*/
PRINT'--QUESTION 3--'
Select Lastname,Substring(Lastname,1,7) AS 'FIRST SEVEN', LOWER(Substring(Lastname,1,7)) AS 'LOWER FIRST SEVEN'
From Person
Where Substring(Lastname,1,1)='P'
Order By Lastname ASC;

/*Question 4*/
PRINT '--QUESTION 4--'
Select Lower(Left(Firstname,1) + Substring(Lastname,1,7)) AS 'USER Id'
From Person
Where Left(Lastname,1)='P'
Order By 'USER ID' ASC;

/*QUESTION 5*/
PRINT '--QUESTION 5--'
Select Number AS 'COURSE CODE', NAME AS 'COURSE NAME'
FROM COURSE
WHERE CHARINDEX('database',name) > 0;

/*QUESTION 6*/
PRINT '--QUESTION 6--'
Select Convert(Char(10),Getdate(),102) AS 'TODAY',
 Convert(Char(10),Dateadd(Day,30,Getdate()),102) AS '30 DAYS',
 Convert(Char(10),Dateadd(Day,60,Getdate()),102) AS '60 DAYS',
 Convert(Char(10),Dateadd(Day,90,Getdate()),102) AS '90 DAYS',
 Convert(Char(10),Dateadd(Day,120,Getdate()),102) AS '120 DAYS';

 /*QUESTION 7, PART A*/
 PRINT '--QUESTION 7 PART A--'
 Select Person.Number AS 'Empoyee Number', 
 Year(Person.Birthdate) AS 'YEAR',
 Month(Person.Birthdate) AS 'MONTH',
 Day(Person.Birthdate) AS 'Day'
 From Person,Employee
 Where Person.Number=Employee.Number
 Order By Person.Birthdate ASC;

 /*QUESTION 7, PART B*/
 PRINT '--QUESTION 7 PART B--'
 Select Person.Number AS 'Employee Number',
 Datepart(YYYY,Person.birthdate) AS 'YEAR',
 Datepart(MM,Person.Birthdate) AS 'MONTH',
 Datepart(DD,Person.Birthdate) AS 'DAY'
 From Person,EMPLOYEE
 Where Person.Number=Employee.Number
 Order By Person.Birthdate ASC;

