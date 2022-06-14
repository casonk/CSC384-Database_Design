DROP TABLE Reserves;
DROP TABLE Sailors;
DROP TABLE Boats;

CREATE TABLE Boats (bid INT PRIMARY KEY, color VARCHAR2(10));
CREATE TABLE Sailors (sid INT PRIMARY KEY, sname VARCHAR(20), 
    rating INT, age NUMBER(3, 1));
CREATE TABLE Reserves (sid INT, bid INT, day DATE, 
    CONSTRAINT reservesPK PRIMARY KEY (sid, bid, day));

INSERT INTO Boats VALUES (101, 'red');
INSERT INTO Boats VALUES (102, 'red');
INSERT INTO Boats VALUES (103, 'green');
INSERT INTO Boats VALUES (104, 'blue');

INSERT INTO Sailors VALUES (22, 'dustin', 7, 45.0);
INSERT INTO Sailors VALUES (31, 'lubber', 8, 55.5);
INSERT INTO Sailors VALUES (58, 'rusty', 10, 35.0);
INSERT INTO Sailors VALUES (75, 'rusty', 9, 40.0);

INSERT INTO Reserves VALUES (22, 101, TO_DATE('10/10/96', 'MM/DD/YY'));
INSERT INTO Reserves VALUES (22, 103, TO_DATE('1/5/96', 'MM/DD/YY'));
INSERT INTO Reserves VALUES (58, 103, TO_DATE('11/12/96', 'MM/DD/YY'));
INSERT INTO Reserves VALUES (75, 102, TO_DATE('12/12/96', 'MM/DD/YY'));

commit;

/* 
1. Find sids of sailors who reserved boat with bid = 103
*/

/*
2. Find names of sailors who reserved boat with bid = 103
*/

/* 
3. Find ids and names of sailors who have reserved at least 1 boat. 
Qn: How do you remove duplicates?
*/

/*
4. Find names of sailors who reserved a red boat
*/

/* 
5. Find sids of sailors who reserved a red or a green boat
*/

/*
6. Find names of sailors who reserved a red or a green boat
*/

/*
7. Find sids of sailors who reserved a red and a green boat
*/

/*
8. Find names of sailors who reserved a red and a green boat
*/

