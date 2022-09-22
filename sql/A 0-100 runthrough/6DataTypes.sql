-- Data Types

-- CHAR vs VARCHAR
-- CHAR is fixed, faster for fixed amounts id State abreviations
-- VARCHAR is vareiable, saves data, is flexible aka better overall
create database dog_base;
create table dogs (name char(5),breed varchar(10));
desc dogs;
insert into dogs(name, breed) values ('bob','beagle'),('bobby','corgi'),
('Diana','Retriever');
select * from dogs;
 
 
-- INT, DECIMAL
-- DECIMAL(M,D), where M is the total digits (up to 65) and D is # of digit after 
-- the decimal point (up to 30)

Create table items (price DECIMAL(5,2));
insert into items(price) values(7);
insert into items(price) values(7987654); -- error, more than 5 digits
select * from items;
insert into items(price) values(34.88);
insert into items(price) values(298.9999); -- truncated warning (rounded)
select * from items;
insert into items(price) values(1.9999); -- truncated warning (rounded)
select * from items;

-- FLOAT & DOUBLE
-- store larger numbers, use less space, but are less accurate
-- FLOAT loses precision after ~7 digits
-- DOUBLE loses precision after ~15 digits
create table thingies(price FLOAT);
insert into thingies(price) values(88.45);
select * from thingies;
insert into thingies(price) values(8877.45);
select * from thingies;
insert into thingies(price) values(8877665544.45);
 -- only saves first 6 digits, rest are zeroes
select * from thingies;

-- DATE & TIMES & DATETIMES
-- DATE: 'YYYY-MM-DD'
-- TIME: 'HH:MM:SS'
-- DATETIME: 'YYYY-MM-DD HH:MM:SS'
create table people(name varchar(25),birthdate DATE, birthtime TIME, birthdt DATETIME);
DESC PEOPLE;
insert into people(name, birthdate, birthtime, birthdt) 
values('Padma','1983-11-11','10:07:35','1983-11-11 10:07:35'),
('Larry','1943-12-25','04:10:42','1943-12-25 04:10:42');
select * from people;
select curdate(), curtime(), now(); -- respectively: current date, time, & datetime
insert into people(name, birthdate, birthtime, birthdt) values 
('Toaster', curdate(), curtime(), now());
select * from people;

use book_shop;

select name, birthdate from people;
select name, birthdate, day(birthdate), dayname(birthdate), dayofweek(birthdate), dayofyear(birthdate) from people;
select name, birthdt, day(birthdt), dayname(birthdt), dayofweek(birthdt), dayofyear(birthdt), monthname(birthdt),hour(birthdt), minute(birthdt), second(birthdt) from people;

-- date_format, time_format commands are highly versatile
select date_format(birthdt, '%W, %M %Y') from people;
desc people;
select birthdt from people where date_format(birthdt, '%M %Y') = 'November 1983';
select birthdate from people where date_format(birthdate, '%M %Y') = 'November 1983';
select date_format(birthdt, '%h %i %s') from people;
select date_format(birthdt, 'Was born on a %W') as birthdate from people;
select date_format(birthdt, '%m/%d/%Y') from people;
select date_format(birthdt, '%m/%d/%Y at %h:%m') as birthdatetime from people;

-- DATE MATH 

-- DATEDIFF
select DATEDIFF(curdate(),birthdate) from people; -- DIFFERENCE IS IN DAYS
select DATEDIFF(now(),birthdate)/365 as diff_in_years from people; 
select name, birthdate, DATEDIFF(now(),birthdate)/365 as diff_in_years from people; 

-- DATE_ADD, DATE_SUB (has many arguments for versatility as well)
use book_shop;
select birthdt, DATE_ADD(birthdt, INTERVAL 1 quarter), 
DATE_ADD(birthdt, INTERVAL 1 YEAR) FROM PEOPLE;
SELECT BIRTHDT, date_add(birthdt, interval 1 month) from people;
select birthdt, date_add(birthdt, interval '5-8' year_month) from people;
select birthdt, date_add(birthdt, interval 10 second) from people;
show tables;
rename table books_etc to books;
-- adding multiple units of time at the same time (ie years, seconds to same date)
select birthdt, birthdt + interval '5-8' year_month + interval 19 hour as newdatetime from people;
select max(birthdt), max(birthdt)- interval 1 year from people;
select * from people where birthdt > (max(birthdt) - interval 1 year);
-- Timestamps
-- has a range between '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:07' UTC
-- storage is doubled for date time compared to timestamps: 
-- takes less space for timestamp
create table comments(content varchar(100), 
created_at TIMESTAMP default now());
insert into comments(content) values('what a funny article'),
('I found this offensive');
select * from comments;
insert into comments(content) values('skjdkasdja');
select * from comments order by created_at desc;

create table comments2(content varchar(100), changed_at TIMESTAMP DEFAULT now()
on update CURRENT_TIMESTAMP);
-- NOW() == CURRENT_TIMESTAMP	
insert into comments2(content) values('skjdkasdja');
insert into comments2(content) values('lololol');
insert into comments2(content) values('I LIKE CATS AND DOGS');
update comments2 SET content='THIS IS NOT GIBBERISH' WHERE CONTENT='skjdkasdja';
select * from comments2;
update comments2 set content ='This is not a waste of time' where content='lololol' 
order by changed_at desc limit 1;
select * from comments2 order by changed_at asc;

-- EXERCISES
-- CHAR is well used to store state abbreviations
create table inventory( item_name varchar(25), price DECIMAL(8,2), quantity int);
-- datetime vs timestamp: date time store any moment in time, (past, present, future),
--     timestamp typically focuses on metadata, smaller range, timestamp takes 1/2 storage space
SELECT now();
SELECT curtime();
SELECT current_timestamp();
select curdate();
select current_date();
select dayofweek(now());
select dayofweek(curdate()); -- saturday is '7', sunday is '1'
select date_format(now(), '%w')+1 as "Today's Weekday"; -- saturday is '6', sunday is '0'
select dayname(now()) as 'Today';
select date_format(now(), '%W') as "Today";
select date_format(current_timestamp(), '%m/%d/%Y') as "Today's Date";
select date_format(current_timestamp(), '%M %D at %h:%i') as "Today's Date";
create table tweets(content varchar(50), username varchar(20), created TIMESTAMP default now());
insert into tweets(content, username) values("ur a l0s3r nerd",'imanidiot');
select * from tweets;






