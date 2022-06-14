-- Aggregate functions..

select * from sells;

SELECT MIN(price), COUNT(price), COUNT(*), COUNT(DISTINCT price)
FROM Sells;

SELECT price
FROM Sells 
WHERE price <= ALL (select price from Sells);

SELECT *
FROM Sells
WHERE price <= ALL (select price from Sells);

SELECT *
FROM Sells
WHERE price = (select min(price) from Sells);

-- MIN, MAX, COUNT, SUM, AVG
-- COUNT(DISTINCT ...)
-- COUNT (*)

-- GROUP BY...

SELECT ..
FROM ..
[WHERE ...]
[GROUP BY ...]

-- how many bars sell each beer

Corona      1
Heineken    1
...
Coors       2

select * from sells;

SELECT beer, COUNT(bar)
FROM Sells
GROUP BY beer;

SELECT beer, bar, COUNT(bar) -- error -- not a group by expression
FROM Sells
GROUP BY beer;

what is the rule?
restriction on what should be in the SELECT clause when you have a GROUP BY clause..

-- in the select clause, you can have group by columns. Any other column MUST be aggregated..

SELECT COUNT(bar) AS numBars -- no error
FROM Sells
GROUP BY beer;

SELECT beer, bar, COUNT(bar) -- no error
FROM Sells
GROUP BY beer, bar;

select * from sells;

select round(price), count(*) as numRows
from sells
group by round(price);

select * from Bars;

select barName, license
from Bars
group by barName;

select * from printer;

-- for each beer,  find the manf of the beer and how many bars sell that beer

select * 
from sells, beers
where sells.beer = beers.beerName

select beer, manf, COUNT(bar) -- error
from sells, beers
where sells.beer = beers.beerName
group by beer;

SELECT *
FROM (  select beer, COUNT(bar)
        FROM Sells
        GROUP BY beer) T, Beers
WHERE T.beer = beers.beerName;

select beer, MIN(manf), COUNT(bar)
from sells, beers
where sells.beer = beers.beerName
group by beer;

select beer, manf, COUNT(bar)
from sells, beers
where sells.beer = beers.beerName
group by beer, manf;

---------------------

select * from sells;

find beers that are sold in 2 or more bars..

SELECT *
FROM (  SELECT beer, COUNT(bar) AS numBars
        FROM Sells
        GROUP BY beer) T
WHERE numBars >= 2;

-- HAVING clause -- to filter out groups..

SELECT ..
FROM ..
[WHERE ..]
[GROUP BY ..
 [HAVING ...]];

SELECT beer, COUNT(bar) AS numBars
FROM Sells
GROUP BY beer
HAVING COUNT(bar) >= 2;

----------------

ORDER BY..

SELECT ..
FROM ..
[WHERE ..]
[GROUP BY ..
 [HAVING ...]]
[ORDER BY ...];

SELECT ..
FROM ..
[WHERE ..]
[ORDER BY ...];

ORDER BY col1, col2 DESC, ...;
SELECT DISTINCT col1, co2, ..

-----------------------

INSERT, DELETE, UPDATE

OUTER JOIN
comparison with NULL values

