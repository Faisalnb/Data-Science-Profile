USE EXAMPLE;
CREATE TABLE EXAMPLE.patients_table(
date VARCHAR (100) NOT NULL,
pid VARCHAR (100) NOT NULL,
p_name VARCHAR (100) NOT NULL,
age INT NOT NULL CHECK(age>0),
weight INT NOT NULL CHECK(weight>0),
gender  VARCHAR (100) NOT NULL,
location VARCHAR (100) NOT NULL,
phone_no VARCHAR (100) NOT NULL,
disease VARCHAR (100) NOT NULL,
doctor_name VARCHAR (100) NOT NULL,
doctor_id VARCHAR (100) NOT NULL
);

DESCRIBE patients_table;
/*Field,Type,Null,Key,Default,Extra
date,varchar(100),NO,,NULL,
pid,varchar(100),NO,,NULL,
p_name,varchar(100),NO,,NULL,
age,int,NO,,NULL,
weight,int,NO,,NULL,
gender,char(1),NO,,NULL,
location,varchar(100),NO,,NULL,
phone_no,varchar(100),NO,,NULL,
disease,varchar(100),NO,,NULL,
doctor_name,varchar(100),NO,,NULL,
doctor_id,varchar(100),NO,,NULL,
*/

INSERT INTO patients_table
VALUES
("15-06-2019","AP2021","Sarath","67","76","Male","chennai","5462829","Cardiac","Mohan","21" ),
("13-02-2019","AP2022","John","62","80","Male","banglore","1234731","Cancer","Suraj","22"   ),
("08-01-2018","AP2023","Henry","43","65","Male","Kerala","9028320","Liver","Mehta","23"     ),
("04-02-2020","AP2024","Carl","56","72","Female","Mumbai","9293829","Asthma","Karthik","24" ),
("15-09-2017","AP2025","Shikar","55","71","Male","Delhi","7821281","Cardiac","Mohan","21"   ),
("22-07-2018","AP2026","Piysuh","47","59","Male","Haryana","8912819","Cancer","Suraj","22"  ),
("25-03-2017","AP2027","Stephen","69","55","Male","Gujarat","8888211","Liver","Mehta","23"  ),
("22-04-2019","AP2028","Aaron","75","53","Male","Banglore","9012192","Asthma","Karthik","24");

'Write a query to display the total number of patients in the table.\n'
SELECT COUNT(DISTINCT (pid)) as Total_patients FROM patients_table;

'Write a query to display the patient id, patient name, gender, and disease of the patient whose age is maximum.\n'
SELECT pid,p_name,gender,disease,MAX(age) as max_age FROM patients_table;
/*pid,p_name,gender,disease,max_age
AP2021,Sarath,Male,Cardiac,75
*/

'Write a query to display patient id and patient name with the current date.\n'
SELECT pid,p_name,NOW() as `Current_date` FROM patients_table;
/*pid,p_name,Current_date
AP2021,Sarath,"2022-01-30 15:53:48"
AP2022,John,"2022-01-30 15:53:48"
AP2023,Henry,"2022-01-30 15:53:48"
AP2024,Carl,"2022-01-30 15:53:48"
AP2025,Shikar,"2022-01-30 15:53:48"
AP2026,Piysuh,"2022-01-30 15:53:48"
AP2027,Stephen,"2022-01-30 15:53:48"
AP2028,Aaron,"2022-01-30 15:53:48"
*/

/*Write a query to display the old patient’s name and new patient's name in uppercase.
Write a query to display the patient’s name along with the length of their name*/

SELECT CONCAT(UCASE(p_name)," ","(",length(p_name),")") as Names_inUpper_case FROM patients_table;
/*Names_inUpper_case
"SARATH (6)"
"JOHN (4)"
"HENRY (5)"
"CARL (4)"
"SHIKAR (6)"
"PIYSUH (6)"
"STEPHEN (7)"
"AARON (5)"
*/


SELECT p_name,IF(gender="Male","M","F") as gender_update FROM patients_table;
/*p_name,gender_update
Sarath,M
John,M
Henry,M
Carl,F
Shikar,M
Piysuh,M
Stephen,M
Aaron,M
*/


SELECT CONCAT(p_name,"-",doctor_name) as patient_doctor_column FROM patients_table;
/*patient_doctor_column
Sarath-Mohan
John-Suraj
Henry-Mehta
Carl-Karthik
Shikar-Mohan
Piysuh-Suraj
Stephen-Mehta
Aaron-Karthik
*/

SELECT age,log10(age) as Log_age FROM patients_table;
/*age,Log_age
67,1.8260748027008264
62,1.792391689498254
43,1.6334684555795864
56,1.7481880270062005
55,1.7403626894942439
47,1.6720978579357175
69,1.8388490907372552
75,1.8750612633917
*/
'Write a query to extract the year from the given date in a separate column.\n'
SELECT *,(MID(date,7,4)) as date_extract FROM patients_table;
/*date,pid,p_name,age,weight,gender,location,phone_no,disease,doctor_name,doctor_id,date_extract
15-06-2019,AP2021,Sarath,67,76,Male,chennai,5462829,Cardiac,Mohan,21,2019
13-02-2019,AP2022,John,62,80,Male,banglore,1234731,Cancer,Suraj,22,2019
08-01-2018,AP2023,Henry,43,65,Male,Kerala,9028320,Liver,Mehta,23,2018
04-02-2020,AP2024,Carl,56,72,Female,Mumbai,9293829,Asthma,Karthik,24,2020
15-09-2017,AP2025,Shikar,55,71,Male,Delhi,7821281,Cardiac,Mohan,21,2017
22-07-2018,AP2026,Piysuh,47,59,Male,Haryana,8912819,Cancer,Suraj,22,2018
25-03-2017,AP2027,Stephen,69,55,Male,Gujarat,8888211,Liver,Mehta,23,2017
22-04-2019,AP2028,Aaron,75,53,Male,Banglore,9012192,Asthma,Karthik,24,2019
*/

SELECT pid,p_name,IF (age>40 ,"YES" , "NO") as age_grps FROM patients_table;
/*pid,p_name,age_grps
AP2021,Sarath,YES
AP2022,John,YES
AP2023,Henry,YES
AP2024,Carl,YES
AP2025,Shikar,YES
AP2026,Piysuh,YES
AP2027,Stephen,YES
AP2028,Aaron,YES
*/

SELECT doctor_name,COUNT(*) as Count FROM patients_table
GROUP BY doctor_id HAVING COUNT(doctor_id) > 1;
/*doctor_name,Count
Mohan,2
Suraj,2
Mehta,2
Karthik,2
*/

