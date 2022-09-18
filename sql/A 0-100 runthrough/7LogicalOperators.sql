-- LOGICAL OPERATORS

-- NOT EQUAL != 
USE book_shop;
select title, released_year from books where released_year != 2017;

-- AND  &&
select title , author_lname, released_year from books where author_lname = 'Eggers' && released_year <=2012;
select title , author_lname, released_year from books where author_lname = 'Eggers' and released_year >2012;

-- GREATER THAN, LESS THAN, BETWEEN
select title, released_year from books where released_year >2004 and released_year<2015;
select title, released_year from books where released_year BETWEEN 2004 and 2015 and title like '%kids%';

-- OR
select title, released_year from books where released_year = 2005 or released_year=2012;

-- NOT IN
SELECT  title, released_year from books where released_year 
not in ( 2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014,2016) and released_year >= 2000 
order by released_year;

-- MODULUS
select title, released_year from books where released_year >=2000 and 
released_year %2!=0 order by released_year;

-- CASE 
select title, released_year, 
case
when released_year >= 2000 THEN 'Modern Lit'
else '20th Century Lit'
end as Genre
From books; 

select title, stock_quantity, 
case
when stock_quantity <50 then '*'
WHEN stock_quantity <=100 then '**'
else '***'
end as STOCK
from books;

select title, stock_quantity, 
case 
when stock_quantity between 0 and 50 then '*' 
when stock_quantity between 50 and 100 
then '**' else '***' 
end as STOCK 
from books;

-- EXERCISES
select 10 != 10; -- FALSE

select 15>14 && 99-5<=94; -- TRUE

select 1 in (5,3) || 9 between 8 and 10; -- TRUE

SELECT title, released_year from books where released_year <1980;
select * from books order by released_year;

select title, author_lname from books where author_lname in ('eggers', 'chabon');
select title, author_lname from books where author_lname = 'eggers' or author_lname ='chabon';

select title, author_lname, released_year from books where author_lname = 'Lahiri'
&& released_year >2000;

select title, pages from books where pages between 100 and 200;
select * from books order by pages;

select title, author_lname from books where author_lname like 'C%' or author_lname like 'S%';
select title, author_lname from books where substr(author_lname,1,1) = 'C' or substr(author_lname,1,1) = 'S';
select title, author_lname from books where substr(author_lname,1,1) in ('C','S');

select title, author_lname, 
case
when title like '%stories%' then 'Short Stories'
when title = 'Just Kids' or title like 'A heartbreaking work%' then 'Memoir'
else 'Novel'
end as 'TYPE'
from books;

select title, author_lname, 
case 
when count(*) = 1 then '1 book'
else concat(count(*), ' books')
end as COUNT
from books
group by author_lname, author_fname
order by author_lname;













