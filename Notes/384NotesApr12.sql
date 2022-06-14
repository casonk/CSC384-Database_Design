-- I want to find all the makers in my DB

SELECT DISTINCT maker
FROM Product
ORDER BY maker;

-- Let us find the makers of printers

SELECT *
FROM Product
WHERE type = 'printer';

-- for each maker, how many printers they make

A  0
B  0
...
D  2
E  3
..

-- for each maker who makes printers, how many printers they make

SELECT maker, COUNT(*) AS num
FROM Product
WHERE type='printer'
GROUP BY maker
ORDER BY maker;

-------------------

2 main concepts..

1. outer join

SELECT *
FROM 
    (SELECT DISTINCT maker
    FROM Product) AllMakers NATURAL LEFT OUTER JOIN
    (SELECT *
    FROM Product
    WHERE type = 'printer') PrinterModels

AllMakers           PrinterModels
maker               maker   model   type
A                   D       3004    printer
B                   D       3005    printer
C                   E       3001    printer
D                   E       3002    printer
E                   E       3003    printer
F                   H       3006    printer
G                   H       3007    printer
H

2. group by -- with appropriate aggregations..

SELECT maker, COUNT(model) AS num
FROM 
    (SELECT DISTINCT maker
    FROM Product) AllMakers NATURAL FULL OUTER JOIN
    (SELECT *
    FROM Product
    WHERE type = 'printer') PrinterModels
GROUP BY maker
ORDER BY maker

-----------------

How do we write outer joins..

...
FROM Table1 NATURAL FULL/LEFT/RIGHT OUTER JOIN Table2
...

...
FROM Table1 FULL/LEFT/RIGHT OUTER JOIN Table2 ON ...
...

----------------------

Project --
extract year from a date field..
outer join..

-----------------------

-- CHECK CONSTRAINTS

DROP TABLE Test1;

CREATE TABLE Test1 (col1 INT NOT NULL, col2 INT);

CREATE TABLE Test1 (col1 INT, col2 INT, CHECK (col1 IS NOT NULL));

CREATE TABLE Test1 (col1 INT CHECK (col1 IS NOT NULL), col2 INT);

ALTER TABLE syntax..

CREATE TABLE Test1 (col1 INT, col2 INT);

INSERT INTO Test1(col2) VALUES (10); -- insert a row (NULL, 10)

ALTER TABLE Test1 ADD PRIMARY KEY (col1); -- this statement fails

ALTER TABLE Test1 ADD CHECK (col1 IS NOT NULL); -- this statement fails

ALTER TABLE Test1 ADD col3 INT; -- row changes to (NULL, 10, NULL)

ALTER TABLE Test1 DROP COLUMN col3;

ALTER TABLE Test1 DROP CONSTRAINT ...;

CHECK constraints..

CHECK (....); -- Oracle does NOT allow nested select statements.. 

---------------------------------

row-level constraints -- CHECK constraints
table-level constraints -- PRIMARY KEY, UNIQUE
multiple-table constraints -- FOREIGN KEY

... Assertion.. (not supported in Oracle)
... triggers (can be used to specify complex constraints).. in Oracle, triggers are specified using PL/SQL..

--------------------------------

CREATE TABLE Emp (empID INT PRIMARY KEY, empName VARCHAR(20), mgr INT REFERENCES Emp);

--------------------------------

Views (or) External Schema




