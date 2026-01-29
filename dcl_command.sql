#views= vitual table,it will make your complex query easy ,not store data physically,gives security
#use regex;
#create table newpayment as select payment_id,amount from sakila.payment where payment_id between 1 and 7;
#simple view
#select * from newpayment;
#complex view
#create view payment_v as select count(*) from newpayment;
#select * from payment_v;
#insert into payment_v values(10);
#user create permission
#ddl statement
#create user regex1 identified by 'regex';
#select * from mysql.user;
#create database tushardb;
#create table tushardb.actor1 as select actor_id,first_name from sakila.actor where actor_id between 1 and 5;
#create table tushardb.actor2 as select actor_id,first_name from sakila.actor where actor_id between 3 and 7;
#------------grant permission on database to username;
#grant select on tushardb.actor2 to regex1;
#grant select on tushardb.* to regex1;
grant all privileges on tushardb.actor1 to regex1;
show grants for regex1;




