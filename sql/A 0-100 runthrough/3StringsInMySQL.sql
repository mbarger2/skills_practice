-- Strings in MySQL
-- there are websites that will reformat your code to 'clean it up'
-- Googling 'mysql string functions' shows full list of availble commands for strings

-- in git bash: mysql-ctl cli
-- next, to run a file in bash: source file_name.sql 

use book_shop;
show tables;
desc books;
select * from books;

-- CONCATENATE NAMES
select author_fname, author_lname from books;
select CONCAT(author_fname,' ', author_lname) as 'Author full name' from books;
select concat_ws(' - ', title, author_fname, author_lname) from books;

-- SUBSTRING
select substring('Hello World',1,4);
select substr('Hello World',1,4);
select substr('Hello World',7);  -- returns string starting at given position ('World')
select substr('Hello World',-5);  -- returns string starting at given position counting from the end to the left ('World')
select substr(title,1,10), author_fname, author_lname from books;
select concat(substr(title,1,10),'...') as 'Title' from books;

-- REPLACE (CASE SENSITIVE)
select replace('Hello World','Hell','****');
select replace('Hello World','l','7');
select replace('cheese milk bread apple coffee',' ', ' and ');
select replace(title,'e','3') as newtitle from books;
select substr(replace(title,'e','3'),1,10) as newtitle from books;

-- REVERSE
select reverse(title) from books;
select reverse(substr(reverse(title),-10)) from books;
select concat('woof',substring(reverse('woof'),-3));

-- CHAR_LENGTH
select AUTHOR_LNAME, char_length(AUTHOR_LNAME) AS 'NAME LENGTH'FROM BOOKS;
select concat(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') from books;

-- UPPER() and LOWER()
select upper(title) from books;
select replace(lower(title),' ','') from books; -- snakecase 

-- EXERCISES
select reverse(Upper('Why does my cat look at me with such hatred?'));
-- 'I-like-cats' is returned by the statement given
select replace(title, ' ', '->')from books;
select author_lname as forwards, reverse(author_lname) as backwards from books;
select upper(concat(author_fname, ' ',author_lname)) as 'full name in caps' from books;
select concat(title, ' was released in ',released_year) as blurb from books;
select title, char_length(title) as 'character count' from books;
select concat(substr(title,1,10),'...') as 'short title', 
concat(author_lname,',',author_fname) as author, 
concat(stock_quantity,' in stock') as quantity from books limit 2;







