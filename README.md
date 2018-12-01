# DBMS-MySQL-Lab-Programs
Data Base Management System general Problems and its queries. DSCE 2018-2019

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
The following relations keep track of airline flight information: 
```
FLIGHTS(no: integer, from1: string, to1: string, distance: integer, departs: time,  arrives: time, price: real) 
```
```
AIRCRAFT (aid: integer, aname: string, cruisingrange: integer)
```
```
CERTIFIED(eid: integer, aid: integer) 
```
```
EMPLOYEE (eid: integer, ename: string, salary: integer) 
```
#### Description 
Note that the Employees relation describes pilots and other kinds of employees as well; Every pilot is certified for some aircraft, and only pilots are certified to fly.  Design an ER model and Schema diagram for the relations. ` Create the tables for the schemas provided with primary keys and foreign keys `` Insert 5 tuples of values to each table.` 
#### Queries
1. Find the names of aircraft such that all pilots certified to operate them have salaries more than Rs.80, 000.
2. For each pilot who is certified for more than three aircrafts, find the eidand the maximum cruisingrangeof the aircraft for which she or he is certified. 
3. Find the names of pilots whose salary is less than the price of the cheapest route from Bengaluru to Frankfurt.

## Problem 3
The following tables are maintained by a book dealer:  
```
AUTHOR(author-id: int, name: String, city: String, country: String)  
```
```
PUBLISHER(publisher-id: int, name: String, city: String, country: String)  
```
```
CATALOG(book-id: int, title: String, author-id: int, publisher-id: int, category-  id: int, year: int, price: int)  
```
```
CATEGORY(category-id: int, description: String)  
```
```
ORDER-DETAILS(order-no: int, book-id: int, quantity: int) 
```
#### Description 
Design an ER model and Schema diagram for the relations `Create the tables for the schemas provided with primary keys and foreign keys `` Insert 5 tuples of values to each table.` 
#### Queries
1. Give the details of the authors who have 2 or more books in the catalog and the price of the books in the catalog and the year of publication is after 2000. 
2. Find the author of the book which has maximum sales. 
3. Demonstrate how you increase the price of books published by a specific publisher by 10%. 

## Problem 4
Consider the following database for a banking enterprise.  
```
BRANCH (branch-name: String, branch-city: String, assets: real)  
```
```
ACCOUNTS (accno: int, branch-name: String, balance: real)  
```
```
DEPOSITOR (customer-name: String, accno: int) 
```
```
CUSTOMER(customer-name:string,customer-street:string,customer-city:string) 
```
```
LOAN (loan-number: int, branch-name: String, amount: real) 
```
```
BORROWER (customer-name: String, loan-number: int) 
```
#### Description 
Design an ER model and Schema diagram for the relations Design an ER model and Schema diagram for the relations ` Create the tables for the schemas provided with primary keys and foreign keys `` Insert 5 tuples of values to each table.`
#### Queries
1. Find all the customers who have at least two accounts at the Main branch. 
2. Find all the customers who have an account at all the branches located in a specific city. 
3. Demonstrate how you delete all account tuples at every branch located in a specific city.

## Problem 5
Consider the following relations for an Order Processing database application in a company. 
```
CUSTOMER (CUST #: int, cname: String, city: String) 
``` 
```
ORDER (order #: int, odate: date, cust #: int, ord-Amt: int) 
```
```
ITEM (item #: int, unit-price: int) 
```
```
ORDER-ITEM (order #: int, item #: int, qty: int) 
```
```
WAREHOUSE (warehouse #: int, city: String) 
```
```
SHIPMENT (order #: int, warehouse #: int, ship-date: date) 
```
#### Description 
Design an ER model and Schema diagram for the relations ` Create the tables for the schemas provided with primary keys and foreign keys `` Insert 5 tuples of values to each table.` 
#### Queries
1. Produce a listing: CUSTNAME, #oforders, AVG_ORDER_AMT, where the middle column is the total numbers of orders by the customer and the last column is the average order amount for that customer. 
2. List the order# for orders that were shipped from all warehouses that the company has in a specific city. 
3. Demonstrate how you delete item# 10 from the ITEM table and make that field null in the ORDER_ITEM table.
