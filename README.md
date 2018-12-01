# DBMS-MySQL-Lab-Programs
Data Base Management System general Problems and its queries.

## Problem 1

Consider the following relations: 
``` 
STUDENT(snum: integer, sname: string, major: string, level: string, age: integer) 
```
```
CLASS(name: string, meets at: string, room: string, d: integer)
```
```
ENROLLED (snum: integer, cname: string)
```
``` 
FACULTY(fid: integer, fname: string, deptid: integer)
```
#### Description 
  The meaning of these relations is straightforward; for example, Enrolled has one record per student-class pair such that the student is enrolled in the class. Level is a two character code with 4 different values (example: Junior: JR etc)  Design an ER model and Schema diagram for the relations Write the following queries in SQL. No duplicates should be printed in any of the answers. `Create the tables for the schemas provided with primary keys and foreign keys. Insert 5 tuples of values to each table. `
#### Queries
1. Find the names of all Juniors (level = JR) who are enrolled in a class taught by Prof. Harshith 
2. Find the names of all classes that either meet in room R128 or have five or more Students enrolled. 
3. Find the names of faculty members for whom the combined enrollment of the courses that they teach is less than five. 


## Problem 2
The following relations keep track of airline flight information: FLIGHTS(no: integer, from1: string, to1: string, distance: integer, departs: time,  arrives: time, price: real) AIRCRAFT (aid: integer, aname: string, cruisingrange: integer) CERTIFIED(eid: integer, aid: integer) EMPLOYEE (eid: integer, ename: string, salary: integer) Note that the Employees relation describes pilots and other kinds of employees as well; Every pilot is certified for some aircraft, and only pilots are certified to fly.  Design an ER model and Schema diagram for the relations Write each of the following queries in SQL.  a) Create the tables for the schemas provided with primary keys and foreign keys b) Insert 5 tuples of values to each table. c) Find the names of aircraft such that all pilots certified to operate them have salaries more than Rs.80, 000. d) For each pilot who is certified for more than three aircrafts, find the eidand the maximum cruisingrangeof the aircraft for which she or he is certified. e) Find the names of pilots whose salary is less than the price of the cheapest route from Bengaluru to Frankfurt.
