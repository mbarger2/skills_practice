-- Snippets to Study

-- from 'notsurewhattocall', 

-- Not the most efficient way of using the HAVING clause
use bank;
select type, operation, k_symbol, round(avg(balance),2) as Average
from bank.trans
where k_symbol <> '' and k_symbol <> ' '
group by type, operation, k_symbol
having operation <> ''
order by type, operation, k_symbol;
-- <> operator is essetially the same as != in that it is looking for all other results than the one given
show databases;
use tv_app;
show tables;
select title, round(avg(rating),2) from series
JOIN reviews on reviews.series_id = series.id
group by title;

select title, rating, count(*) as num_reviews from series
JOIN reviews on series.id = reviews.series_id
where rating >= 7 group by title having count(title)>=3;


-- window functions
use bank;
select loan_id, account_id, amount, payments, duration, amount-payments as "Balance",
avg(amount-payments) over (partition by duration) as Avg_Balance
from bank.loan
where amount > 100000
order by duration, balance desc;

-- not executable but self-explantory, good structure for partition by
SELECT
	year, country, product, profit,
	SUM(profit) OVER() AS total_profit,
	SUM(profit) OVER(PARTITION BY country) AS country_profit
	FROM sales
	ORDER BY country, year, product, profit;

-- GREAT PARTITION EXAMPLE
use tv_app;
Select title, rating, round(avg(rating) over(partition by title),1) as avg_rating from series
join reviews on series.id = reviews.series_id order by title;

-- rank vs dense_rank
use tv_app;
select *, RANK() over(order by rating desc) as tv_ratings from series
JOIN reviews on series.id = reviews.series_id;
select *, DENSE_RANK() over(order by rating desc) as tv_ratings from series
JOIN reviews on series.id = reviews.series_id;

select *, round(avg(rating),2) as avg_rating, RANK() over(order by AVG(rating) desc) as tv_ratings from series
JOIN reviews on series.id = reviews.series_id GROUP BY title;



-- You can also have ORDER BY clause followed by partition by as shown below:
select loan_id, account_id, amount, payments, duration, amount-payments as "Balance",
avg(amount-payments) over (partition by duration order by duration asc, amounts desc) as Avg_Balance
from bank.loan
where amount > 100000;


-- FROM 'unfinished sql import exercise'

use bank_demo;
set global local_infile = 1;
load data local infile 'C:/Users/Matthew/DA/Class Notes/Class_14_9-23/district.csv' -- this file is at files_for_lesson_and_activities folder
into table district_demo
fields terminated by ',';
select * from district_demo;

-- failed attempt to upload csv into table due to security restraints
create database CDs;
use CDs;
create table my_cds(
	Artist varchar(255) DEFAULT 'UNKNOWN',
    Album  varchar(255)DEFAULT 'NOT FOUND',
    Year	YEAR default 0000    
    );
set global local_infile = 1;
load data local INFILE 'C:/Users/Owner/Documents/CDscsv.csv' into table my_cds fields terminated by ',' ignore 1 rows;

use bank;

select * from bank.order 
where k_symbol regexp 'o$';


select * from bank.order 
where k_symbol regexp 'o+';
select * from bank.order 
where k_symbol regexp 'p.' group by k_symbol;

select * from bank.order
where k_symbol regexp '^s';

select * from bank.district
where a2 regexp 'cesk[ey]';

select account_id, district_id, frequency, convert(date,date) from bank.account;
select account_id, district_id, frequency, CONVERT(date,datetime) from bank.account;


select SUBSTRING_INDEX(issued, ' ', 1) from bank.card;
select convert(SUBSTRING_INDEX(issued, ' ', 1), date) from bank.card;

-- converting the original format to the date format that we need:
select date_format(convert(date,date), '%Y-%M-%D') from bank.loan;

-- if we just want to extract some specific part of the date
select date_format(convert(date,date), '%Y') from bank.loan;


select date_format(convert(SUBSTRING_INDEX(issued, ' ', 1), date), '%M %D, %Y') as year_issued,
       date_format(convert(SUBSTRING_INDEX(issued, ' ', 1), date), '%d of %M of %Y') as fecha_emision;
       
select isnull('Hello');

-- FROM class 13 sql...

select *, trim(k_symbol) as trims
from bank.trans
where trim(k_symbol) is not null;
select sum(k_symbol = ' ') as k_symbol_empty,
   sum(not k_symbol = ' ') as k_symbol_non_empty
from bank.trans
where amount is not null;

select count(isnull(amount)) from bank.trans;

-- FROM 2.08pt1n2 
use bank;
select *, rank() over (order by A11) as 'rank' from bank.district
group by A3;

select *, rank() over (order by A12) as 'rank' from bank.district
group by A3;

select *, rank() over (order by amount desc) from bank.trans
limit 20;

select *, dense_rank() over (order by amount desc) from bank.trans
limit 20;

select *, rank() over (order by count(*)) 'rank' from bank.district
group by a3
order by count(*);
use bank;

select *, date(date), lag(date,1) over(date) from account;
select ;
-- FROM 10-19 HA msql subqueries
select * from bank.loan
where amount > (
  select avg(amount)
  from bank.loan
);

select * 
from bank.loan
where amount > 
(select avg(amount)
from bank.loan)
order by amount desc
limit 10;

select * from (
  select account_id, bank_to, account_to, sum(amount) as Total
  from bank.order
  group by account_id, bank_to, account_to
) sub1
where total > 10000;

select bank from (
  select bank, avg(amount) as Average
  from bank.trans
  where bank <> ''
  group by bank
  having Average > 5500) sub1;
  
  
--   FROM 12-9 recap


delimiter //
create procedure number_of_rows_proc (out param1 int)
begin
select COUNT(*) into param1 from bank.account;
end;
// delimiter ;

call number_of_rows_proc(@x);
select @x;

delimiter //
create procedure average_loss_proc (out param1 float)
begin
  select round((sum(amount) - sum(payments))/count(*), 2) into param1
  from bank.loan
  where status = "B";
end;
//
delimiter ;

call average_loss_proc(@x);
select round(@x,2) as Average_loss_per_customer;

delimiter //
create procedure return_query_rows_proc()
begin
  select *
  from bank.loan
  where status = "B";
end;
//
delimiter ;

call return_query_rows_proc();


-- FROM 3.03

Select * from bank.account;

-- 1 
-- Keep working on the bank database.
-- Let's find for each account an owner and a disponent.
select *
from ( 
select distinct account_id from bank.account 
) sub1
cross join (
select distinct type from bank.disp
) sub2
order by account_id;