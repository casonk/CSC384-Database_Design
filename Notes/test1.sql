/* 
    multi-line comment 
*/

-- single line comment

-- create table with integer columns

-- case insensitive -- keywords, names of tables, names of columns
-- string value is case sensitive -- we will not look at strings right now

/* Syntax for create table
CREATE TABLE nameOfTbl (
    list of columns
);

list of columns = col1, col2, ...
col = nameOfCol type

as of now, we will only consider type = int (or) integer

I am not using spaces for nameOfTbl, nameOfCol -- use of spaces is not recommended

name_of_tbl

conventions for table names and column names
tbl_table1
col_column1

*/

-- create a table called test with 2 integer columns -- col1, col2

CREATE TABLE test (
    col1 int,
    col2 int
);

DROP TABLE test;

CREATE TABLE test (
    col1 int,
    col2 int
);

-- how much time it takes by the DB server to perform any operation

set timing on;

-----------------

-- add data to a table

-- INSERT statements
-- data in a .csv file, import data into a table

-- delete all rows from a table

DELETE FROM test;

-- SELECT statements -- used to retrieve data from table

-- make changes to data in tables
-- INSERT, DELETE, UPDATE

-- 2 kinds of SQL statements
-- DDL (Data Definition Language) -- which creates, or modifies, or drops DB objects. CREATE, DROP, ...
-- DML (Data Manipulation Language) -- manipulate data in DB objects.. SELECT, INSERT, DELETE, UPDATE, ...





    

