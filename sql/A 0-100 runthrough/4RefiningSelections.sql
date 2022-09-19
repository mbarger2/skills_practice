-- REFINING SELECTIONS

use book_shop;
insert into books (title, author_fname, author_lname, released_year, stock_quantity, pages)
values('10% Happier', 'Dan', 'Harris',2014,29,256),('fake book','Freida','Harris',2001,287,428),
('Lincoln In The Bardo','George','Saunders', 2017,1000,367);
select title from books;

-- DISTINCT
select count(DISTINCT author_lname) as 'distinct', count(author_lname) as raw from books;
select count(distinct(released_year)), count(released_year) from books;
select distinct concat(author_fname, ' ', author_lname) as 'Unique Authors' from books;
select distinct author_fname, author_lname from books;

-- ORDER BY
select author_lname from books order by author_lname;
select author_lname from books order by author_lname desc;
select title from books order by title;
-- refer to 2nd column later in code (to order by)
select title, author_fname, author_lname from books order by 3,2 desc;

-- LIMIT
select title, author_fname, author_lname from books order by 3,2 desc limit 5;
select title, released_year from books order by released_year desc limit 6;

-- LIMIT can be used to extract to selection from the middle of the list:
select title, released_year from books order by released_year desc limit 1,6;

-- there is no 'END' for this limit function. You have to create a # to 
-- surpass the end of the list to include the rest of the data
SELECT * FROM TBL LIMIT 95, 18446744073709551615; 

-- LIKE
select author_fname from books where author_fname like 'Da%';
select author_fname from books where author_fname like 'D%e';
select title from books where title like '%the%';
select title from books where stock_quantity like '____'; -- 4 _ for 4 digits
select title,stock_quantity from books where stock_quantity like '%__%'; -- int w/ 2+ digits
select title from books where title like '%\%%';

-- REGEXP
select * from bank.order 
where k_symbol regexp 'o$';

select * from bank. district 
where k_sympol regexp '^s';

select * from bank.district
where a2 regexp 'cesk[ey]';





-- EXERCISES
select title from books where title like '%stor%';
select title, pages from books order by 2 desc limit 1;
select concat(title, ' - ',released_year) as summary from books 
order by released_year desc limit 3;
select title, author_lname from books where author_lname like '% %';
select title, released_year, stock_quantity from books 
ORDER BY 3 asc, 2 desc limit 3;
select title, author_lname from books order by 2, 1;
select DISTINCT(concat('my favorite author is ',author_fname, ' ',author_lname,'!')) as yell from books order by author_lname;