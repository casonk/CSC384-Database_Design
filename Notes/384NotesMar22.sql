
-- find names of drinkers who like Bud

-- which table/(s) do I need? -- Likes
-- how do I filter and keep only the rows that I need
-- which columns do I need?

SELECT drinker
FROM Likes
WHERE beer = 'Bud';

SELECT *
FROM Likes
WHERE beer = 'Bud'

-- * in SELECT clause
-- SELECT clause -- extended projection
-- || concatenation of strings
-- upper, lower -- convert strings to upper case/lower case

SELECT drinker || ' likes Bud' AS msg
FROM Likes
WHERE beer = 'Bud'

SELECT drinker || ' likes ' || beer AS msg
FROM Likes

-- list every price in Indian rupees.. 1 USD = 65 INR

SELECT bar, beer, price * 65 AS priceInINR
FROM Sells;

-- list every price for Coors in INR

SELECT bar, beer, price * 65 AS priceINR
FROM Sells
WHERE beer = 'Coors'

-- Find the beers that are sold in at least 1 bar..

SELECT DISTINCT beer
FROM Sells

SELECT DISTINCT beer, bar
FROM Sells;

SELECT beer, bar
FROM Sells;

-------------------

=, >, <, >=, <=, != (or) <>

Find bars in Flint -- addr ends in Flint, then the bar is in Flint
-- regular expression operators..
-- % -- match 0 or more characters.. 
-- _ -- matches 1 character
-- LIKE operator

SELECT *
FROM Bars
WHERE addr LIKE '%Flint';

-- drinkers who have the letter a in their name..

SELECT *
FROM Drinkers
WHERE lower(drinkerName) LIKE '%a%';

---------------------------------

-- give aliases to table names -- useful especially when we have multiple tables in the FROM clause

SELECT *
FROM Drinkers D
WHERE lower(D.drinkerName) LIKE '%a%';

--------------------------------

multiple tables in the FROM clause

SELECT *
FROM Sells, Beers
WHERE beer = beerName -- add join condition.. 

Find all the bars that sell beers made by Anheuser-Busch

SELECT *
FROM Sells, Beers
WHERE beer = beerName AND manf='Anheuser-Busch'

-------------------

Find names of drinkers who frequent bars in Flint

-- Beers, Bars, Drinkers, Sells, Likes, Frequents

-- Frequents, Bars

SELECT *
FROM Frequents, Bars
WHERE Frequents.bar = Bars.barName AND lower(addr) LIKE '%flint'

------------------------

UNION, INTERSECT, ...
EXCEPT (in SQL standard)
MINUS (in Oracle) -- remove duplicates

T1 UNION T2

(select statement) UNION (select statement)

FROM TABLE1 UNION TABLE2 -- incorrect SQL syntax.

(select * from bars) 
union 
(select * from bars);

((select * from bars) 
union all
(select * from bars))
union
(select * from bars);

-- union.. do a union all and then do a DISTINCT operator..

(select statement) intersect (select statement)

((select * from bars) 
union all
(select * from bars))
intersect
((select * from bars) 
union all
(select * from bars));

((select * from bars) 
union all
(select * from bars))
minus
(select * from bars);

---------------

UNION, INTERSECT, MINUS, UNION ALL -- in Oracle
-- in SQL standard.. INTERSECT ALL, EXCEPT ALL






