#number=int,decimal
#tinyint,smalest,mediumint,int,bigint
#1byte,2,3,4,8
#1byte=8 bit=2**8=256(-128 to127)
use regex;
#create table yash(salary tinyint);
insert into yash values(127);
#create table yash2(salary float,price double);
#insert into yash2 values(100.6781241,100.6781241);
#select * from yash2;
#string values (char-fix size character) and (varchar-variable length charcter)
#create table yash3(name varchar(20) ,gender char(10));
insert into yash3 values('shivani','male'),('aman','male'),('ot','female');
#select * from yash3;
#if we use varchar instead of this char then it count spaces also and in cahr it dont count
#char datatype will truncate all widespace from last ,varchar will truncate all the widespaces upto size of column
#DDl statements
#create drop alter
#create table using select(ctas)
#create table actor_cp as select first_name ,last_name from sakila.actor;
#select * from actor_cp;
#drop table actor_cp; #table structure and data both are deleted
#create table actor_cp as select first_name as fname ,last_name as last from sakila.actor where actor_id between 10 and 14;
#select * from actor_cp
#alter = change in structure
#alter table actor_cp add column (salary int);
#select * from actor_cp;
#alter table actor_cp add constraint ne_key primary key(fname);

#alter table actor_cp drop column last;
#select * from actor_cp
#alter table actor_cp rename  column salary to newsalary;
#select * from actor_cp;
#dml statemnts
#insert update 
#update  actor_cp set newsalary=900;
update  actor_cp set newsalary=888 WHERe fname='UMA';
select * from actor_cp


