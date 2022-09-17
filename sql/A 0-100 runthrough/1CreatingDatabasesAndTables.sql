-- MySQL Crash Course (1)

-- Create a database
Create database cat_app;

-- Activate database for use
use cat_app;

-- Create table within database
Create table cats (name varchar(100), age int);

-- Show all tables present in database
show tables;
show tables from cat_app;

-- show all column data in specific table
show columns from cats;
DESC cats;

-- show a specific table from database
select * from cats;

-- delete table
drop table cats;
show table from cat_app;

-- delete database
drop database cat_app;
show table from cat_app;

-- EXERCISE
create database pastries;
use pastries;
show tables from pastries;
create table desserts(name varchar(50), quantity int);
show tables from pastries;
show tables;
desc desserts;
show columns in desserts;
select * from desserts;
drop table desserts;
show tables from pastries;
drop database pastries;
show tables from pastries;


-- Insert data into a table
create database cat_app;
use cat_app;
create table cats(name varchar(50), age int);
show tables;
insert into cats(name, age) values('Jetson',7);
desc cats;
select* from cats;
insert into cats(name,age) values('Homeynado', 3),('Marley',4);
select * from cats;

-- order can be randomized as long as the order is the same 
-- in initial description and actual entry 
insert into cats(age, name) values(4,'Bubba');
select * from cats;

-- EXERCISE
create table people(first_name varchar(20), last_name varchar(20), age int);
show tables;
insert into people(first_name, last_name, age) values('Peter','Roggins',54),
('Petre','Livingsworth',32),('Petra','Levensky',24);
select * from people;
desc people;
drop table people;
show tables in cat_app;

-- NULL in Tables
Desc cats;





