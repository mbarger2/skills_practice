use sakila;

How many distinct (different) actors last names are there?;
select count(distinct(last_name)) from actor;

In how many different languages where the films originally produced? (Use the column language_id from the film table);
select distinct(language_id) from film;
select count(distinct(language_id)) as '# of languages' from film;

How many movies were released with "PG-13" rating?;
select count(rating) from film where rating = 'PG-13';

Get 10 the longest movies from 2006.;
select title, length from film where release_year = 2006 order by length desc limit 10;

How many days has been the company operating (check DATEDIFF() function)?;
select datediff(max(rental_date),min(rental_date)) from rental;

Show rental info with additional columns month and weekday. Get 20.;
select *, month(rental_date)as rental_month, dayofweek(rental_date) as rental_weekday, month(return_date)as return_month, 
dayofweek(return_date) as return_weekday from rental LIMIT 20;
select *, month(rental_date)as rental_month, dayname(rental_date) as rental_weekday, month(return_date)as return_month, 
dayname(return_date) as return_weekday from rental LIMIT 20;

NEXT TIME:;
SELECT rental_date from rental limit 5;
select *, date_format(convert(SUBSTRING_INDEX(rental_date, ' ', 1), date), '%M %D %Y') as date_is from sakila.rental;


select min(rental_date), max(rental_date), (max(rental_date)-interval 1 month) from sakila.rental;

SELECT * FROM sakila.rental WHERE DATE(return_date) BETWEEN '2006-01-14 15:16:03' and '2006-02-14 15:16:03';

SELECT * FROM sakila.rental WHERE DATE(return_date) BETWEEN max(rental_date) and interval 1 month;

select * from sakila where rental_date > (DATE = '2005-08-02 02:35:22') ;



-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
dayofweek 1,7 is weekend;
dayofweek 2-6 is weekday;

-- How many rentals were in the last month of activity?;
SELECT DATA_TYPE from INFORMATION_SCHEMA. COLUMNS where table_schema = 'sakila' and table_name = 'rental';
SELECT DATA_TYPE from rental COLUMNS where table_schema = 'sakila' and table_name = 'rental_date';
select datediff(max(rental_date),min(rental_date)) from rental;

--------------------
Try this:
select count(*) from sakila.rental
where date_format(rental_date, "%Y") = (select date_format(max(rental_date), "%Y") from sakila.rental)
and date_format(rental_date, "%M") = (select date_format(max(rental_date), "%M") from sakila.rental);
This will check the data in the last month of the rentals
Max(rental_date) is in Feb 2006
So I am extracting all the results from that month of the yaer