USE EXAMPLE;
SELECT * FROM emp_data;

SELECT ï»¿EMP_ID,FIRST_NAME,LAST_NAME FROM emp_data
WHERE ROLE ="MANAGER";

EXPLAIN SELECT ï»¿EMP_ID, FIRST_NAME, LAST_NAME FROM emp_data WHERE
ROLE = 'MANAGER';

USE sql_intro;
SHOW TABLES;
DESCRIBE sample_superstore;

/*You should determine the sum of the sales and profit columns, calculate the
average profit, count the total number of products with a price greater than 100, and
calculate the maximum profit and loss from the superstore table*/

SELECT COUNT(Sales) as Updated_value,
SUM(Sales) as Sum_of_Sales,
SUM(Profit) as Sum_of_Profit,
AVG(Profit) as Mean_profit,
MAX(Profit) as Max_profit,
ABS(MIN(Profit)) AS Max_loss FROM sample_superstore
WHERE Sales>100;

SELECT `Order ID` FROM sample_superstore
LIMIT 10;

'You are required to analyze the superstore table by sorting the column sales in\ndescending order and finding the first twenty records.'

SELECT Sales FROM sample_superstore
ORDER BY Sales DESC
LIMIT 10;


SELECT length(City) AS Length_of_city FROM sample_superstore;

SELECT NOW();

SELECT LCASE("HELLO WORLD");

/*You are required to extract the order number from the column order ID and
list the shipping and delivery dates. Also, compare these dates with the present date.*/

SELECT MID(`Order ID`,9,14) as Order_number,`Order Date`,`Ship Date`,Now()
FROM sample_superstore;

/*You are required to display the customer's name, city, state, and postal code
from the superstore table in a single column a ddress */

USE sql_intro;
SELECT * from sample_superstore
LIMIT 5;
SELECT CONCAT(lcase(`Customer Name`)," ","(",length(`Customer Name`),")"," ",UCASE(`City`)," ",UCASE(State)," ",UCASE(Country)," ",`Postal Code`)
as Address FROM sample_superstore;

SELECT TRUNCATE(1345.32,1);

SHOW INDEXES FROM sample_superstore;

/*You are required to check for profit in the profit column and convert the
datatype of the quantity column to decimal*/
SELECT CONVERT(Quantity,decimal(10,2)) as converted_column ,Profit,IF(ABS(Profit)=Profit,"Profit","Loss") as profit_loss FROM sample_superstore;

