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
