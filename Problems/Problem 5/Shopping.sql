create schema 5_Shopping;

#------------------------------------------------------------------------------------------------------------------------
create table customer(
	c_no int,
    c_name varchar(20),
    city varchar(20),
    constraint pk_c_noCustomer
		primary key(c_no));

insert into customer values(101,'Ataa','Bangalore');
insert into customer values(102,'Nawaal','Bangalore');
insert into customer values(103,'Taha','Hyderabad');
insert into customer values(104,'Zaki','Hyderabad');

#------------------------------------------------------------------------------------------------------------------------       
create table orders(
	o_no int,
    o_date date,
	c_no int,
	o_amt int,
    constraint pk_o_noOrders
		primary key(o_no),
	constraint fk_c_noOrders
		foreign key(c_no) references customer(c_no));
        
insert into orders values(1001,'2018-08-10',101,500);
insert into orders values(1002,'2018-08-10',102,700);
insert into orders values(1003,'2018-08-11',101,1200);
insert into orders values(1004,'2018-08-12',102,500);
insert into orders values(1005,'2018-08-13',103,1300);

#------------------------------------------------------------------------------------------------------------------------
create table item(
	i_no int,
    i_price int,
    constraint pk_i_noItem
		primary key(i_no));

insert into item values(1,500);
insert into item values(2,700);
insert into item values(3,100);
insert into item values(4,900);
insert into item values(5,1000);

#------------------------------------------------------------------------------------------------------------------------
create table orderItem(
	o_no int,
    i_no int,
    quantity int,
    constraint fk_o_noOrderItem
		foreign key(o_no) references orders(o_no),
	constraint fk_i_noOrderItem
		foreign key(i_no) references item(i_no));

insert into orderItem values(1001,1,1);
insert into orderItem values(1001,2,1);
insert into orderItem values(1002,3,1);
insert into orderitem values(1003,4,1);
insert into orderitem values(1004,2,2);
insert into orderitem values(1005,3,1);

#------------------------------------------------------------------------------------------------------------------------
create table warehouse(
	w_no int,
	city varchar(20),
    constraint pk_w_noWarehouse
		primary key(w_no));

insert into warehouse values(2001,'Bangalore');
insert into warehouse values(2002,'Delhi');
insert into warehouse values(2003,'Bangalore');

#------------------------------------------------------------------------------------------------------------------------
create table shipment(
	o_no int,
    w_no int,
    s_date date,
    constraint pk_o_noShipment
		primary key(o_no),
    constraint fk_o_noShipment
		foreign key(o_no) references orders(o_no),
	constraint fk_w_noShipment
		foreign key(w_no) references warehouse(w_no));

insert into shipment values(1001,2001,'2018-08-10');
insert into shipment values(1002,2001,'2018-08-10');
insert into shipment values(1003,2002,'2018-08-11');
insert into shipment values(1004,2003,'2018-08-12');
insert into shipment values(1005,2001,'2018-08-13');
    
    
#------------------------------------------------------------------------------------------------------------------------
#1. Produce a listing: CUSTNAME, #oforders, AVG_ORDER_AMT, where the middle
#    	column is the total numbers of orders by the customer and the last column is the
#		average order amount for that customer.

select c_name,count(o_no) as No_of_orders ,avg(o_amt) as Avg_Order_amt
from orders, customer
where
	customer.c_no = orders.c_no 
group by(c_name);


#------------------------------------------------------------------------------------------------------------------------
#2. List the order# for orders that were shipped from all warehouses that the company has
# 		in a specific city.
select o_no as Order_Number
from shipment, warehouse
where
	shipment.w_no = warehouse.w_no and
	warehouse.city = 'Bangalore';
    

#------------------------------------------------------------------------------------------------------------------------
#3. Demonstrate how you delete item# 10 from the ITEM table and make that field null in
#		the ORDER_ITEM table.

alter table orderItem drop foreign key fk_i_noOrderItem;

alter table orderItem 
add constraint fk_i_noOrderItem 
	foreign key(i_no) references item(i_no) 
    on delete set NULL;

delete from item where i_no = 1;
#------------------------------------------------------------------------------------------------------------------------

select * from customer;
select * from orders;
select * from item;
select * from orderitem;
select * from warehouse;
select * from shipment;

commit;


















