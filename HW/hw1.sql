-- Cason Konzer Database Design HW 1 2/3/2021

-- #1 Write SQL DDL (Data Definition Language) statements to create a table, --
-- called studentInfo with attributes studentNum of type integer, and marks of type integer.
-- DROP TABLE INTRO2;

CREATE TABLE studentInfo (
    studentNum int,
    marks int
);
-- Now import the data given into your table.


-- set timing on;

/* 
    #2 SELECT COUNT (*) FROM studentInfo; 

    #3 SELECT COUNT(*) FROM studentInfo s1, studentInfo s2 
    WHERE s1.studentNum=s2.studentNum;

    #4 SELECT COUNT(*) FROM studentInfo s1 
    WHERE s1.studentNum IN (SELECT studentNum FROM studentInfo);

    #5 UPDATE studentinfo SET marks = marks - 1
    WHERE studentNum IN (SELECT studentNum FROM studentInfo);   
*/
