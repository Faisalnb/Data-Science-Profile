mysql --host=sqoopdb.slbdh.cloudlabs.com -u faizalnajeeb761gmail -p
Enter password: faizalnajeeb761gmailtojpx
/*Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MySQL connection id is 7692
Server version: 8.0.20 MySQL Community Server - GPL
Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
*/

show databases;
+----------------------+
| Database             |
+----------------------+
| faizalnajeeb761gmail |
| information_schema   |
+----------------------+


 create table employee(Id INT NOT NULL, Name VARCHAR(100) NOT
    -> NULL, Salary INT NOT NULL,
    -> Department VARCHAR(100) NOT NULL, Designation VARCHAR(100) NOT NULL, PRIMARY KEY(Id));
	
describe employee;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| Id          | int          | NO   | PRI | NULL    |       |
| Name        | varchar(100) | NO   |     | NULL    |       |
| Salary      | int          | NO   |     | NULL    |       |
| Department  | varchar(100) | NO   |     | NULL    |       |
| Designation | varchar(100) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+

MySQL [faizalnajeeb761gmail]>insert into employee values(201,"Peter",50000,"It","Developer");
Query OK, 1 row affected (0.00 sec)
MySQL [faizalnajeeb761gmail]> insert into employee values(202,"Alice",60000,"Sales","Manager");
Query OK, 1 row affected (0.01 sec)
MySQL [faizalnajeeb761gmail]> insert into employee values(203,"Jack",70000,"Operations","Director");
Query OK, 1 row affected (0.01 sec)
MySQL [faizalnajeeb761gmail]> insert into employee values(205,"John",70000,"Support","Director");
Query OK, 1 row affected (0.00 sec)

MySQL [faizalnajeeb761gmail]> select * from employee;
+-----+-------+--------+------------+-------------+
| Id  | Name  | Salary | Department | Designation |
+-----+-------+--------+------------+-------------+
| 201 | Peter |  50000 | It         | Developer   |
| 202 | Alice |  60000 | Sales      | Manager     |
| 203 | Jack  |  70000 | Operations | Director    |
| 205 | John  |  70000 | Support    | Director    |
+-----+-------+--------+------------+-------------+


sqoop import --connect jdbc:mysql://sqoopdb.slbdh.cloudlabs.com/faizalnajeeb761gmail -- username faizalnajeeb761gmail --password faizalnajeeb761gmailtojpx --table employee –target - dir /user/faizalnajeeb761gmail/simplilearn --m 1