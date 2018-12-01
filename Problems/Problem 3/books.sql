create schema 3_Book;

create table author(
	a_id int, 
    name char(20), 
    city char(10), 
    country char(10),
    constraint pk_a_idAuthor
		primary key (a_id) );
        
insert into author values(101,'Foruzan','London','UK');
insert into author values(102,'sommerville','Bristol','UK');
insert into author values(103,'Emily','Paris','France');



create table publisher(
	p_id int,
    name char(20),
    city char(10),
    country char(10),
    constraint pk_p_idPublisher
		primary key(p_id));
insert into publisher values(201,'Pearson','Turin','Italy');
insert into publisher values(202,'MC Grawhill','New York','US');    
insert into publisher values(203,'Wiley','Washignton','US');


create table category(
	c_id int,
    disc varchar(20),
    constraint pk_c_idCategory
		primary key (c_id));

insert into category values(1,'Science');
insert into category values(2,'Fiction');

create table catalog(
	b_id int,
    title varchar(10),
    a_id int,
    p_id int,
    c_id int,
    b_year int,
    price int,
    constraint pk_b_idCatalog
		primary key (b_id),
	constraint fk_a_idCatalog
		foreign key(a_id) references author(a_id),
	constraint fk_p_idCatalog
		foreign key(p_id) references publisher(p_id),
	constraint fk_c_idCatalog
		foreign key(c_id) references category(c_id));

insert into catalog values(1001,'Networks',101,201,1,2001,1400);
insert into catalog values(1002,'Networking',101,202,1,2014,1200);
insert into catalog values(1003,'Software',102,201,1,2001,1200);
insert into catalog values(1004,'SoftEng',102,202,1,1987,1200);
insert into catalog values(1005,'Poems',103,203,2,2004,10);

create table orders(
	order_no int,
    b_id int,
    quantity int,
    constraint pk_order_noOrders
		primary key (order_no),
	constraint fk_b_idOrders
		foreign key(b_id) references catalog(b_id));

insert into orders values(10001,1001,2);
insert into orders values(10002,1002,4);
insert into orders values(10003,1003,1);
insert into orders values(10004,1004,2);
insert into orders values(10005,1004,1);
insert into orders values(10006,1005,5);

#Queries
#c) Give the details of the authors who have 2 or more books in the catalog and the price of the books is greater
#    than the average price of the books in the catalog and the year of publication is after 2000.    
select *
from author
where a_id in (
							select a_id from catalog
							where
								price > (select avg(price) from catalog) and
								b_year > 2000
							group by(a_id)
							having count(*) >= 2
						);

#d) Find the author of the book which has maximum sales.
select *
from author
where a_id in (
							select a_id
                            from orders, catalog
							where
								catalog.b_id = orders.b_id and
                                quantity = (select max(quantity) from orders)
							group by(a_id)
						);

#dheeraj
select a.a_id
from author a, orders o, catalog c
where 
	a.a_id = c.a_id and
    c.b_id = o.b_id and
    o.b_id = ( select o1.b_id
					from orders o1
					group by(o1.b_id)
                    having sum(quantity) = (
																select max(sum(quantity)) 
                                                                from orders o2
                                                                group by(o2.b_id)
														)
				);
                    
#meghana
select name 
from author
where a_id in (
						select a_id
                        from catalog 
                        where
							b_id in (
											select b_id
                                            from orders
                                            where quantity = (select max(quantity) from orders)
										)
						);


#working code ----------------------------------------------------------------------------------  
select * 
from author 
where 
	a_id = (
					select a_id 
					from (
								select a_id
								from orders,catalog
								where
									orders.b_id = catalog.b_id
								group by(a_id)
								order by sum(quantity) desc
							) 
                            as TopSellerTable limit 1
				); 

#------------------------------------------------------------------------------------------------------------------------

select *			#selects all the tables required
                            from orders, catalog, author
							where
								catalog.b_id = orders.b_id and
                                catalog.a_id = author.a_id;
#e) Demonstrate how you increase the price of books published by a specific publisher by 10%.
update catalog 
set price = 1.1*price 
where p_id = (
							select p_id 
							from publisher 
                            where 
								name = 'Pearson'
					  );

select * from author;
select * from publisher;
select * from category;
select * from catalog;
select * from orders;

commit;





















