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

/*UC5*/
mysql> SELECT salary FROM employee_payroll WHERE name = 'Bill';
+--------+
| salary |
+--------+
|  10000 |
+--------+
1 row in set (0.00 sec)

mysql> SELECT salary FROM employee_payroll WHERE start_date BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
+--------+
| salary |
+--------+
|  10000 |
|  20000 |
|  30000 |
+--------+
3 rows in set (0.01 sec)

/*UC6*/
mysql> ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE employee_payroll set gender = 'M' WHERE name = 'Bill' or name = 'Charlie';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

/*UC7*/
mysql> SELECT SUM(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|       60000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(salary) FROM employee_payroll;
+-------------+
| AVG(salary) |
+-------------+
|  25000.0000 |
+-------------+
1 row in set (0.01 sec)

mysql> SELECT MIN(salary) FROM employee_payroll WHERE gender = 'M';
+-------------+
| MIN(salary) |
+-------------+
|       10000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(salary) FROM employee_payroll;
+-------------+
| MAX(salary) |
+-------------+
|       40000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM employee_payroll;
+----------+
| COUNT(*) |
+----------+
|        4 |
+----------+
1 row in set (0.02 sec)

mysql> SELECT gender, COUNT(*) FROM employee_payroll GROUP BY gender;
+--------+----------+
| gender | COUNT(*) |
+--------+----------+
| M      |        3 |
| F      |        1 |
+--------+----------+
2 rows in set (0.00 sec)

/*UC8*/
mysql> ALTER TABLE employee_payroll ADD phone varchar(10);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD address varchar(150) default 'pune';
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD department varchar(50) NOT NULL;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0


/* UC9 */
mysql> ALTER TABLE employee_payroll RENAME COLUMN salary to basic_pay;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD COLUMN deductions INT;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD COLUMN taxable_pay INT;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD COLUMN income_tax INT;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD COLUMN net_pay INT;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

/* UC10 */
mysql> INSERT INTO employee_payroll (name,gender,basic_pay,start_date,phone,address,department,deductions,taxable_pay,income_tax,net_pay) VALUES
    -> ('Terissa','F',20000,'2020-10-01','1010101010','mumbai','sales',1000,100,100,18000);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO employee_payroll (name,gender,basic_pay,start_date,phone,address,department,deductions,taxable_pay,income_tax,net_pay) VALUES
    ->  ('Terissa','F',20000,'2020-10-01','1010101010','mumbai','marketing',1000,100,100,18000);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee_payroll;
+----+---------+--------+-----------+------------+------------+---------+------------+------------+-------------+------------+---------+
| id | name    | gender | basic_pay | start_date | phone      | address | department | deductions | taxable_pay | income_tax | net_pay |
+----+---------+--------+-----------+------------+------------+---------+------------+------------+-------------+------------+---------+
|  1 | Bill    | M      |     10000 | 2018-01-03 | NULL       | pune    |            |       NULL |        NULL |       NULL |    NULL |
|  2 | Mark    | M      |     20000 | 2019-11-13 | NULL       | pune    |            |       NULL |        NULL |       NULL |    NULL |
|  3 | Charlie | M      |     30000 | 2020-05-21 | NULL       | pune    |            |       NULL |        NULL |       NULL |    NULL |
|  4 | Eva     | F      |     40000 | 2019-02-01 | NULL       | pune    |            |       NULL |        NULL |       NULL |    NULL |
|  5 | Terissa | F      |     20000 | 2020-10-01 | 1010101010 | mumbai  | sales      |       1000 |         100 |        100 |   18000 |
|  6 | Terissa | F      |     20000 | 2020-10-01 | 1010101010 | mumbai  | marketing  |       1000 |         100 |        100 |   18000 |
+----+---------+--------+-----------+------------+------------+---------+------------+------------+-------------+------------+---------+
6 rows in set (0.00 sec)

/* UC11 */

mysql> CREATE TABLE payroll
    -> (
    -> payroll_id INT PRIMARY KEY,
    -> basic_pay DOUBLE NOT NULL,
    -> employee_id INT,
    -> FOREIGN KEY (employee_id) REFERENCES employee_payroll(id)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> CREATE TABLE company
    -> (
    -> company_id INT PRIMARY KEY,
    -> company_name VARCHAR(50) NOT NULL,
    -> employee_id INT,
    -> FOREIGN KEY (employee_id) REFERENCES employee_payroll(id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE department
    -> (
    -> dept_id INT PRIMARY KEY,
    -> dept_name VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE dept_employee
    -> (
    -> dept_id INT NOT NULL,
    -> emp_id INT NOT NULL,
    -> FOREIGN KEY (dept_id) REFERENCES department(dept_id),
    -> FOREIGN KEY (emp_id) REFERENCES employee_payroll(id)
    -> );
Query OK, 0 rows affected (0.04 sec)
