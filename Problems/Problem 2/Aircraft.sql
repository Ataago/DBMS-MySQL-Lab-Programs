create schema 2_aircraft;

create table flight(
	f_no int,
    from_city varchar(20),
    to_city varchar(20),
    dist int,
    dep varchar(20),
    ari varchar(20),
    price real,
    primary key(f_no));

insert into flight VALUES(1001,'BLR','HYD',500,'10AM','11AM',3000);
insert into flight VALUES(1002,'BLR','DEL',1500,'10AM','12AM',5000);
insert into flight VALUES(1003,'BLR','MUM',1200,'10AM','11AM',2500);
insert into flight VALUES(1004,'HYD','BLR',500,'12AM','1PM',3000);

create table emp(
	e_id int,
    e_name varchar(20),
    sal int,
    primary key(e_id));

insert into emp values(101,'Kunal',100000);
insert into emp values(102,'Shafaat',50000);
insert into emp values(103,'Ataa',90000);

create table aircraft(
	a_id int,
    a_name varchar(20),
    c_range int,
    primary key(a_id) );
    
insert into aircraft values(2001,'A320',10000);
insert into aircraft values(2002,'A360',15000);
insert into aircraft values(2003,'B747',18000);
insert into aircraft values(2004,'B787',9000);


    
create table certified(
	e_id int,
    a_id int,
    foreign key(e_id) references emp(e_id),
    foreign key(a_id) references aircraft(a_id));
    
insert into certified values(101,2001);
insert into certified values(101,2002);
insert into certified values(101,2003);
insert into certified values(101,2004);
insert into certified values(102,2004);
insert into certified values(103,2002);

#------------------------------------------------------------------------------------------------------------------------
#Queries
#c) Find the names of aircraft such that all pilots certified to operate them have salaries more than Rs.80, 000.
select a_name
from aircraft,certified, emp
where
	aircraft.a_id = certified.a_id and
    certified.e_id = emp.e_id
    group by(a_name) having min(sal) > 90000;
    
#d) For each pilot who is certified for more than three aircrafts, find the eid and the maximum cruisingrange of the aircraft for which she or he is certified.
select e_id, max(c_range)
from certified, aircraft
where
	certified.a_id = aircraft.a_id 
    group by(e_id) having count(*) > 3;
    
#e) Find the names of pilots whose salary is less than the price of the cheapest route from Bengaluru to Frankfurt.
select e_name
from emp
where
	sal < (select min(price)
			from flight 
            where from_city = 'BLR' and to_city = 'HYD');
            
            
            
select * from flight;
select * from emp;
select * from aircraft;
select * from certified;
















