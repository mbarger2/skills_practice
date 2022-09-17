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

-- delete a table
Drop table cats;
show tables in cat_app;
Drop database cat_app;
show tables in cat_app;

-- EXERCISE
Create database pastries;
use pastries;
show tables in pastries;
show tables;
create table desserts(name varchar(50), quantity int);
show tables;
desc desserts;
show columns in desserts;
select * from desserts;
drop table desserts;
show tables from pastries;
drop database pastries;











