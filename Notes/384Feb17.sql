-- CHAR(n) .vs. VARCHAR(n)

create table test (col1 VARCHAR(10), col2 CHAR(10));

insert into test values ('abc', 'abc');

select * from test;

select length(col1), length(col2) from test;

--------------------------

/*
CREATE TABLE <tableName> (
    list of schema declarations
);

schema declaration = column declaration | primary key declaration | unique declaration | foreign key declaration
column declaration = <nameOfCol> <typeOfCol> [NOT NULL]
[CONSTRAINT <constraintName>] PRIMARY KEY (<listOfColumns>)
[CONSTRAINT <constraintName>] UNIQUE (<listOfColumns>)
[CONSTRAINT <constraintName>] FOREIGN KEY (<listOfColumns1>) REFERENCES <tableName2> (<listOfColumns2>)

syntax restrictions
-------------------
a table can have max of 1 primary key declaration
<listOfColumns2> MUST be declared as primary key or unique for <tableName2>

additional constraints enforced
-------------------------------
PRIMARY KEY columns cannot take NULL values
*/
------------------------------

DROP TABLE Sells;
DROP TABLE Beers;
DROP TABLE Bars;

CREATE TABLE Bars (
    barName VARCHAR(10),
    barAddr VARCHAR(50),
    CONSTRAINT pkBars PRIMARY KEY (barName)
);

CREATE TABLE Beers (
    beerName VARCHAR(10),
    manf VARCHAR(10),
    CONSTRAINT pkBeers PRIMARY KEY (beerName)
);

CREATE TABLE Sells (
    bar VARCHAR(10),
    beer VARCHAR(10),
    price NUMBER(4,2),
    PRIMARY KEY (bar, beer),
    CONSTRAINT fkSellsBars FOREIGN KEY (bar) REFERENCES Bars(barName),
    CONSTRAINT fkSellsBeers FOREIGN KEY (beer) REFERENCES Beers(beerName)
);

---------------------------

ALTER TABLE Sells DROP CONSTRAINT SYS_C0068538;

----------------------
additional "convenience" features
(a) if your constraint refers to a single column, then the constraint can be combined along with the column declaration
(b) consider: FOREIGN KEY (<listOfColumns1>) REFERENCES <tableName2> (<listOfColumns2>)
if <listOfColumns2> is primary key for tableName2, then the following is equivalent to the above foreign key declaration
FOREIGN KEY (<listOfColumns1>) REFERENCES <tableName2>

CREATE TABLE Bars (
    barName VARCHAR(10) CONSTRAINT pkBars PRIMARY KEY,
    barAddr VARCHAR(50),
);

CREATE TABLE Sells (
    bar VARCHAR(10) REFERENCES Bars(barName),
    beer VARCHAR(10),
    price NUMBER(4,2),
    PRIMARY KEY (bar, beer),
    CONSTRAINT fkSellsBeers FOREIGN KEY (beer) REFERENCES Beers(beerName)
);

------------------------------