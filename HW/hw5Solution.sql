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

-- 1. Find models for PCs that have a price of 600 or below.

SELECT model
from pc
WHERE price <= 600;

/* Expected Results
     MODEL
----------
      1003 
      1007 
      1013 
*/

-- 2. Find the model number, speed and ram size for all PCs whose price is $600 or below.

SELECT model, speed, ram
from pc
WHERE price <= 600;

/* Expected Results
     MODEL      SPEED        RAM
---------- ---------- ----------
      1003       1.42        512 
      1007        2.2       1024 
      1013       3.06        512 
*/

-- 3. Do the same as Qn 2, but rename the speed column speedInGH and the ram column ramInMB.

select model, speed as speedingh, ram as raminmb
FROM PC
WHERE price <= 600;

/* Expected Results
     MODEL  SPEEDINGH    RAMINMB
---------- ---------- ----------
      1003       1.42        512 
      1007        2.2       1024 
      1013       3.06        512 
*/

-- 4. Find the model number and hard-disk size for those PCs that have a speed atleast 3.2 and a price less than $2000.

SELECT model, hd
FROM PC
WHERE speed >= 3.2 AND price < 2000;

/* Expected Results
     MODEL         HD
---------- ----------
      1005        250 
      1006        320 
*/

-- 5. Find the manufacturer and speed of PCs with a price of $600 or below.

SELECT maker, speed
from pc, product
WHERE price <= 600 and PC.model = Product.model;

/* Expected Results
MAKER                     SPEED
-------------------- ----------
A                          1.42 
C                           2.2 
E                          3.06 
*/

-- 6. Find the model number and price of all products (of any type) made by manufacturer A.

SELECT PC.model, price
FROM PC, Product
WHERE maker='A' AND PC.model = Product.model
UNION ALL
SELECT Laptop.model, price
FROM Laptop, Product
WHERE maker='A' AND Laptop.model = Product.model
UNION ALL
SELECT Printer.model, price
FROM Printer, Product
WHERE maker='A' AND Printer.model = Product.model;

-- note that we can use UNION ALL instead of UNION
-- Another equivalent query is to first union PC, Laptop, Printer and then join with Product. The SQL for this is:

SELECT Item.model, price
FROM (  SELECT model, price FROM PC UNION
        SELECT model, price FROM Laptop UNION
        SELECT model, price FROM Printer) Item, Product
WHERE Item.model = Product.model AND maker = 'A';

/* Expected Results
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

(SELECT maker
FROM Product
WHERE type='laptop')
MINUS
(SELECT maker
FROM Product
WHERE type='pc');

-- another query (though you may end up with duplicates unless we use DISTINCT) is to use NOT IN

SELECT DISTINCT maker
FROM Product
WHERE type='laptop'
      AND maker NOT IN (  SELECT maker
                          FROM Product
                          WHERE type = 'pc');

/* Expected Results
MAKER              
--------------------
F                    
G  
*/

-- 8. Find the model numbers of printers with the highest price

SELECT model
FROM Printer
WHERE price >= ALL (  SELECT price FROM Printer);

/* Expected Results
     MODEL
----------
      3003
      3007 
*/

-- 9. Find the model numbers of PCs whose speed is slower than that of all Laptops.

SELECT model
FROM PC
WHERE speed < ALL ( SELECT speed FROM Laptop);

/* Expected Results
     MODEL
----------
      1003 
*/

-- 10. Find the model number of the item (PC, Laptop, or Printer) with the highest price.

SELECT model
FROM ((SELECT model, price FROM PC) UNION (SELECT model, price FROM Laptop) UNION (SELECT model, price FROM Printer)) Item
WHERE price >= ALL ((SELECT price FROM PC) UNION (SELECT price FROM Laptop) UNION (SELECT price FROM Printer));

/* Expected Results
     MODEL
----------
      2001 
*/

-- 11. Find the maker of the color printer with the lowest price.

SELECT maker
FROM (  SELECT model
        FROM Printer
        where color='true' and 
              price <= ALL (  SELECT price FROM Printer WHERE color = 'true') ) CheapColPrinter, Product
where cheapcolprinter.model = product.model;

/* Expected Results
MAKER              
--------------------
E                    

*/

Note: The condition color = 'true' must appear in 2 places in the above query, if we remove it from any one place, it gives wrong results. 
For instance, if we remove it from the innermost query and write the query as the following, we may get no results as we are finding color printers that are cheaper than all printers (there may not be such printers).

SELECT maker
FROM (  SELECT model
        FROM Printer
        where color='true' and 
              price <= ALL (  SELECT price FROM Printer) ) CheapColPrinter, Product
where cheapcolprinter.model = product.model;

If we remove the other place where it appears, then we might get too many results, as we are now finding printers (color or otherwise) that have a price <= price of the cheapest color printer. This again is incorrect.


-- 12. Find the maker(s) of the PC(s) with the fastest processor among all the PCs that have the smallest amount of RAM.

SELECT maker
FROM (  SELECT model
        FROM (  SELECT model, speed
                FROM PC
                WHERE ram <= ALL (  SELECT ram FROM PC) ) smallestRAM
        where speed >= all (  select speed
                              from pc
                              WHERE ram <= ALL (SELECT ram FROM PC)) ) T1, Product
WHERE T1.model = Product.model;

/* Expected Results
MAKER              
--------------------
B 
*/

Note: Similar to #12 above, we need to specify the condition: ram <= ALL (SELECT ram FROM PC) -- in multiple places.

-- 13. Find those hard-disk sizes that occur in 2 or more PCs.

SELECT DISTINCT PC1.hd
FROM PC PC1, PC PC2
WHERE PC1.hd = PC2.hd AND PC1.model <> PC2.model;

/* Expected Results
        HD
----------
       250 
        80 
       160 
*/

Note: we can also use group by.

-- 14. Find the manufacturers of at least 2 different computers (PCs or Laptops) with speeds of at least 3.0

select distinct p1.maker
FROM  ((SELECT model FROM PC WHERE speed >= 3.0) UNION (SELECT model FROM Laptop WHERE speed >= 3.0)) Computer1, Product P1,
      ((SELECT model FROM PC WHERE speed >= 3.0) UNION (SELECT model FROM Laptop WHERE speed >= 3.0)) Computer2, Product P2
WHERE P1.model = Computer1.model AND P2.model = Computer2.model AND P1.maker = P2.maker AND P1.model <> P2.model;

      
/* Expected Results
MAKER              
--------------------
B                    

*/

Note: we can also use group by.