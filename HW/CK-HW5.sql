-- ALL SQL STATEMENTS EXECUTABLE; ALL RESTULTS AS EXPECTED
-- CASON KONZER -- DATABASE DESIGN APRIL 2021

/* Homework 5: Due Apr 07, 11:59 pm [20 pts]

Create tables as described with sample data, and then write SQL queries for the given problems.
 Note your confidence levels for each SQL query on a scale of [0, 10],
  with 0 indicating the lowest level of confidence, and 10 indicating the highest level of confidence. */

DROP TABLE Printer CASCADE CONSTRAINTS;
DROP TABLE Laptop CASCADE CONSTRAINTS;
DROP TABLE PC CASCADE CONSTRAINTS;
DROP TABLE Product CASCADE CONSTRAINTS;

CREATE TABLE Product (	maker VARCHAR(20),
                        model INT PRIMARY KEY,
                        type	VARCHAR(10)
                      );

CREATE TABLE PC (	model INT PRIMARY KEY,
                  speed NUMBER (4,2),
                  ram INT,
          				hd INT,
                  price NUMBER (7,2)
                );

CREATE TABLE Laptop (	model INT PRIMARY KEY,
                      speed NUMBER (4,2),
                      ram INT,
            					hd INT,
                      screen NUMBER (3,1),
            					price NUMBER (7,2)
                  	);

CREATE TABLE Printer (	model INT PRIMARY KEY,
                        color CHAR (6),
              					type VARCHAR(10),
              					price NUMBER (7,2)
                      );

INSERT INTO Product VALUES ('A', 1001, 'pc');
INSERT INTO Product VALUES ('A', 1002, 'pc');
INSERT INTO Product VALUES ('A', 1003, 'pc');
INSERT INTO Product VALUES ('A', 2004, 'laptop');
INSERT INTO Product VALUES ('A', 2005, 'laptop');
INSERT INTO Product VALUES ('A', 2006, 'laptop');
INSERT INTO Product VALUES ('B', 1004, 'pc');
INSERT INTO Product VALUES ('B', 1005, 'pc');
INSERT INTO Product VALUES ('B', 1006, 'pc');
INSERT INTO Product VALUES ('B', 2007, 'laptop');
INSERT INTO Product VALUES ('C', 1007, 'pc');
INSERT INTO Product VALUES ('D', 1008, 'pc');
INSERT INTO Product VALUES ('D', 1009, 'pc');
INSERT INTO Product VALUES ('D', 1010, 'pc');
INSERT INTO Product VALUES ('D', 3004, 'printer');
INSERT INTO Product VALUES ('D', 3005, 'printer');
INSERT INTO Product VALUES ('E', 1011, 'pc');
INSERT INTO Product VALUES ('E', 1012, 'pc');
INSERT INTO Product VALUES ('E', 1013, 'pc');
INSERT INTO Product VALUES ('E', 2001, 'laptop');
INSERT INTO Product VALUES ('E', 2002, 'laptop');
INSERT INTO Product VALUES ('E', 2003, 'laptop');
INSERT INTO Product VALUES ('E', 3001, 'printer');
INSERT INTO Product VALUES ('E', 3002, 'printer');
INSERT INTO Product VALUES ('E', 3003, 'printer');
INSERT INTO Product VALUES ('F', 2008, 'laptop');
INSERT INTO Product VALUES ('F', 2009, 'laptop');
INSERT INTO Product VALUES ('G', 2010, 'laptop');
INSERT INTO Product VALUES ('H', 3006, 'printer');
INSERT INTO Product VALUES ('H', 3007, 'printer');

INSERT INTO PC VALUES (1001, 3.66, 1024, 250, 2114);
INSERT INTO PC VALUES (1002, 2.10, 512, 250, 995);
INSERT INTO PC VALUES (1003, 1.42, 512, 80, 478);
INSERT INTO PC VALUES (1004, 2.80, 1024, 250, 649);
INSERT INTO PC VALUES (1005, 3.20, 512, 250, 630);
INSERT INTO PC VALUES (1006, 3.20, 1024, 320, 1049);
INSERT INTO PC VALUES (1007, 2.20, 1024, 200, 510);
INSERT INTO PC VALUES (1008, 2.20, 2048, 250, 770);
INSERT INTO PC VALUES (1009, 2.00, 1024, 250, 650);
INSERT INTO PC VALUES (1010, 2.80, 2048, 300, 770);
INSERT INTO PC VALUES (1011, 1.86, 2048, 160, 959);
INSERT INTO PC VALUES (1012, 2.80, 1024, 160, 649);
INSERT INTO PC VALUES (1013, 3.06, 512, 80, 529);

INSERT INTO Laptop VALUES (2001, 2.00, 2048, 240, 20.1, 3673);
INSERT INTO Laptop VALUES (2002, 1.73, 1024, 80, 17.0, 949);
INSERT INTO Laptop VALUES (2003, 1.80, 512, 60, 15.4, 549);
INSERT INTO Laptop VALUES (2004, 2.00, 512, 60, 13.3, 1150);
INSERT INTO Laptop VALUES (2005, 2.16, 1024, 120, 17.0, 2500);
INSERT INTO Laptop VALUES (2006, 2.00, 2048, 80, 15.4, 1700);
INSERT INTO Laptop VALUES (2007, 1.83, 1024, 120, 13.1, 1429);
INSERT INTO Laptop VALUES (2008, 1.60, 1024, 100, 15.4, 900);
INSERT INTO Laptop VALUES (2009, 1.60, 512, 80, 14.1, 680);
INSERT INTO Laptop VALUES (2010, 2.00, 2048, 160, 15.4, 2300);

INSERT INTO Printer VALUES (3001, 'true', 'ink-jet', 99);
INSERT INTO Printer VALUES (3002, 'false', 'laser', 139);
INSERT INTO Printer VALUES (3003, 'true', 'laser', 899);
INSERT INTO Printer VALUES (3004, 'true', 'ink-jet', 120);
INSERT INTO Printer VALUES (3005, 'false', 'laser', 99);
INSERT INTO Printer VALUES (3006, 'true', 'ink-jet', 100);
INSERT INTO Printer VALUES (3007, 'true', 'laser', 899);

commit;

/* The commit statement commits all the inserts into the different tables */

/*
Write SQL queries for the following problems.
 Your SQL queries should work for the above data, and should also work even if the above data changes.
  In other words, the above data is given to guide you to think in the right direction -
  - your queries should work even if the above tables have different data.
Also excecute the SQL query and show the results.
 If your queries do not work or gives a different result than expected, include the error message that you obtained,
  or say that you got a different than expected result.
   Note that the queries must be in a format that will allow me to copy and paste.
    The most convenient is if you include a .sql file with your queries, results, error messages and any notes. 

Note unless there is an order by, you can get results in different order than what is given as expected results, and this is not an error.

Score distribution: 1 pt for qns 1 - 8; 2 pts for qns 9 - 14.

Note down your confidence levels on a scale of [0, 10] for each of your SQL queries,
 with 0 indicating the lowest level of confidence and 10 indicating the highest level of confidence. */

-- 1. Find models for PCs that have a price of 600 or below.

SELECT model
FROM PC
WHERE PC.price <= 600;

-- confidence = 10 
/* Expected && RETURNED Results
     MODEL
----------
      1003 
      1007 
      1013 
*/

-- 2. Find the model number, speed and ram size for all PCs whose price is $600 or below.

SELECT model, speed, ram
FROM PC
WHERE PC.price <= 600;

-- confidence = 10 
/* Expected && RETURNED Results
     MODEL      SPEED        RAM
---------- ---------- ----------
      1003       1.42        512 
      1007        2.2       1024 
      1013       3.06        512 
*/

-- 3. Do the same as Qn 2, but rename the speed column speedInGH and the ram column ramInMB.

SELECT model, speed AS speedInGH, ram AS ramInMB
FROM PC
WHERE PC.price <= 600;

-- confidence = 10 
/* Expected && RETURNED Results
     MODEL  SPEEDINGH    RAMINMB
---------- ---------- ----------
      1003       1.42        512 
      1007        2.2       1024 
      1013       3.06        512 
*/

-- 4. Find the model number and hard-disk size for those PCs that have a speed atleast 3.2 and a price less than $2000.

SELECT model, hd
FROM PC
WHERE (PC.price <= 2000) AND (PC.speed >= 3.2);

-- confidence = 10 
/* Expected && RETURNED Results
     MODEL         HD
---------- ----------
      1005        250 
      1006        320 
*/

-- 5. Find the manufacturer and speed of PCs with a price of $600 or below.

SELECT maker, speed
FROM PRODUCT, PC
WHERE (PRODUCT.model = PC.model) AND (PC.price <= 600);

-- confidence = 10 
/* Expected && RETURNED Results
MAKER                     SPEED
-------------------- ----------
A                          1.42 
C                           2.2 
E                          3.06 
*/

-- 6. Find the model number and price of all products (of any type) made by manufacturer A.

(SELECT PRODUCT.model, PC.price
FROM PRODUCT, PC
WHERE (PRODUCT.model = PC.model) AND (PRODUCT.maker = 'A'))
UNION
(SELECT PRODUCT.model, LAPTOP.price
FROM PRODUCT, LAPTOP
WHERE (PRODUCT.model = LAPTOP.model) AND (PRODUCT.maker = 'A'))
UNION
(SELECT PRODUCT.model, PRINTER.price
FROM PRODUCT, PRINTER
WHERE (PRODUCT.model = PRINTER.model) AND (PRODUCT.maker = 'A'));

-- confidence = 10 
/* Expected && RETURNED Results
     MODEL      PRICE
---------- ----------
      1001       2114 
      1002        995 
      1003        478 
      2004       1150 
      2005       2500 
      2006       1700 
*/

-- 7. Find those manufacturers that sell Laptops but not PCs.

(SELECT DISTINCT maker
FROM PRODUCT, LAPTOP
WHERE PRODUCT.model IN LAPTOP.model)
MINUS
(SELECT DISTINCT maker
FROM PRODUCT, PC
WHERE PRODUCT.model IN PC.model);

-- confidence = 10
/* Expected && RETURNED Results
MAKER              
--------------------
F                    
G  
*/

-- 8. Find the model numbers of printers with the highest price

SELECT model
FROM PRINTER
WHERE price >= ALL (SELECT price FROM PRINTER);

-- confidence = 10 
/* Expected && RETURNED Results
     MODEL
----------
	3003
	3007 
*/

-- 9. Find the model numbers of PCs whose speed is slower than that of all Laptops.

SELECT model
FROM PC
WHERE PC.speed <= ALL (SELECT speed FROM LAPTOP);

-- confidence = 10 
/* Expected && RETURNED Results
     MODEL
----------
      1003 
*/

-- 10. Find the model number of the item (PC, Laptop, or Printer) with the highest price.

WITH MP AS
((SELECT DISTINCT model, price
FROM PC)
UNION
(SELECT DISTINCT model, price
FROM LAPTOP)
UNION
(SELECT DISTINCT model, price
FROM PRINTER))

SELECT model 
FROM MP
WHERE price >= ALL (SELECT price FROM MP);

-- confidence = 10 
/* Expected && RETURNED Results
     MODEL
----------
      2001 
*/

-- 11. Find the maker of the color printer with the lowest price.

WITH COLORP AS
(SELECT model
FROM PRINTER
WHERE color = 'true' AND price <= ALL  (SELECT price FROM PRINTER WHERE color = 'true'))

SELECT maker
FROM PRODUCT
WHERE PRODUCT.model = (SELECT model FROM COLORP);

-- confidence = 10 
/* Expected && RETURNED Results
MAKER              
--------------------
E                    

*/

-- 12. Find the maker(s) of the PC(s) with the fastest processor among all the PCs that have the smallest amount of RAM.

WITH OPTIMUMPC AS
(SELECT model
FROM
(SELECT model, speed 
FROM PC
WHERE PC.ram <= ALL (SELECT ram FROM PC))
WHERE speed >= ALL (SELECT speed FROM PC WHERE PC.ram <= ALL (SELECT ram FROM PC)))

SELECT maker
FROM PRODUCT
WHERE PRODUCT.model = (SELECT model FROM OPTIMUMPC);

-- confidence = 10 
/* Expected && RETURNED Results
MAKER              
--------------------
B 
*/

-- 13. Find those hard-disk sizes that occur in 2 or more PCs.

SELECT hd 
FROM PC
GROUP BY hd
HAVING COUNT (model) >= 2;

-- confidence = 10 
/* Expected && RETURNED Results
        HD
----------
       250 
        80 
       160 
*/

-- 14. Find the manufacturers of at least 2 different computers (PCs or Laptops) with speeds of at least 3.0

WITH FASTER AS
((SELECT model 
FROM PC
WHERE PC.speed >= 3.0)
UNION
(SELECT model
FROM LAPTOP
WHERE LAPTOP.speed >= 3.0))

SELECT maker
FROM PRODUCT
WHERE PRODUCT.model = ANY (SELECT model FROM FASTER)
GROUP BY maker
HAVING COUNT (model) >= 2;

-- confidence = 10 
/* Expected && RETURNED Results
MAKER              
--------------------
B                    

*/