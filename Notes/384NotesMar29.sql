
SELECT ..
FROM Table1 T1, Table2 T2, (select ...) T3
WHERE ...

subqueries in the where clause..

WHERE ... = (select ...)
WHERE ... >= ALL (select ...)
WHERE ... <= ALL (select ...)
WHERE ... = ANY (select ...)

WHERE ... IN (select ...)
WHERE ... NOT IN (select ...)

WHERE EXISTS (select ...)
WHERE NOT EXISTS (select ...)

correlated subquery
-------------------

-------------------------

JOIN Expressions..
-----------------

Example: Find the name and addr of bars that sell beers made by Anheuser-Busch

Bars -- addr of the bars
Beers -- manf of beers
Sells -- which bar sells which beers

SELECT bar, addr
FROM Sells, Bars, Beers
WHERE bar = barName AND beer = beerName AND manf='Anheuser-Busch';

Example: Find the name of bars that sell beers made by Anheuser-Busch

Sells -- which bar sells which beers
Beers -- manf of beers

SELECT *
FROM Sells, Beers
WHERE beer = beerName AND manf='Anheuser-Busch';

-- THETA JOIN .. T1 JOIN T2 ON ...
-- NATURAL JOIN .. T1 NATURAL JOIN T2
-- CROSS JOIN.. T1, T2 (or) T1 CROSS JOIN T2

SELECT *
FROM Sells JOIN Beers ON beer = beerName
WHERE manf='Anheuser-Busch';

-- the following is bad practice

SELECT *
FROM Sells JOIN Beers ON beer = beerName AND manf='Anheuser-Busch';

SELECT *
FROM Sells, (select beerName as beer, manf from Beers) T2
WHERE Sells.beer = T2.beer;

SELECT *
FROM Sells NATURAL JOIN (select beerName as beer, manf from Beers);

SELECT *
FROM Sells CROSS JOIN Beers;

--------------------------

select * 
from printer NATURAL JOIN product;

select * from product where type = 'printer' order by model;

-----------------

HW5 Discussion

Q10:

SELECT *
FROM (select model, price from pc union select model, price from laptop union select model, price from printer) T
WHERE price >= ALL (select price from pc union select price from laptop union select price from Printer);

WITH T AS
(select model, price from pc union select model, price from laptop union select model, price from printer)
SELECT *
FROM T
WHERE price >= ALL (select price FROM T);
