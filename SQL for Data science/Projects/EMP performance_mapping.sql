/*'1. Create a database named project and employee, then import data_science_team.csv and proj_table.csv into the project database and emp_record_table.csv into the employee database from the given resources.\n'
*/CREATE DATABASE project;
CREATE DATABASE employee;
USE employee;
ALTER TABLE emp_record_table
ADD CONSTRAINT constraint_name PRIMARY KEY(EMP_ID);

'3. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, and make a list of employees and details of their department.\n'
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER,DEPT FROM emp_record_table;
/*EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT
E260,Roy,Collins,M,RETAIL
E245,Nian,Zhen,M,RETAIL
E620,Katrina,Allen,F,RETAIL
E640,Jenifer,Jhones,F,RETAIL
E403,Steve,Hoffman,M,FINANCE
E204,Karene,Nowak,F,AUTOMOTIVE
E057,Dorothy,Wilson,F,HEALTHCARE
E010,William,Butler,M,AUTOMOTIVE
E478,David,Smith,M,RETAIL
E005,Eric,Hoffman,M,FINANCE
E052,Dianna,Wilson,F,HEALTHCARE
E505,Chad,Wilson,M,HEALTHCARE
E532,Claire,Brennan,F,AUTOMOTIVE
E083,Patrick,Voltz,M,HEALTHCARE
E583,Janet,Hale,F,RETAIL
E103,Emily,Grove,F,FINANCE
E612,Tracy,Norris,F,RETAIL
E428,Pete,Allen,M,AUTOMOTIVE
E001,Arthur,Black,M,ALL
*/

'4. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is:\n'/*
less than two
greater than four
between two and four*/

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER,DEPT,EMP_RATING FROM emp_record_table
WHERE EMP_RATING <2;
/*EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING
E620,Katrina,Allen,F,RETAIL,1
E057,Dorothy,Wilson,F,HEALTHCARE,1
E532,Claire,Brennan,F,AUTOMOTIVE,1
*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER,DEPT,EMP_RATING FROM emp_record_table
WHERE EMP_RATING > 4 ;
/*EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING
E204,Karene,Nowak,F,AUTOMOTIVE,5
E052,Dianna,Wilson,F,HEALTHCARE,5
E083,Patrick,Voltz,M,HEALTHCARE,5
E001,Arthur,Black,M,ALL,5
*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER,DEPT,EMP_RATING FROM emp_record_table
WHERE EMP_RATING BETWEEN 2 AND 4;
/*EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING
E260,Roy,Collins,M,RETAIL,3
E245,Nian,Zhen,M,RETAIL,2
E640,Jenifer,Jhones,F,RETAIL,4
E403,Steve,Hoffman,M,FINANCE,3
E010,William,Butler,M,AUTOMOTIVE,2
E478,David,Smith,M,RETAIL,4
E005,Eric,Hoffman,M,FINANCE,3
E505,Chad,Wilson,M,HEALTHCARE,2
E583,Janet,Hale,F,RETAIL,2
E103,Emily,Grove,F,FINANCE,4
E612,Tracy,Norris,F,RETAIL,4
E428,Pete,Allen,M,AUTOMOTIVE,4
*/

'5. Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table and then give the resultant column alias as NAME.\n'
SELECT FIRST_NAME,LAST_NAME,CONCAT (FIRST_NAME," ",LAST_NAME),DEPT AS NAME FROM emp_record_table
WHERE DEPT = "Finance";
/*FIRST_NAME,LAST_NAME,"CONCAT (FIRST_NAME," ",LAST_NAME)",NAME
Steve,Hoffman,"Steve Hoffman",FINANCE
Eric,Hoffman,"Eric Hoffman",FINANCE
Emily,Grove,"Emily Grove",FINANCE
*/
'6.Write a query to list only those employees who have someone reporting to them. Also, show the number of reporters (including the President).\n'
SELECT * from emp_record_table
WHERE ROLE IN ("MANAGER");
/*EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT,EXP,COUNTRY,CONTINENT,SALARY,EMP_RATING,"MANAGER ID"
E083,Patrick,Voltz,M,MANAGER,HEALTHCARE,15,USA,"NORTH AMERICA",9500,5,E001
E583,Janet,Hale,F,MANAGER,RETAIL,14,COLOMBIA,"SOUTH AMERICA",10000,2,E001
E103,Emily,Grove,F,MANAGER,FINANCE,14,CANADA,"NORTH AMERICA",10500,4,E001
E612,Tracy,Norris,F,MANAGER,RETAIL,13,INDIA,ASIA,8500,4,E001
E428,Pete,Allen,M,MANAGER,AUTOMOTIVE,14,GERMANY,EUROPE,11000,4,E001
*/
SELECT `MANAGER ID`,COUNT(EMP_ID) as REPORTEE_COUNT FROM emp_record_table
GROUP BY `MANAGER ID`
ORDER BY `MANAGER ID`;
/*"MANAGER ID",REPORTEE_COUNT
E001,6
E083,3
E103,2
E428,3
E583,3
E612,2
*/

'8.Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also include the respective employee rating along with the max emp rating for the department.\n'
SELECT EMP_ID, FIRST_NAME, LAST_NAME,ROLE, DEPT,EMP_RATING,MAX(EMP_RATING) OVER (PARTITION BY DEPT) as max_rating
FROM  emp_record_table;
/*EMP_ID,FIRST_NAME,LAST_NAME,ROLE,DEPT,EMP_RATING,max_rating
E001,Arthur,Black,PRESIDENT,ALL,5,5
E204,Karene,Nowak,"SENIOR DATA SCIENTIST",AUTOMOTIVE,5,5
E010,William,Butler,"LEAD DATA SCIENTIST",AUTOMOTIVE,2,5
E532,Claire,Brennan,"ASSOCIATE DATA SCIENTIST",AUTOMOTIVE,1,5
E428,Pete,Allen,MANAGER,AUTOMOTIVE,4,5
E403,Steve,Hoffman,"ASSOCIATE DATA SCIENTIST",FINANCE,3,4
E005,Eric,Hoffman,"LEAD DATA SCIENTIST",FINANCE,3,4
E103,Emily,Grove,MANAGER,FINANCE,4,4
E057,Dorothy,Wilson,"SENIOR DATA SCIENTIST",HEALTHCARE,1,5
E052,Dianna,Wilson,"SENIOR DATA SCIENTIST",HEALTHCARE,5,5
E505,Chad,Wilson,"ASSOCIATE DATA SCIENTIST",HEALTHCARE,2,5
E083,Patrick,Voltz,MANAGER,HEALTHCARE,5,5
E260,Roy,Collins,"SENIOR DATA SCIENTIST",RETAIL,3,4
E245,Nian,Zhen,"SENIOR DATA SCIENTIST",RETAIL,2,4
E620,Katrina,Allen,"JUNIOR DATA SCIENTIST",RETAIL,1,4
E640,Jenifer,Jhones,"JUNIOR DATA SCIENTIST",RETAIL,4,4
E478,David,Smith,"ASSOCIATE DATA SCIENTIST",RETAIL,4,4
E583,Janet,Hale,MANAGER,RETAIL,2,4
E612,Tracy,Norris,MANAGER,RETAIL,4,4
*/

'9.Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.\n'
SELECT EMP_ID, FIRST_NAME, LAST_NAME,ROLE,EMP_RATING, SALARY,
MAX(SALARY) OVER (PARTITION BY DEPT) as max_salary,MIN(SALARY) OVER (PARTITION BY DEPT) as min_salary
FROM  emp_record_table
ORDER BY SALARY DESC;
/*EMP_ID,FIRST_NAME,LAST_NAME,ROLE,EMP_RATING,SALARY,max_salary,min_salary
E001,Arthur,Black,PRESIDENT,5,16500,16500,16500
E428,Pete,Allen,MANAGER,4,11000,11000,4300
E103,Emily,Grove,MANAGER,4,10500,10500,5000
E583,Janet,Hale,MANAGER,2,10000,10000,2800
E083,Patrick,Voltz,MANAGER,5,9500,9500,5000
E010,William,Butler,"LEAD DATA SCIENTIST",2,9000,11000,4300
E005,Eric,Hoffman,"LEAD DATA SCIENTIST",3,8500,10500,5000
E612,Tracy,Norris,MANAGER,4,8500,10000,2800
E057,Dorothy,Wilson,"SENIOR DATA SCIENTIST",1,7700,9500,5000
E204,Karene,Nowak,"SENIOR DATA SCIENTIST",5,7500,11000,4300
E260,Roy,Collins,"SENIOR DATA SCIENTIST",3,7000,10000,2800
E245,Nian,Zhen,"SENIOR DATA SCIENTIST",2,6500,10000,2800
E052,Dianna,Wilson,"SENIOR DATA SCIENTIST",5,5500,9500,5000
E403,Steve,Hoffman,"ASSOCIATE DATA SCIENTIST",3,5000,10500,5000
E505,Chad,Wilson,"ASSOCIATE DATA SCIENTIST",2,5000,9500,5000
E532,Claire,Brennan,"ASSOCIATE DATA SCIENTIST",1,4300,11000,4300
E478,David,Smith,"ASSOCIATE DATA SCIENTIST",4,4000,10000,2800
E620,Katrina,Allen,"JUNIOR DATA SCIENTIST",1,3000,10000,2800
E640,Jenifer,Jhones,"JUNIOR DATA SCIENTIST",4,2800,10000,2800
*/

'10.Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.\n'
SELECT EMP_ID, FIRST_NAME, LAST_NAME,EXP,
RANK() OVER (ORDER BY EXP) AS experience_rank, DENSE_RANK() OVER (ORDER BY EXP) AS experience_dense_rank
FROM emp_record_table;
/*EMP_ID,FIRST_NAME,LAST_NAME,EXP,experience_rank,experience_dense_rank
E640,Jenifer,Jhones,1,1,1
E620,Katrina,Allen,2,2,2
E478,David,Smith,3,3,3
E532,Claire,Brennan,3,3,3
E403,Steve,Hoffman,4,5,4
E505,Chad,Wilson,5,6,5
E245,Nian,Zhen,6,7,6
E052,Dianna,Wilson,6,7,6
E260,Roy,Collins,7,9,7
E204,Karene,Nowak,8,10,8
E057,Dorothy,Wilson,9,11,9
E005,Eric,Hoffman,11,12,10
E010,William,Butler,12,13,11
E612,Tracy,Norris,13,14,12
E583,Janet,Hale,14,15,13
E103,Emily,Grove,14,15,13
E428,Pete,Allen,14,15,13
E083,Patrick,Voltz,15,18,14
E001,Arthur,Black,20,19,15
*/
'11.Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record table.\n'
CREATE VIEW  countries_view AS
SELECT COUNTRY,EMP_ID,FIRST_NAME,LAST_NAME,SALARY FROM emp_record_table
WHERE SALARY > 6000
ORDER BY SALARY;

SELECT * FROM countries_view;
/*COUNTRY,EMP_ID,FIRST_NAME,LAST_NAME,SALARY
CHINA,E245,Nian,Zhen,6500
INDIA,E260,Roy,Collins,7000
GERMANY,E204,Karene,Nowak,7500
USA,E057,Dorothy,Wilson,7700
USA,E005,Eric,Hoffman,8500
INDIA,E612,Tracy,Norris,8500
FRANCE,E010,William,Butler,9000
USA,E083,Patrick,Voltz,9500
COLOMBIA,E583,Janet,Hale,10000
CANADA,E103,Emily,Grove,10500
GERMANY,E428,Pete,Allen,11000
USA,E001,Arthur,Black,16500
*/

