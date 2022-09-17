-- Database & Table Characteristics

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

-- Inserting no values into a table row
insert into cats() values();
select * from cats;

-- How to require a value cannot be NULL: NOT NULL
create table cats2 (name varchar(20) NOT NULL, age INT NOT NULL);
show tables;
-- comparing the two cats tables to compare null conditions:
desc cats;
show columns from cats2;
-- Attempting to insert data w/o age
insert into cats2(name) values('Texas');
select * from cats2;
insert into cats2(age) values(3);
select * from cats2;
insert into cats2(name, age) values ('Strawberry',12);
select* from cats2;

-- Setting default values
create table default_cats(name varchar(100) default 'unnamed',age int default 99);
desc default_cats;
-- table with not null and default
create table nulldefcats(name varchar(20) not null default 'unnamed', age int not null default 99);
desc nulldefcats;
insert into nulldefcats(name) values('Rob');
select * from nulldefcats;
insert into nulldefcats() values();
select * from nulldefcats;

-- THE DIFFERENCE BETWEEN NULL AND DEFAULT IS MANUALLY SETTING A VALUE AS NULL
insert into cats() values();
select * from cats;
insert into default_cats() values();
select * from default_cats;
insert into default_cats(name,age) values('Montana',NULL);
select * from default_cats;
-- unable to do the following:
insert into nulldefcats(name,age) values('Montana',NULL);
select * from nulldefcats;

-- Key column in desc table output
-- 'Key' aka 'Primary Key' help distinguish otherwise identical rows
create table key_cats(cat_id INT NOT NULL, name varchar(20), 
age int, primary key (cat_id));
desc key_cats;
insert into key_cats(cat_id, name, age) values(1,'Leo',5);
select * from key_cats;
insert into key_cats(cat_id, name, age) values(2,'Lion',6);
select * from key_cats;
-- example of insert being denied due to duplicate primary key:
insert into key_cats(cat_id, name, age) values(2,'Libra',3);
select * from key_cats;

-- making primary key autocount w/o manual entry
create table key_cats2(cat_id int not null auto_increment, 
name varchar(20), age int, primary key(cat_id));
desc key_cats2;
insert into key_cats2 (name, age) values('Homeynado',8),('Marley',6),('Bubba',6),('Finx',7),('Oreo',4),('Ginger',2);
select * from key_cats2;

show tables from cat_app;

-- EXERCISE
create table employees(id int not null auto_increment, last_name varchar(25) NOT NULL,
first_name varchar(25) NOT NULL, middle_name varchar(25), age int NOT NULL, 
current_status varchar(25) NOT NULL default 'employed', primary key(id));
-- alternatively: create table employees(id int not null auto_increment PRIMARY KEY, 
-- last_name varchar(25) NOT NULL, first_name varchar(25) NOT NULL, middle_name varchar(25),
-- age int NOT NULL, current_status varchar(25) NOT NULL default 'employed');
desc employees;
insert into employees(last_name, first_name, age) values ('Barger','Matthew',30),('Ferraro','Alex',26),
('Barger','Aaron','25');
select * from employees;





