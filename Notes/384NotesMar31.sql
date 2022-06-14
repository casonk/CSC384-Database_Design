Relational Algebra HW Problem 1.

Step 1:

SELECT *
FROM PC
WHERE hd >= 200;

Step 2:

SELECT *
FROM Laptop
WHERE hd >= 200;

Step 3:
WITH Step1 AS
(SELECT *
FROM PC
WHERE hd >= 200)
SELECT model, hd, price
FROM Step1;
(SELECT *
FROM PC
WHERE hd >= 200)
SELECT model, hd, price
FROM Step1;

SELECT model, hd, price
FROM PC
WHERE hd >= 200;

Step 4:

SELECT model, hd, price
FROM Laptop
WHERE hd >= 200;

Step 5:
WITH Step3 AS
(SELECT model, hd, price
FROM PC
WHERE hd >= 200),
Step4 AS
(SELECT model, hd, price
FROM Laptop
WHERE hd >= 200)
(select * from Step3) union all (select * from step4);

(SELECT model, hd, price FROM PC WHERE hd >= 200) 
UNION ALL
(SELECT model, hd, price FROM Laptop WHERE hd >= 200);

Step 6:
WITH Step5 AS
((SELECT model, hd, price FROM PC WHERE hd >= 200) 
UNION ALL
(SELECT model, hd, price FROM Laptop WHERE hd >= 200))
SELECT *
FROM Step5 NATURAL JOIN Product;

SELECT *
FROM (( SELECT model, hd, price FROM PC WHERE hd >= 200) 
        UNION ALL
        (SELECT model, hd, price FROM Laptop WHERE hd >= 200)) NATURAL JOIN Product;

Step 7:
SELECT model, hd, price, maker
FROM (( SELECT model, hd, price FROM PC WHERE hd >= 200) 
        UNION ALL
        (SELECT model, hd, price FROM Laptop WHERE hd >= 200)) NATURAL JOIN Product;

---------------------------

Boats schema

/* 
1. Find sids of sailors who reserved boat with bid = 103
*/

SELECT *
FROM Reserves
WHERE bid = 103;

/*
2. Find sid, name of sailors who reserved boat with bid = 103
*/

SELECT Sailors.sid, sname
FROM Reserves, Sailors
WHERE Reserves.sid = Sailors.sid AND bid = 103;

SELECT *
FROM Sailors
WHERE sid = ANY (select sid from reserves where bid = 103);

SELECT *
FROM Sailors
WHERE sid IN (select sid from reserves where bid = 103);

SELECT *
FROM Sailors S
WHERE EXISTS (find all the rows in reserves for that Sailor and bid = 103)

SELECT *
FROM Reserves
WHERE Reserves.sid = S.sid AND bid = 103

correlated query

SELECT *
FROM Sailors S
WHERE EXISTS (SELECT * FROM Reserves R WHERE R.sid = S.sid AND R.bid = 103);

col Op (select statement)
col Op ALL/ANY (select statement)
col IN (select statement)
col NOT IN (select statement)
EXISTS (select statement)

/* 
3. Find ids and names of sailors who have reserved at least 1 boat. 
Qn: How do you remove duplicates?
*/

SELECT DISTINCT Sailors.sid, sname
FROM Reserves, Sailors
WHERE Reserves.sid = Sailors.sid;

SELECT Sailors.sid, sname
FROM Reserves, Sailors
WHERE Reserves.sid = Sailors.sid
GROUP BY Sailors.sid, sname;

SELECT *
FROM Sailors
WHERE sid IN (SELECT sid FROM Reserves);

/*
4. Find names of sailors who reserved a red boat
*/

SELECT *
FROM Reserves, Sailors, Boats
WHERE Reserves.sid = Sailors.sid AND Reserves.bid = Boats.bid AND color = 'red';

/* 
5. Find sids of sailors who reserved a red or a green boat
*/

SELECT *
FROM Reserves, Boats
WHERE Reserves.bid = Boats.bid AND (color = 'red' OR color = 'green');

(SELECT * FROM Reserves, Boats WHERE Reserves.bid = Boats.bid AND color = 'red')
UNION
(SELECT * FROM Reserves, Boats WHERE Reserves.bid = Boats.bid AND color = 'green');


/*
6. Find names of sailors who reserved a red or a green boat
*/

SELECT *
FROM Reserves, Sailors, Boats
WHERE Reserves.sid = Sailors.sid AND Reserves.bid = Boats.bid AND 
    (color = 'red' OR color = 'green');

/*
7. Find sids of sailors who reserved a red and a green boat
*/

-- this will not work..
SELECT *
FROM Reserves, Boats
WHERE Reserves.bid = Boats.bid AND (color = 'red' AND color = 'green');

(SELECT sid FROM Reserves, Boats WHERE Reserves.bid = Boats.bid AND color = 'red')
INTERSECT
(SELECT sid FROM Reserves, Boats WHERE Reserves.bid = Boats.bid AND color = 'green');

/*
8. Find names of sailors who reserved a red and a green boat
*/

(SELECT Sailors.sid, sname FROM Reserves, Sailors, Boats 
WHERE Reserves.sid = Sailors.sid AND Reserves.bid = Boats.bid AND color = 'red')
INTERSECT
(SELECT Sailors.sid, sname FROM Reserves, Sailors, Boats 
WHERE Reserves.sid = Sailors.sid AND Reserves.bid = Boats.bid AND color = 'green');

SELECT * 
FROM Sailors
WHERE sid IN (SELECT sid FROM Reserves, Boats WHERE Reserves.bid = Boats.bid AND color = 'red') AND
      sid IN (SELECT sid FROM Reserves, Boats WHERE Reserves.bid = Boats.bid AND color = 'green');

SELECT *
FROM Sailors S, 
  ((SELECT sid FROM Reserves, Boats WHERE Reserves.bid = Boats.bid AND color = 'red')
    INTERSECT
   (SELECT sid FROM Reserves, Boats WHERE Reserves.bid = Boats.bid AND color = 'green')) BothBoats
WHERE S.sid = BothBoats.sid;
