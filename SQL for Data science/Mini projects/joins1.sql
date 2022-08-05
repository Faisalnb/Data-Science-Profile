USE PROJ_DB;
SHOW TABLES;
DESCRIBE proj_table;
SHOW FULL COLUMNS FROM emp_record_table;
SET default_storage_engine=INNODB;
/*Tables_in_proj_db
emp_record_table
proj_assign
proj_table
*/

SELECT * from emp_record_table LIMIT 10;
/*EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT,EXP,COUNTRY,CONTINENT,SALARY,EMP_RATING,"MANAGER ID"
E001,Arthur,Black,M,PRESIDENT,ALL,20,USA,"NORTH AMERICA",16500,5,E001
E005,Eric,Hoffman,M,"LEAD DATA SCIENTIST",FINANCE,11,USA,"NORTH AMERICA",8500,3,E103
E010,William,Butler,M,"LEAD DATA SCIENTIST",AUTOMOTIVE,12,FRANCE,EUROPE,9000,2,E428
E052,Dianna,Wilson,F,"SENIOR DATA SCIENTIST",HEALTHCARE,6,CANADA,"NORTH AMERICA",5500,5,E083
E057,Dorothy,Wilson,F,"SENIOR DATA SCIENTIST",HEALTHCARE,9,USA,"NORTH AMERICA",7700,1,E083
E083,Patrick,Voltz,M,MANAGER,HEALTHCARE,15,USA,"NORTH AMERICA",9500,5,E001
E103,Emily,Grove,F,MANAGER,FINANCE,14,CANADA,"NORTH AMERICA",10500,4,E001
E204,Karene,Nowak,F,"SENIOR DATA SCIENTIST",AUTOMOTIVE,8,GERMANY,EUROPE,7500,5,E428
E245,Nian,Zhen,M,"SENIOR DATA SCIENTIST",RETAIL,6,CHINA,ASIA,6500,2,E583
E260,Roy,Collins,M,"SENIOR DATA SCIENTIST",RETAIL,7,INDIA,ASIA,7000,3,E583
*/
SELECT * from proj_table LIMIT 10;
/*PROJ_ID,PROJ_NAME,DOMAIN,"START _DATE",CLOSURE_DATE,DEV_QTR,STATUS
P103,"Drug Discovery",HEALTHCARE,04-06-2021,6/20/2021,Q1,DONE
P105,"Fraud Detection",FINANCE,04-11-2021,6/25/2021,Q1,DONE
P109,"Market Basket Analysis",RETAIL,04-12-2021,6/30/2021,Q1,DELAYED
P201,"Self Driving Cars",AUTOMOTIVE,01-12-2022,3/30/2022,Q4,YTS
P204,"Supply Chain Management",AUTOMOTIVE,07/15/2021,9/28/2021,Q2,WIP
P208,"Algorithmic Trading",FINANCE,01/16/2022,3/27/2022,Q4,YTS
P302,"Early Detection of Lung Cancer",HEALTHCARE,10-08-2021,12/18/2021,Q3,YTS
P406,"Customer Sentiment Analysis",RETAIL,07-09-2021,9/24/2021,Q2,WIP
*/
-- Adding constraints to table
CREATE TABLE IF NOT EXISTS PROJ_DB.PROJ_ASSIGN (
EMP_ID VARCHAR(4) NOT NULL,
PROJ_ID VARCHAR(4) NOT NULL,
CONSTRAINT empid_check_2 CHECK ( SUBSTR(EMP_ID,1,1) = 'E'),
CONSTRAINT projid_check_2 CHECK ( SUBSTR(PROJ_ID,1,1) = 'P'),
FOREIGN KEY(EMP_ID) REFERENCES PROJ_DB.EMP_RECORD_TABLE(EMP_ID),
FOREIGN KEY(PROJ_ID) REFERENCES PROJ_DB.PROJ_TABLE(PROJ_ID)
) ENGINE=INNODB;

INSERT INTO proj_assign
VALUES
("E001","P103"),
("E005","P103"),
("E010","P105"),
("E052","P208"),
("E057","P406"),
("E083","P201"),
("E103","P406"),
("E204","P103"),
("E245","P103"),
("E260","P201"),
("E403","P105"),
("E428","P105"),
("E478","P109"),
("E505","P109"),
("E532","P109"),
("E583","P201"),
("E612","P204"),
("E620","P204"),
("E640","P406");


DESCRIBE proj_assign;
/*Field,Type,Null,Key,Default,Extra
EMP_ID,varchar(4),NO,MUL,NULL,
PROJ_ID,varchar(4),NO,MUL,NULL,
*/

SET FOREIGN_KEY_CHECKS=0;
--  INNer JOIN
SELECT e.EMP_ID,e.FIRST_NAME,e.LAST_NAME,e.DEPT,e.`MANAGER ID`,p.PROJ_ID
FROM emp_record_table e
INNER JOIN PROJ_ASSIGN p USING (EMP_ID)
WHERE e.ROLE NOT IN ("MANAGER", "PRESIDENT", "CEO")
ORDER BY e.`MANAGER ID`;
/*EMP_ID,FIRST_NAME,LAST_NAME,DEPT,"MANAGER ID",PROJ_ID
E052,Dianna,Wilson,HEALTHCARE,E083,P208
E057,Dorothy,Wilson,HEALTHCARE,E083,P406
E505,Chad,Wilson,HEALTHCARE,E083,P109
E005,Eric,Hoffman,FINANCE,E103,P103
E403,Steve,Hoffman,FINANCE,E103,P105
E010,William,Butler,AUTOMOTIVE,E428,P105
E204,Karene,Nowak,AUTOMOTIVE,E428,P103
E532,Claire,Brennan,AUTOMOTIVE,E428,P109
E245,Nian,Zhen,RETAIL,E583,P103
E260,Roy,Collins,RETAIL,E583,P201
E478,David,Smith,RETAIL,E583,P109
E620,Katrina,Allen,RETAIL,E612,P204
E640,Jenifer,Jhones,RETAIL,E612,P406
*/

-- LEFT JOIN
SELECT p.PROJ_ID,p.PROJ_NAME,p.DOMAIN,COUNT(DISTINCT(a.EMP_ID)) as EMP_COUNT,p.DEV_QTR,p.STATUS FROM proj_table p
LEFT JOIN proj_assign a ON p.PROJ_ID=a.PROJ_ID
WHERE p.STATUS IN ("DONE","WIP")
GROUP BY p.PROJ_NAME
ORDER BY PROJ_ID;
/*PROJ_ID,PROJ_NAME,DOMAIN,EMP_COUNT,DEV_QTR,STATUS
P103,"Drug Discovery",HEALTHCARE,4,Q1,DONE
P105,"Fraud Detection",FINANCE,3,Q1,DONE
P204,"Supply Chain Management",AUTOMOTIVE,2,Q2,WIP
P406,"Customer Sentiment Analysis",RETAIL,3,Q2,WIP
*/

-- UNION
SELECT e.EMP_ID,CONCAT (FIRST_NAME," ",LAST_NAME) as FULL_NAME,e.DEPT FROM emp_record_table e
WHERE e.ROLE = "MANAGER"
UNION
SELECT p.PROJ_ID,p.PROJ_NAME,p.DOMAIN FROM proj_table p
ORDER BY DEPT,EMP_ID;
/*EMP_ID,FULL_NAME,DEPT
E428,"Pete Allen",AUTOMOTIVE
P201,"Self Driving Cars",AUTOMOTIVE
P204,"Supply Chain Management",AUTOMOTIVE
E103,"Emily Grove",FINANCE
P105,"Fraud Detection",FINANCE
P208,"Algorithmic Trading",FINANCE
E083,"Patrick Voltz",HEALTHCARE
P103,"Drug Discovery",HEALTHCARE
P302,"Early Detection of Lung Cancer",HEALTHCARE
E583,"Janet Hale",RETAIL
E612,"Tracy Norris",RETAIL
P109,"Market Basket Analysis",RETAIL
P406,"Customer Sentiment Analysis",RETAIL
*/

-- Subqueries
SELECT p.proj_id,p.proj_name,p.domain FROM proj_table p
WHERE p.proj_id NOT IN (
SELECT DISTINCT a.proj_id FROM proj_assign a
);
/*proj_id,proj_name,domain
P302,"Early Detection of Lung Cancer",HEALTHCARE
*/

SELECT e.EMP_ID,CONCAT(e.FIRST_NAME," ",e.LAST_NAME) AS full_name,e.ROLE,e.DEPT FROM emp_record_table e
WHERE e.EXP= (
SELECT MAX(e.EXP) from emp_record_table e
);
/*EMP_ID,full_name,ROLE,DEPT
E001,"Arthur Black",PRESIDENT,ALL
*/

SELECT e.EMP_ID,CONCAT(e.FIRST_NAME," ",e.LAST_NAME) AS full_name,e.EXP FROM emp_record_table e
WHERE e.EXP< ALL(
SELECT AVG(EXP) FROM emp_record_table
);
/*EMP_ID,full_name,EXP
E052,"Dianna Wilson",6
E204,"Karene Nowak",8
E245,"Nian Zhen",6
E260,"Roy Collins",7
E403,"Steve Hoffman",4
E478,"David Smith",3
E505,"Chad Wilson",5
E532,"Claire Brennan",3
E620,"Katrina Allen",2
E640,"Jenifer Jhones",1
*/   

-- List down all projects in project tabel
SELECT PROJ_NAME FROM proj_table
WHERE  EXISTS
(
SELECT PROJ_ID
FROM PROJ_ASSIGN
);
/*PROJ_NAME
"Drug Discovery"
"Fraud Detection"
"Market Basket Analysis"
"Self Driving Cars"
"Supply Chain Management"
"Algorithmic Trading"
"Early Detection of Lung Cancer"
"Customer Sentiment Analysis"
*/

SELECT MAX(EXP) AS max_experience,MIN(EXP) as min_experience,FLOOR(AVG(EXP)) as avg_experience 
FROM 
(
SELECT * FROM emp_record_table
)AS Experience_overview;
/*max_experience,min_experience,avg_experience
20,1,8*/

