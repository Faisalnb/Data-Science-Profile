/*Write a query to create a students table with appropriate data types for student id, 
student first name, student last name, class, and age where the student last name, student first name,
 and student id should be a NOT NULL constraint, and the student id should be in a primary key.
*/

CREATE DATABASE STUDENT;
USE STUDENT;
CREATE TABLE students (
s_id VARCHAR (100) NOT NULL,
s_fname VARCHAR (100) NOT NULL,
s_lname VARCHAR (100) NOT NULL,
class VARCHAR (100) NOT NULL,
age INT CHECK(age>0)
);
/*Field,Type,Null,Key,Default,Extra
s_id,varchar(100),NO,,NULL,
s_fname,varchar(100),NO,,NULL,
s_lname,varchar(100),NO,,NULL,
class,varchar(100),NO,,NULL,
age,int,YES,,NULL,*/

CREATE TABLE marksheets(
score INT CHECK(score>0),
year VARCHAR (100) NOT NULL,
class VARCHAR (100) NOT NULL,
ranking INT NOT NULL,
s_id VARCHAR (100) NOT NULL);


/*Field,Type,Null,Key,Default,Extra
s_id,varchar(100),NO,,NULL,
year,varchar(100),NO,,NULL,
ranking,int,NO,,NULL,
class,varchar(100),NO,,NULL,
score,int,YES,,NULL,
*/

'Write a query to insert values in students and marksheet tables.\n'
INSERT INTO students
VALUES
("1","krishna","gee","10","18"   ),
("2","Stephen","Christ","10","17"),
("3","Kailash","kumar","10","18" ),
("4","ashish","jain","10","16"   ),
("5","khusbu","jain","10","17"   ),
("6","madhan","lal","10","16"    ),
("7","saurab","kothari","10","15"),
("8","vinesh","roy","10","14"    ),
("9","rishika","r","10","15"     ),
("10","sara","rayan","10","16"   ),
("11","rosy","kumar","10","16"   );

INSERT INTO marksheets
VALUES
("989","2014","10","1","1"  ),
("454","2014","10","10","2" ),
("880","2014","10","4","3"  ),
("870","2014","10","5","4"  ),
("720","2014","10","7","5"  ),
("670","2014","10","8","6"  ),
("900","2014","10","3","7"  ),
("540","2014","10","9","8"  ),
("801","2014","10","6","9"  ),
("420","2014","10","11","10"),
("970","2014","10","2","11" ),
("720","2014","10","12","12");

SELECT * from students;
/*s_id,s_fname,s_lname,class,age
1,krishna,gee,10,18
2,Stephen,Christ,10,17
3,Kailash,kumar,10,18
4,ashish,jain,10,16
5,khusbu,jain,10,17
6,madhan,lal,10,16
7,saurab,kothari,10,15
8,vinesh,roy,10,14
9,rishika,r,10,15
10,sara,rayan,10,16
11,rosy,kumar,10,16
*/
SELECT * from marksheets;
/*score,year,class,ranking,s_id
989,2014,10,1,1
454,2014,10,10,2
880,2014,10,4,3
870,2014,10,5,4
720,2014,10,7,5
670,2014,10,8,6
900,2014,10,3,7
540,2014,10,9,8
801,2014,10,6,9
420,2014,10,11,10
970,2014,10,2,11
720,2014,10,12,12
*/
'Write a query to display student id and student first name from the student table if the age is greater than or equal to 16 and the student\'s last name is Kumar.\n'
SELECT s_id,s_fname FROM students
WHERE age >= "16" AND s_lname LIKE "Kumar";
/*s_id,s_fname
3,Kailash
11,rosy
*/
'Write a query to display all the details from the marksheet table if the score is between 800 and 1000.\n'
SELECT * FROM marksheets 
WHERE score BETWEEN 800 AND 1000;
/*score,year,class,ranking,s_id
989,2014,10,1,1
880,2014,10,4,3
870,2014,10,5,4
900,2014,10,3,7
801,2014,10,6,9
970,2014,10,2,11
*/

'Write a query to display the marksheet details from the marksheet table by adding 5 to the score and by naming the column as new score.\n'
SELECT score,year,class,ranking,s_id,score+5 as new_score FROM marksheets;
/*score,year,class,ranking,s_id,new_score
989,2014,10,1,1,994
454,2014,10,10,2,459
880,2014,10,4,3,885
870,2014,10,5,4,875
720,2014,10,7,5,725
670,2014,10,8,6,675
900,2014,10,3,7,905
540,2014,10,9,8,545
801,2014,10,6,9,806
420,2014,10,11,10,425
970,2014,10,2,11,975
720,2014,10,12,12,725
*/

'Write a query to display the marksheet table in descending order of the  score.\n'
SELECT * from marksheets
ORDER BY score DESC;
/*score,year,class,ranking,s_id
989,2014,10,1,1
970,2014,10,2,11
900,2014,10,3,7
880,2014,10,4,3
870,2014,10,5,4
801,2014,10,6,9
720,2014,10,7,5
720,2014,10,12,12
670,2014,10,8,6
540,2014,10,9,8
454,2014,10,10,2
420,2014,10,11,10
*/

SELECT * from students
WHERE s_fname LIKE 'a%';
/*s_id,s_fname,s_lname,class,age
4,ashish,jain,10,16
*/