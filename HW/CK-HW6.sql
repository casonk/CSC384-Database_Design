-- Cason Konzer, Dr. Mani, Database Design, April 2021 (Aggregation, Grouping, Insertion, Deletion, Updates)
/* HW6. 20 pts. Due: Apr 16, 11:59 pm.

Create tables as described with sample data, and then write SQL queries for the given problems.
Note your confidence levels for each SQL query on a scale of [0, 10],
with 0 indicating the lowest level of confidence, and 10 indicating the highest level of confidence.

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

INSERT INTO PC VALUES (1001, 2.66, 1024, 250, 2114);
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
INSERT INTO Printer VALUES (3002, 'false', 'laser', 239);
INSERT INTO Printer VALUES (3003, 'true', 'laser', 899);
INSERT INTO Printer VALUES (3004, 'true', 'ink-jet', 120);
INSERT INTO Printer VALUES (3005, 'false', 'laser', 120);
INSERT INTO Printer VALUES (3006, 'true', 'ink-jet', 100);
INSERT INTO Printer VALUES (3007, 'true', 'laser', 200);

commit;

Write SQL queries for the following problems. Your SQL queries should work for the above data, and should also work even if the above data changes.
In other words, the above data is given to guide you to think in the right direction -- your queries should work even if the above tables have different data.
Also excecute the SQL query and show the results (either in text format or as a screen shot).
Note that the queries must be in a format that will allow me to copy and paste
If your query does not compile or gives a different result than expected, you MUST say so.

Note your confidence levels for each SQL query on a scale of [0, 10], with 0 indicating the lowest level of confidence, and 10 indicating the highest level of confidence. */

-- 1. Find the average speed of PCs [1 pt]

SELECT AVG(speed)
FROM PC;

-- CONFIDENCE == 10;

/* Expected Result: (note, I have used ROUND function in Oracle, however you do not need to use the round function.
AVGSPEED
--------
    2.48 
  *RETURNED Result:
AVGSPEED
--------
    2.48461538461538461538461538461538461538
*/

-- 2. Find the average speed of laptops costing over $1000. [1 pt]

SELECT AVG(speed)
FROM LAPTOP
WHERE price > 1000;

-- CONFIDENCE == 10;

/* Expected Result: 
AVGSPEED               
---------------------- 
2      
  *RETURNED Result:
AVGSPEED
--------
1.99833333333333333333333333333333333333
*/

-- 3. Find the average price of PCs made by manufacturer 'A'. [1 pt]

SELECT AVG(price)
FROM PC, PRODUCT
WHERE (PC.model = PRODUCT.model) AND (PRODUCT.maker = 'A');

-- CONFIDENCE == 10;

/* Expected Result: 
AVGPRICE               
---------------------- 
1195.67               
  *RETURNED Result: 
AVGPRICE               
---------------------- 
1195.666666666666666666666666666666666667
*/
-- 4. Find the average price of computers (a computer can be a PC or a Laptop) made by manufacturer 'E'. [1.5 pts]

WITH CPE AS
    ((SELECT price, model
    FROM PC)
  UNION ALL
    (SELECT price, model
    FROM LAPTOP))

SELECT AVG(price)
FROM CPE, PRODUCT
WHERE (CPE.model = PRODUCT.model) AND (PRODUCT.maker = 'E');

-- CONFIDENCE == 10;

/* Expected && RETURNED Result: 
AVGPRICE               
---------------------- 
1218  
*/

-- 5. Find for each different speed, the average price of a PC. [1 pt]

SELECT speed, AVG(price)
FROM PC
GROUP BY speed;

-- CONFIDENCE == 10;

/* Expected Result: 
SPEED AVGPRICE
----- --------
 1.42      478 
 1.86      959 
    2      650 
  2.1      995 
  2.2      640 
 2.66     2114 
  2.8   689.33 
 3.06      529 
  3.2    839.5  
  *RETURNED Result: 
SPEED AVGPRICE
----- --------
2.2   640
1.42  478
2	    650
2.8	  689.333333333333333333333333333333333333
3.2	  839.5
1.86	959
2.66	2114
2.1	  995
3.06	529
*/

-- 6. Find for each manufacturer, the average screen size of its laptops. [1 pts]

WITH LAPTOPMANUF AS
  (SELECT LAPTOP.model, screen, maker
  FROM PRODUCT, LAPTOP
  WHERE PRODUCT.model = LAPTOP.model)

SELECT maker, AVG(screen)
FROM LAPTOPMANUF
GROUP BY maker;

-- CONFIDENCE == 10;

/* Expected Result: 
MAKER                AVGSCREEN
-------------------- ---------
A                        15.23 
B                         13.1 
E                         17.5 
F                        14.75 
G                         15.4 
  *RETURNED Result: 
MAKER                AVGSCREEN
-------------------- ---------
A	                   15.23333333333333333333333333333333333333
B	                   13.1
E	                   17.5
F	                   14.75
G	                   15.4 
*/
-- 7. Find manufacturers that make at least three different models of PC. [1.5 pts]

WITH PCS AS
  (SELECT maker, PRODUCT.model
  FROM PRODUCT, PC
  WHERE PRODUCT.model = PC.model)

SELECT maker
FROM PCS
GROUP BY maker
HAVING COUNT (model) >= 3;

-- CONFIDENCE == 10;

/* Expected Result: 
MAKER              
--------------------
A                    
B                    
D                    
E              
  *RETURNED Result: 
MAKER              
--------------------
D
A
B
E
*/

-- 8. For each manufacturer, find the range of prices of all computers (a computer can be a PC or Laptop) sold by that manufacturer.
--    Also ORDER the results by manufacturer.
--    Your SQL query should return a table with 3 cols (maker, minPrice, maxPrice), where minPrice is the least price among all 
--    computers made by that manufacturer, and maxPrice is the max price among all computers made by that manufacturer. [1.5 pts]

WITH CPS AS
    ((SELECT DISTINCT maker, PRODUCT.model, PC.price
    FROM PRODUCT, PC
    WHERE PRODUCT.model = PC.model)
  UNION
    (SELECT DISTINCT maker, PRODUCT.model, LAPTOP.price
    FROM PRODUCT, LAPTOP
    WHERE PRODUCT.model = LAPTOP.model))

SELECT maker, MIN(price), MAX(price)
FROM CPS
GROUP BY maker
ORDER BY maker;

-- CONFIDENCE == 10;

/* Expected && RETURNED Result: 
MAKER                MINPRICE MAXPRICE
-------------------- -------- --------
A                         478     2500 
B                         630     1429 
C                         510      510 
D                         650      770 
E                         529     3673 
F                         680      900 
G                        2300     2300 
*/

-- 9. For each manufacturer that makes printers, find the average hard disk size of PCs made by that manufacturer. [1.5 pts]

WITH PRINTPCS AS
(SELECT DISTINCT PCMK, PCM, HD
FROM 
  (SELECT DISTINCT maker AS PRINTMK, PRODUCT.model AS PRINTM 
  FROM PRODUCT, PRINTER WHERE PRODUCT.model = PRINTER.model),
  (SELECT DISTINCT maker AS PCMK, PRODUCT.model AS PCM, hd 
  FROM PRODUCT, PC WHERE PRODUCT.model = PC.model)
WHERE PRINTMK = PCMK)

SELECT PCMK, ROUND(AVG(HD), 2)
FROM PRINTPCS
GROUP BY PCMK
ORDER BY PCMK;

-- CONFIDENCE == 10;

/* Expected && RETURNED Result: 
MAKER                ROUND(AVG(HD),2)
-------------------- ----------------
D                              266.67 
E                              133.33 
*/

-- 10. Using two INSERT statements, store in the database the fact that PC model 1100 is made by manufacturer C,
--     has speed 3.2, RAM 1024, hard disk 180, and sells for $2499 [1.5 pts]
/* Note that this requires an INSERT INTO both PC table and Product table. After insertion, check the PC and Product tables and ensure that the necessary rows are inserted. */
/* Note: For each update statement, you probably do not want to re-create the tables, instead, you may want to rollback the changes. This can be done as follows.
Step 1: Make sure that your SQL Worksheet in SQL Developer is NOT set to "autocommit".
 This can be done in SQL Developer by Tools -> Preferences -> Database -> Advanced. Make sure that the "Autocommit" box is NOT checked.
Step 2: After any insert/delete/update statements, issue a rollback statement as (discussed in class): rollback; */

INSERT INTO PRODUCT VALUES ('C', 1100, 'pc');
rollback;

INSERT INTO PC VALUES (1100, 3.2, 1024, 180, 2499);
rollback;

-- CONFIDENCE == 10;

-- 11. INSERT the facts that for every PC, there is a laptop with the same manufacturer, speed, RAM and hard disk,
--     a 17 inch screen, a model number 1100 greater, and a price $500 more. (Use two INSERT statements). [1.5 pts]
/* Note: This requires insert into both Product and Laptop tables. */

INSERT INTO PRODUCT (maker, PRODUCT.model, type)
SELECT maker, PRODUCT.model + 1100, 'laptop'
FROM PRODUCT, PC
WHERE PRODUCT.model =PC.model;
rollback;

INSERT INTO LAPTOP (model, speed, ram, hd, screen, price)
SELECT PRODUCT.model + 1100, speed, ram, hd, 17, price +500
FROM PRODUCT, PC
WHERE PRODUCT.model =PC.model;
rollback;

-- CONFIDENCE == 10;

-- 12. Delete all PCs with less than 100 gigabytes of hard disk. Use two DELETE statements. [1.5 pts]
/* Note: You may want to delete from the Product and PC tables. */

DELETE FROM PRODUCT
WHERE EXISTS 
  (SELECT PC.model FROM PC WHERE hd < 100 AND PRODUCT.model = PC.model);
rollback;

DELETE FROM PC
WHERE PC.hd <= 100;
rollback;

-- CONFIDENCE == 10;

-- 13. Delete all laptops made by a manufacturer who does not make printers. Use two DELETE statements. [1.5 pts]
/* Note: You may want to delete from Product and Laptop tables. */

/*
DELETE FROM LAPTOP
WHERE LAPTOP.model IN(
  SELECT model
  FROM PRODUCT
  WHERE (PRODUCT.model NOT IN (SELECT PRINTER.model FROM PRINTER)));
rollback;

DELETE FROM PRODUCT
WHERE PRODUCT.maker IN(
  SELECT maker
  FROM PRODUCT
  WHERE (PRODUCT.model NOT IN (SELECT PRINTER.model FROM PRINTER)));
rollback;
*/
-- CONFIDENCE == 0;

-- 14. Manufacurer A buys manufacturer B. Change all products made by B so that they are now made by A. Use one statement. [1 pt]

UPDATE PRODUCT
SET maker = 'A'
WHERE maker = 'B';
rollback;

-- CONFIDENCE == 10;

-- 15. For each PC, double the amount of RAM, and add 60 gigabytes to the amount of hard disk. Use one statement. [1 pt]

UPDATE PC
SET ram = 2*ram, hd = hd+60;
rollback;

-- CONFIDENCE == 10;

-- 16. For each laptop, add one inch to the screen size and subtract $100 from the price. Use one statement. [1 pt]

UPDATE LAPTOP
SET screen = screen+1, price = price-100;
rollback;

-- CONFIDENCE == 10;
