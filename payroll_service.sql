/*UC1*/
mysql> create database payroll_service;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sakila             |
| sampledatabase     |
| sampledatabase2    |
| sampledatabase3    |
| sys                |
| world              |
+--------------------+
10 rows in set (0.01 sec)

mysql> use payroll_service;
Database changed

/*UC2*/
mysql> create table employee_payroll
    -> (id int PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(150),
    -> salary INT,
    -> start_date DATE
    -> );
Query OK, 0 rows affected (0.04 sec)
mysql> describe employee_payroll;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int          | NO   | PRI | NULL    | auto_increment |
| name       | varchar(150) | YES  |     | NULL    |                |
| salary     | int          | YES  |     | NULL    |                |
| start_date | date         | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

/*UC3*/
mysql> INSERT INTO employee_payroll (name,salary,start_date) VALUES('Bill',10000,'2018-01-03');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO employee_payroll (name,salary,start_date) VALUES('Mark',20000,'2019-11-13');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO employee_payroll (name,salary,start_date) VALUES('Charlie',30000,'2020-05-21');
Query OK, 1 row affected (0.01 sec)

/*UC4*/
mysql> select * from employee_payroll;
+----+---------+--------+------------+
| id | name    | salary | start_date |
+----+---------+--------+------------+
|  1 | Bill    |  10000 | 2018-01-03 |
|  2 | Mark    |  20000 | 2019-11-13 |
|  3 | Charlie |  30000 | 2020-05-21 |
+----+---------+--------+------------+
3 rows in set (0.00 sec)
