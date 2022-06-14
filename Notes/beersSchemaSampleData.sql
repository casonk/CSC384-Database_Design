DROP TABLE Frequents;
DROP TABLE Sells;
DROP TABLE Likes;
DROP TABLE Drinkers;
DROP TABLE Bars;
DROP TABLE Beers;

CREATE TABLE Beers (
  beerName VARCHAR(20) PRIMARY KEY, 
  manf VARCHAR(20)
);

CREATE TABLE Bars (
  barName VARCHAR(20) PRIMARY KEY,
  addr VARCHAR(50),
  license VARCHAR(10)
);

CREATE TABLE Drinkers (
  drinkerName VARCHAR(20) PRIMARY KEY,
  addr VARCHAR(50),
  phone VARCHAR(15)
);

CREATE TABLE Likes (
  drinker VARCHAR(20) REFERENCES Drinkers(drinkerName),
  beer VARCHAR(20) REFERENCES Beers(beerName),
  PRIMARY KEY (drinker, beer)
);

CREATE TABLE Sells (
  bar VARCHAR(20) REFERENCES Bars(barName),
  beer VARCHAR(20) REFERENCES Beers(beerName),
  price NUMBER(4, 2),
  PRIMARY KEY (bar, beer)
);

CREATE TABLE Frequents (
  drinker VARCHAR(20) REFERENCES Drinkers(drinkerName),
  bar VARCHAR(20) REFERENCES Bars(barName),
  PRIMARY KEY (drinker, bar)
);

INSERT INTO Beers VALUES ('Bud', 'Anheuser-Busch');
INSERT INTO Beers VALUES ('Bud Light', 'Anheuser-Busch');
INSERT INTO Beers VALUES ('Heineken', 'Heineken');
INSERT INTO Beers VALUES ('Beck''s', 'Inbev');
INSERT INTO Beers VALUES ('Corona', 'Cerveceria Modelo');
INSERT INTO Beers VALUES ('Coors', 'Molson Coors');
INSERT INTO Beers VALUES ('Asahi', 'Asahi Super Dry');

INSERT INTO Bars VALUES ('Torch Bar', '522 Buckham Alley, Flint', 'full');
INSERT INTO Bars VALUES ('501 Bar', '500 S. Saginaw St. Flint', 'full');

INSERT INTO Drinkers VALUES ('Adam', '123 Kearsley St. Flint', '1112222');
INSERT INTO Drinkers VALUES ('Mary', '125 Kearsley St. Flint', '2223333');
INSERT INTO Drinkers VALUES ('Joe', '127 Kearsley St. Flint', '3334444');

INSERT INTO Likes VALUES ('Adam', 'Bud');
INSERT INTO Likes VALUES ('Adam', 'Heineken');
INSERT INTO Likes VALUES ('Mary', 'Coors');
INSERT INTO Likes VALUES ('Mary', 'Beck''s');
INSERT INTO Likes VALUES ('Joe', 'Bud');

INSERT INTO Sells VALUES ('Torch Bar', 'Corona', 3.50);
INSERT INTO Sells VALUES ('Torch Bar', 'Heineken', 3.25);
INSERT INTO Sells VALUES ('Torch Bar', 'Bud', 3.00);
INSERT INTO Sells VALUES ('Torch Bar', 'Bud Light', 3.00);
INSERT INTO Sells VALUES ('Torch Bar', 'Coors', 3.25);
INSERT INTO Sells VALUES ('501 Bar', 'Coors', 2.75);

INSERT INTO Frequents VALUES ('Adam', 'Torch Bar');
INSERT INTO Frequents VALUES ('Adam', '501 Bar');
INSERT INTO Frequents VALUES ('Mary', 'Torch Bar');
INSERT INTO Frequents VALUES ('Joe', '501 Bar');

commit;