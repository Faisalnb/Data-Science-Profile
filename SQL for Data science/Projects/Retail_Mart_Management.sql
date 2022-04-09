'Write a query to create a database named SQL basics.'
CREATE database SQL_basics ; 
SHOW DATABASES;
/*Database
dvdrental
employee_db
information_schema
mysql
performance_schema
sql_basics
sql_intro
sys*/

'Write a query to select the database SQL basics.'
USE sql_basics;
SELECT database();
/*database()
sql_basics*/

'Write a query to create a product table with fields as product code, product name, price, stock and category, customer table with the fields as customer id, customer name, customer location, and customer phone number and, sales table with the fields as date, order number, product code, product name, quantity, and price.'
CREATE TABLE sql_basics.product_table(
product_code VARCHAR (100) NOT NULL,
product_name VARCHAR (100) NOT NULL,
price INTEGER NOT NULL CHECK(price>0),
stock INTEGER,
category VARCHAR(100)
 );
 
 
CREATE TABLE sql_basics.customer_table(
customer_id VARCHAR (100) NOT NULL,
customer_name VARCHAR (100) NOT NULL,
customer_location VARCHAR (100) NOT NULL,
customer_phone INTEGER NOT NULL
);

CREATE TABLE sql_basics.sales_table(
date VARCHAR (100)NOT NULL,
order_number VARCHAR (100) NOT NULL,
customer_id VARCHAR (100) NOT NULL,
customer_name VARCHAR (100) NOT NULL,
product_code VARCHAR (100) NOT NULL,
product_name VARCHAR (100) NOT NULL,
quantity INTEGER NOT NULL,
price INTEGER NOT NULL
);

SHOW TABLES;
/*Tables_in_sql_basics
customer_table
product_table
sales_table
*/

'Write a query to insert values into the tables.'
INSERT into
product_table (product_code,product_name,price,stock,category)
VALUES
("1","tulip","198","5","perfume"),
("2","cornoto","50","21","icecream"),
("3","Pen","10","52","Stationary"),
("4","Lays","10","20","snacks"),
("5","mayanoise","90","10","dip"),
("6","jam","105","10","spread"     ),
("7","shampoo","5","90","hair product"),
("8","axe","210","4","perfume"     ),
("9","park avenue","901","2","perfume"),
("10","wattagirl","201","3","perfume"),
("11","pencil","4","10","Stationary"),
("12","sharpener","5","90","Stationary"),
("13","sketch pen","30","10","Stationary"),
("14","tape","15","30","Stationary"),
("15","paint","60","12","Stationary"),
("16","chocolate","25","50","snacks"),
("17","biscuts","60","26","snacks" ),
("18","mango","100","21","fruits"  ),
("19","apple","120","9","fruits"   ),
("20","kiwi","140","4","fruits"    ),
("21","carrot","35","12","vegetable"),
("22","onion","22","38","vegetable"),
("23","tomato","21","15","vegetable"),
("24","serum","90","4","hair product"),
("25","conditioner","200","5","hair product"),
("26","oil bottle","40","2","kitchen utensil");

INSERT INTO
customer_table (customer_id,customer_name,customer_location,customer_phone)
VALUES
("1111","Nisha","kerala","8392320"         ),
("1212","Oliver","kerala","4353891"        ),
("1216","Nila","delhi","3323242"           ),
("1246","Vignesh","chennai","1111212"      ),
("1313","shiny","Maharastra","5454543"     ),
("1910","Mohan","mumbai","9023941"         ),
("2123","Biyush","Bombay","1253358"        ),
("3452","Alexander","West Bengal","1212134"),
("3921","Mukesh","Manipur","4232321"       ),
("5334","Christy","pakistan","2311111"     ),
("9021","Rithika","Kashmir","1121344"      ),
("9212","Jessica","banglore","1233435"     ),
("9875","Stephen","chennai","1212133"      );

DESCRIBE sales_table;
INSERT INTO sales_table (date,order_number,customer_id,customer_name,product_code,product_name,quantity,price)
VALUES
("24-07-2016","HM06","9212","Jessica","11","pencil","3","30"     ),
("19-10-2016","HM09","3921","Mukesh","17","biscuits","10","600"  ),
("30-10-2016","HM10","9875","Stephen","2","cornoto","10","500"   ),
("12-04-2018","HM03","1212","Oliver","20","kiwi","3","420"       ),
("02-05-2018","HM05","1910","Mohan","20","kiwi","2","280"        ),
("20-09-2018","HM08","5334","Chirsty","16","chocolate","2","50"  ),
("11-01-2019","HM07","1246","Vignesh","19","apple","5","600"     ),
("15-03-2019","HM01","1910","Mohan","5","mayanoise","4","360"    ),
("10-02-2021","HM04","1111","Nisha","25","conditioner","5","1000"),
("12-02-2021","HM02","2123","Biyush","3","Pen","2","20"          );

ALTER TABLE sales_table
add  s_code VARCHAR(100) NOT NULL,
add category VARCHAR (100) NOT NULL;
/*Field,Type,Null,Key,Default,Extra
date,varchar(100),NO,,NULL,
order_number,varchar(100),NO,,NULL,
product_code,varchar(100),NO,,NULL,
product_name,varchar(100),NO,,NULL,
quantity,int,NO,,NULL,
price,int,NO,,NULL,
s_code,varchar(100),NO,,NULL,
category,varchar(100),NO,,NULL,
*/

/*--Write a query to add two new columns such as S_no and categories to the sales table--
--Write a query to change the table name from customer-to-customer details--*/

ALTER TABLE sales_table
drop s_code,
drop category;

ALTER TABLE product_table
change column stock stock VARCHAR(100);
/*Field,Type,Null,Key,Default,Extra
product_code,varchar(100),NO,,NULL,
product_name,varchar(100),NO,,NULL,
price,int,NO,,NULL,
stock,varchar(100),YES,,NULL,
category,varchar(100),YES,,NULL,
*/

'Write a query to change the table name from customer-to-customer details.'
ALTER TABLE customer_table
RENAME to customer_details;
SHOW TABLES;
/*
Tables_in_sql_basics
customer_details
product_table
sales_table
*/

'Write a query to display order id, customer id, order date, price, and quantity from the sales table.'
SELECT order_number,customer_id,date,price,quantity from sales_table;
/*
order_number,customer_id,date,price,quantity
HM06,9212,24-07-2016,30,3
HM09,3921,19-10-2016,600,10
HM10,9875,30-10-2016,500,10
HM03,1212,12-04-2018,420,3
HM05,1910,02-05-2018,280,2
HM08,5334,20-09-2018,50,2
HM07,1246,11-01-2019,600,5
HM01,1910,15-03-2019,360,4
HM04,1111,10-02-2021,1000,5
HM02,2123,12-02-2021,20,2
*/

'Write a query to display all the details in the product table if the category is stationary.'
SELECT * from product_table
WHERE
category ='Stationary';
/*
product_code,product_name,price,stock,category
3,Pen,10,52,Stationary
11,pencil,4,10,Stationary
12,sharpener,5,90,Stationary
13,"sketch pen",30,10,Stationary
14,tape,15,30,Stationary
15,paint,60,12,Stationary
*/

'Write a query to display a unique category from the product table.\n'
SELECT DISTINCT category from product_table
ORDER BY category;
/*category
dip
fruits
"hair product"
icecream
"kitchen utensil"
perfume
snacks
spread
Stationary
vegetable
*/

'Write a query to display the sales details if quantity is greater than 2 and price is lesser than 500 from the sales table.\n'
SELECT * from sales_table
WHERE
quantity >2 AND price <500;
/*date,order_number,customer_id,customer_name,product_code,product_name,quantity,price
24-07-2016,HM06,9212,Jessica,11,pencil,3,30
12-04-2018,HM03,1212,Oliver,20,kiwi,3,420
15-03-2019,HM01,1910,Mohan,5,mayanoise,4,360
*/

'Write a query to display the customer’s name if the name ends with a.\n'
SELECT * from customer_details
WHERE customer_name LIKE '%a' ;
/*customer_id,customer_name,customer_location,customer_phone
1111,Nisha,kerala,8392320
1216,Nila,delhi,3323242
9021,Rithika,Kashmir,1121344
9212,Jessica,banglore,1233435
*/

SELECT * from product_table
ORDER BY
price DESC;
/*product_code,product_name,price,stock,category
9,"park avenue",901,2,perfume
8,axe,210,4,perfume
10,wattagirl,201,3,perfume
25,conditioner,200,5,"hair product"
1,tulip,198,5,perfume
20,kiwi,140,4,fruits
19,apple,120,9,fruits
6,jam,105,10,spread
18,mango,100,21,fruits
5,mayanoise,90,10,dip
24,serum,90,4,"hair product"
15,paint,60,12,Stationary
17,biscuts,60,26,snacks
2,cornoto,50,21,icecream
26,"oil bottle",40,2,"kitchen utensil"
21,carrot,35,12,vegetable
13,"sketch pen",30,10,Stationary
16,chocolate,25,50,snacks
22,onion,22,38,vegetable
23,tomato,21,15,vegetable
14,tape,15,30,Stationary
3,Pen,10,52,Stationary
4,Lays,10,20,snacks
7,shampoo,5,90,"hair product"
12,sharpener,5,90,Stationary
11,pencil,4,10,Stationary
*/

'Write a query to display the product code and category from similar categories that are greater than or equal to 2.\n'
SELECT * from product_table
GROUP BY category
HAVING stock>=2;
/*product_code,product_name,price,stock,category
1,tulip,198,5,perfume
2,cornoto,50,21,icecream
3,Pen,10,52,Stationary
4,Lays,10,20,snacks
5,mayanoise,90,10,dip
6,jam,105,10,spread
7,shampoo,5,90,"hair product"
18,mango,100,21,fruits
21,carrot,35,12,vegetable
26,"oil bottle",40,2,"kitchen utensil"
*/

SELECT
order_number,
customer_name,
FROM
sales_table
GROUP BY
ROLLUP(order_number, customer_name);

'Write a query to display the order number and the customer name to combine the results of the order and the customer tables including duplicate rows.\n'SELECT order_number,customer_name
FROM sales_table
UNION
SELECT customer_id,customer_name
FROM customer_details;
/*order_number,customer_name
HM06,Jessica
HM09,Mukesh
HM10,Stephen
HM03,Oliver
HM05,Mohan
HM08,Chirsty
HM07,Vignesh
HM01,Mohan
HM04,Nisha
HM02,Biyush
1111,Nisha
1212,Oliver
1216,Nila
1246,Vignesh
1313,shiny
1910,Mohan
2123,Biyush
3452,Alexander
3921,Mukesh
5334,Christy
9021,Rithika
9212,Jessica
9875,Stephen
*/