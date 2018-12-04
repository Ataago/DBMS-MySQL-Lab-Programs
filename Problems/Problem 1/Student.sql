create schema 1_student;

create table student(
	s_id int,
    s_name char(20),
    major varchar(5),
    lvl varchar(2),
    age int,
    constraint pk_s_idStudent
		primary key(s_id)	);

insert into student values(101, 'Ataa','CSE','SR',19);
insert into student values(102, 'Taha','ECE','JR',19);
insert into student values(103, 'Zaki','CSE','SR',19);
insert into student values(104, 'Nawaal','CSE','JR',19);



create table faculty(
	f_id int,
    f_name varchar(20),
    dept_id int,
    primary key(f_id)	);
    
insert into faculty values(201,'Prof Ravi',10);
insert into faculty values(202,'Prof Almas',10);
insert into faculty values(203,'Prof Taj',10);
    
create table class(
	c_name varchar(20),
    meets_at varchar(20),
    room_no varchar(5),
    f_id int,
    primary key(c_name),
    foreign key(f_id) references faculty(f_id));
    
insert into class values('DBMS','11','103',201);
insert into class values('ME','11','103',201);
insert into class values('ADA','11','103',201);

    
create table enrolled(
	s_id int,
    c_name varchar(20),
    foreign key(s_id) references student(s_id),
    foreign key(c_name) references class(c_name));
    
insert into enrolled values(101,'DBMS');
insert into enrolled values(101,'ME');
insert into enrolled values(101,'ADA');
insert into enrolled values(102,'DBMS');
insert into enrolled values(102,'ME');
insert into enrolled values(103,'ADA');
insert into enrolled values(104,'ME');
    
#------------------------------------------------------------------------------------------------------------------------
#Queries

#c) Find the names of all Juniors (level = JR) who are enrolled in a class taught by Prof. Ravi
select distinct s_name
from student,enrolled,class,faculty
where
	student.s_id = enrolled.s_id and
    enrolled.c_name = class.c_name and
    class.f_id = faculty.f_id and
    lvl = 'JR' and
    f_name = 'Prof Ravi';

#d) Find the names of all classes that either meet in room 103 or have four or more Students enrolled.
select c_name
from class
where
	room_no = '103' or
    c_name in (
		select c_name 
        from enrolled 
        group by(c_name) 
			having count(*) > 3
	);

#e) Find the names of faculty members for whom the combined enrollment of the courses that they teach is less than five.
select f_name
from faculty
where
	f_id in (
		select f_id
        from class
        group by(f_id)
			having count(*) < 5
	);

select * from student;
select * from faculty;
select * from class;
select * from enrolled;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    