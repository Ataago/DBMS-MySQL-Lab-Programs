create schema 4_Bank;

#------------------------------------------------------------------------------------------------------------------------
create table branch(
	b_name varchar(20),
    b_city varchar(20),
    assets real,
    primary key (b_name));
desc branch;
insert into branch values('Tolichowki','Hyderabad',1000000);
insert into branch values('BSK II','Bangalore',2000000);
insert into branch values('JP Nagar','Bangalore',3000000);
insert into branch values('BSK II-main','Bangalore',2000000);
insert into branch values('JP Nagar-main','Bangalore',3000000);

#------------------------------------------------------------------------------------------------------------------------
create table accounts(
	acc_no int,
    b_name varchar(20),
    bal int,
    primary key(acc_no),
    foreign key(b_name) references branch(b_name));
desc accounts;
insert into accounts values(101,'Tolichowki',100000);
insert into accounts values(102,'Tolichowki',150000);
insert into accounts values(103,'BSK II-main',200000);
insert into accounts values(104,'JP Nagar',300000);
insert into accounts values(105,'BSK II-main',350000);
insert into accounts values(106,'JP Nagar-main',250000);
insert into accounts values(107,'JP Nagar-main',100000);
insert into accounts values(108,'BSK II',110000);
insert into accounts values(109,'JP Nagar-main',120000);
delete from accounts where b_name = 'Tolichowki';


#------------------------------------------------------------------------------------------------------------------------

create table loan(
	loan_no int,
    b_name varchar(20),
    amt real,
    primary key(loan_no),
    foreign key(b_name) references branch(b_name));
desc loan;
insert into loan values(201,'Tolichowki',100000);
insert into loan values(202,'Tolichowki',100000);
insert into loan values(203,'JP Nagar-main',200000);

#------------------------------------------------------------------------------------------------------------------------
create table customer(
	c_name varchar(20),
    c_street varchar(20),
    c_city varchar(20),
    primary key(c_name));
desc customer;
insert into customer values('Ataa','JHBCS','BLR');
insert into customer values('Nabil','JHBCS','BLR');
insert into customer values('Amit','JHBCS','BLR');
insert into customer values('Nishant','JHBCS','BLR');

#------------------------------------------------------------------------------------------------------------------------
create table depositor(
	c_name varchar(20),
    acc_no int,
    constraint pk_acc_no
		primary key(acc_no),
    constraint fk_c_nameDepositor
		foreign key(c_name) references customer(c_name),
    constraint fk_acc_noDepositor 
		foreign key (acc_no) references accounts(acc_no));
desc depositor;
insert into depositor values('Ataa',101);
insert into depositor values('Ataa',103);
insert into depositor values('Ataa',104);
insert into depositor values('Ataa',106);
insert into depositor values('Ataa',108);
insert into depositor values('Amit',105);
insert into depositor values('Amit',107);
insert into depositor values('Nabil',102);
insert into depositor values('Nishant',109);

#------------------------------------------------------------------------------------------------------------------------
create table borrower(
	c_name varchar(20),
    loan_no int,
    foreign key(c_name) references customer(c_name),
    foreign key(loan_no) references loan(loan_no));
desc borrower;
insert into borrower values('Ataa',201);

#------------------------------------------------------------------------------------------------------------------------
#queries:
#1. Find all the customers who have at least two accounts at the Main branch.
select c_name
from depositor 
where 
	acc_no in (
						select acc_no 
						from accounts
						where 
							b_name like '%main%' 
					)
group by(c_name) having count(*) >= 2;

#or (using join condition)
select c_name
from depositor,accounts
where
	depositor.acc_no = accounts.acc_no and
	b_name like '%main%'
group by (c_name) having count(*) >= 2;

#------------------------------------------------------------------------------------------------------------------------
#d) Find all the customers who have an account at all the branches located in a specific city
select c_name
from depositor,accounts,branch
where 
	depositor.acc_no = accounts.acc_no and
    accounts.b_name = branch.b_name and
    b_city = 'Bangalore'
group by(c_name)
having count(distinct accounts.b_name) = (select count(b_name) from branch where b_city = 'Bangalore');


#------------------------------------------------------------------------------------------------------------------------
#e) Demonstrate how you delete all account tuples at every branch located in a specific city.
alter table depositor 
drop foreign key fk_acc_noDepositor;

alter table depositor 
add constraint fk_acc_noDepositor 
	foreign key(acc_no) references accounts(acc_no)
    on delete cascade;

delete from accounts
where 
	b_name in (
							select b_name
							from branch
							where
								b_city = 'Hyderabad'
					);
#------------------------------------------------------------------------------------------------------------------------


select * from branch;
select * from accounts;
select * from loan;
select * from customer;
select * from depositor;
select * from borrower;

commit;
savepoint ataago;
rollback;