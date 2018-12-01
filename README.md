# DBMS-MySQL-Lab-Programs
Data Base Management System general Problems and its queries.

## Problem 1

Consider the following relations: 
- STUDENT(snum: integer, sname: string, major: string, level: string, age: integer) 
- CLASS(name: string, meets at: string, room: string, d: integer) 
- ENROLLED (snum: integer, cname: string) 
- FACULTY(fid: integer, fname: string, deptid: integer) 
The meaning of these relations is straightforward; for example, Enrolled has one record per student-class pair such that the student is enrolled in the class. Level is a two character code with 4 different values (example: Junior: JR etc)  Design an ER model and Schema diagram for the relations Write the following queries in SQL. No duplicates should be printed in any of the answers. 
a) Create the tables for the schemas provided with primary keys and foreign keys 
b) Insert 5 tuples of values to each table. 
c) Find the names of all Juniors (level = JR) who are enrolled in a class taught by Prof. Harshith 
d) Find the names of all classes that either meet in room R128 or have five or more Students enrolled. 
e) Find the names of faculty members for whom the combined enrollment of the courses that they teach is less than five. 
