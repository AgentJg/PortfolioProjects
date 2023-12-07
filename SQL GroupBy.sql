#  Grouping data


## Lab Instructions 

-- Lucky Shrub is a medium-sized garden design firm that sells indoor and outdoor plants, making them a one stop shop for clients.  In this lab, you must complete the following tasks to help Lucky Shrub group and filter grouped data for their reports using the GROUP BY and HAVING clauses.
    

 
/*The Orders table used for this lab contains the following data - OrderID, Department, OrderDate, OrderQty and OrderTotal as shown below.  

[Orders table]

+---------+--------------------+------------+----------+------------+
| OrderID | Department         | OrderDate  | OrderQty | OrderTotal |
+---------+--------------------+------------+----------+------------+
|       1 | Lawn Care          | 2022-05-05 |       12 |        500 |
|       2 | Decking            | 2022-05-22 |      150 |       1450 |
|       3 | Compost and Stones | 2022-05-27 |       20 |        780 |
|       4 | Trees and Shrubs   | 2022-06-01 |       15 |        400 |
|       5 | Garden Decor       | 2022-06-10 |        2 |       1250 |
|       6 | Lawn Care          | 2022-06-10 |       12 |        500 |
|       7 | Decking            | 2022-06-25 |      150 |       1450 |
|       8 | Compost and Stones | 2022-05-29 |       20 |        780 |
|       9 | Trees and Shrubs   | 2022-06-10 |       15 |        400 |
|      10 | Garden Decor       | 2022-06-10 |        2 |       1250 |
|      11 | Lawn Care          | 2022-06-25 |       10 |        400 |
|      12 | Decking            | 2022-06-25 |      100 |       1400 |
|      13 | Compost and Stones | 2022-05-30 |       15 |        700 |
|      14 | Trees and Shrubs   | 2022-06-15 |       10 |        300 |
|      15 | Garden Decor       | 2022-06-11 |        2 |       1250 |
|      16 | Lawn Care          | 2022-06-10 |       12 |        500 |
|      17 | Decking            | 2022-06-25 |      150 |       1450 |
|      18 | Trees and Shrubs   | 2022-06-10 |       15 |        400 |
|      19 | Lawn Care          | 2022-06-10 |       12 |        500 |
|      20 | Decking            | 2022-06-25 |      150 |       1450 |
|      21 | Decking            | 2022-06-25 |      150 |       1450 |
+---------+--------------------+------------+----------+------------+*/

   

/*Prerequisites  

To complete this lab, you must have Lucky Shrub database created in MySQL. You must also create and populate the Orders table with relevant data inside the Lucky Shrub database.  

The code to create the database and the Orders table is as follows.*/  

# 1: Create database 

# SQL 

CREATE DATABASE luckyshrub_db;
 

# 2: Use database 

#SQL 

USE luckyshrub_db;
 

CREATE TABLE Orders (
    OrderID INT,
    Department VARCHAR(100),
    OrderDate DATE,
    OrderQty INT,
    OrderTotal INT,
    PRIMARY KEY (OrderID)
); 


# 4: Insert data 

#SQL 

INSERT INTO Orders VALUES(1,'Lawn Care','2022-05-05',12,500),(2,'Decking','2022-05-22',150,1450),(3,'Compost and Stones','2022-05-27',20,780),(4,'Trees and Shrubs','2022-06-01',15,400),(5,'Garden Decor','2022-06-10',2,1250),(6,'Lawn Care','2022-06-10',12,500),(7,'Decking','2022-06-25',150,1450),(8,'Compost and Stones','2022-05-29',20,780),(9,'Trees and Shrubs','2022-06-10',15,400),(10,'Garden Decor','2022-06-10',2,1250),(11,'Lawn Care','2022-06-25',10,400), 
(12,'Decking','2022-06-25',100,1400),(13,'Compost and Stones','2022-05-30',15,700),(14,'Trees and Shrubs','2022-06-15',10,300),(15,'Garden Decor','2022-06-11',2,1250),(16,'Lawn Care','2022-06-10',12,500),(17,'Decking','2022-06-25',150,1450),(18,'Trees and Shrubs','2022-06-10',15,400),(19,'Lawn Care','2022-06-10',12,500),(20,'Decking','2022-06-25',150,1450),(21,'Decking','2022-06-25',150,1450);
   

 
/*This activity has two main objectives: 
Grouping data using the GROUP BY clause.
Filtering grouped data using the HAVING clause.*/

   

SELECT 
    *
FROM
    Orders;

SELECT 
    OrderDate
FROM
    Orders
GROUP BY OrderDate;

/*+------------+
| OrderDate  |
+------------+
| 2022-05-05 |
| 2022-05-22 |
| 2022-05-27 |
| 2022-06-01 |
| 2022-06-10 |
| 2022-06-25 |
| 2022-05-29 |
| 2022-05-30 |
| 2022-06-15 |
| 2022-06-11 |
+------------+*/


SELECT 
    OrderDate, COUNT(OrderID)
FROM
    Orders
GROUP BY OrderDate;


/*+------------+----------------+
| OrderDate  | Count(OrderID) |
+------------+----------------+
| 2022-05-05 |              1 |
| 2022-05-22 |              1 |
| 2022-05-27 |              1 |
| 2022-06-01 |              1 |
| 2022-06-10 |              7 |
| 2022-06-25 |              6 |
| 2022-05-29 |              1 |
| 2022-05-30 |              1 |
| 2022-06-15 |              1 |
| 2022-06-11 |              1 |
+------------+----------------+*/

SELECT 
    Department, SUM(OrderQty)
FROM
    Orders
GROUP BY Department;

/*+--------------------+---------------+
| Department         | SUM(OrderQty) |
+--------------------+---------------+
| Lawn Care          |            58 |
| Decking            |           850 |
| Compost and Stones |            55 |
| Trees and Shrubs   |            55 |
| Garden Decor       |             6 |
+--------------------+---------------+*/
 

SELECT 
    OrderDate, COUNT(OrderID)
FROM
    Orders
GROUP BY OrderDate
HAVING OrderDate BETWEEN '2022-06-01' AND '2022-06-30';

/*+------------+----------------+
| OrderDate  | COUNT(OrderID) |
+------------+----------------+
| 2022-06-01 |              1 |
| 2022-06-10 |              7 |
| 2022-06-25 |              6 |
| 2022-06-15 |              1 |
| 2022-06-11 |              1 |
+------------+----------------+*/
