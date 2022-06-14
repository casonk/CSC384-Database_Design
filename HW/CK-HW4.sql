CREATE TABLE PRODUCT (
    pmodel VARCHAR2(6) PRIMARY KEY,
    maker VARCHAR2(2),
    ptype VARCHAR2(8)
);

CREATE TABLE PC (
    pcmodel VARCHAR2(6),
    speed NUMBER(*,2),
    ram VARCHAR2(6), 
    hd INT,
    price VARCHAR2(5),
    FOREIGN KEY (pcmodel) REFERENCES PRODUCT ON DELETE CASCADE
);

CREATE TABLE Laptop (
    pcmodel VARCHAR2(6),
    speed NUMBER(*,2),
    ram VARCHAR2(6), 
    hd INT,
    Lscreen NUMBER(*,1),
    price VARCHAR2(5),
    FOREIGN KEY (pcmodel) REFERENCES PRODUCT ON DELETE CASCADE
);


SELECT DISTINCT pcmodel, hd, price, maker FROM
(SELECT * FROM
((SELECT pcmodel, hd, price  FROM (
SELECT *  FROM PC WHERE hd >= 200))
UNION
(SELECT pcmodel, hd, price FROM (
SELECT * FROM Laptop WHERE hd >= 200))) 
NATURAL JOIN 
PRODUCT);

SELECT DISTINCT maker, hd AS minhd FROM
(SELECT * FROM
((SELECT pcmodel, hd  FROM (
SELECT *  FROM PC WHERE hd <= 200))
UNION
(SELECT pcmodel, hd FROM (
SELECT * FROM Laptop WHERE hd <= 200)))
NATURAL JOIN
PRODUCT)
WHERE hd <= ALL 
(SELECT hd FROM
((SELECT pcmodel, hd  FROM (
SELECT *  FROM PC WHERE hd <= 200))
UNION
(SELECT pcmodel, hd FROM (
SELECT * FROM Laptop WHERE hd <= 200)))
NATURAL JOIN
PRODUCT);
