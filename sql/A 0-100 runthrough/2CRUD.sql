-- CRUD (Create Read Update Delete)

-- recreating the cats table
use cat_app;
show tables from cat_app;
drop table cats;
show tables;

-- CREATE
create table cats(cat_id int not null auto_increment primary key, name varchar(25),
breed varchar(25), age int);
desc cats;
insert into cats(name, breed, age) values ('Ringo', 'Tabby', 4),('Cindy','Maine Coon',10),
('Dumbledore','Maine Coon',11),('Egg','Persian',4),('Misty','Tabby',13),
('George Michael','Ragdoll',9),('Jackson','Sphynx',7);
select * from cats;

-- READ

-- introducing the 'Where' clause
select breed as types from cats;
select * from cats where age between 4.5 and 10.5 order by breed desc limit 2;
select * from cats where age = 4;
select * from cats where name = 'eGg';

-- QUICK EXERCISES
select cat_id from cats;
select name, breed from cats;
select name, age from cats where breed = 'Tabby';
select cat_id, age from cats where cat_id = age;
select cat_id as id, name, breed as type from cats;


-- UPDATE
SET SQL_SAFE_UPDATES = 0; -- works around safe update default in mysql
update cats set breed='Shorthair' where breed ='Tabby'; -- changes Tabby to Shorthair
select DISTINCT(breed) from cats;
update cats set age=14 where name='Misty';
select * from cats where name ='Misty';

-- Quick Exercises
select * from cats where name = 'Jackson';
update cats set name ='Jack' where name ='Jackson';
select name from cats;
update cats set breed='British Shorthair' where name = 'Ringo';
select * from cats where name = 'ringo';
select DISTINCT(breed) from cats;
update cats set age = 12 where breed ='Maine Coon';
select * from cats where breed = 'Maine Coon';


-- DELETE/DESTROY
desc cats;
DELETE from cats where name ='Egg';
select * from cats;

  -- if an id is deleted, it is not replaced by future insertions
insert into cats(name, breed, age) values('Homeynado','Striped',8);
select cat_id as id from cats where name='Homeynado';

-- ***keep table but remove all data (CANNOT BE UNDONE DANGEROUS COMMAND)***
-- ***DELETE from cats***

-- QUICK EXERCISES
DELETE from cats where age = 4;
select * from cats;
Delete from cats where cat_id = age;
select * from cats;
DELETE from cats;
select * from cats;





