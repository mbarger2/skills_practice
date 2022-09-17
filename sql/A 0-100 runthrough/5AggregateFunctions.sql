-- Aggregate Functions

use book_shop;

-- COUNT
select count(*) from books;
select count(DISTINCT author_fname) from books;
select count(author_lname) from books;
select count(DISTINCT author_lname, author_fname) from books;
select count(title) from books where title like '%the%';

-- GROUP BY
select title, author_lname from books group by author_lname order by author_lname;
select author_lname, count(*) from books group by author_lname;
select author_fname, author_lname, count(title) as numbooks, round(avg(pages),0) as avgpages from books group by author_fname,author_lname ORDER BY author_lname;
select released_year, count(*) from books group by released_year order by released_year;
select concat('In ',released_year,' ',count(*), ' book(s) released.') as numbooksreleased from books
group by released_year order by released_year;

-- MIN & MAX/ SUM / AVG
-- -- important note on how to apply MIN/MAX (DIFFERENT!):
select concat(author_fname, ' ',author_lname) as Author, 
title from books where pages = (select max(pages) from books);

-- EXERCISES
SELECT COUNT(*) from books;
select concat('In ',released_year, ' ',count(*),' book(s) were released.') from books 
group by released_year order by released_year;
select sum(stock_quantity) from books;
select author_fname, author_lname, round(avg(released_year),1) as avgyr from books 
group by author_fname, author_lname order by released_year;
select concat(author_fname, ' ',author_lname) as Author, 
title, pages from books where pages = (select max(pages) from books);
select released_year as year, count(title) as '# books', round(avg(pages),1) as 'avg pages'
from books group by 1 ORDER BY 1;




