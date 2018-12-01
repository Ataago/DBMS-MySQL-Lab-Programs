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
