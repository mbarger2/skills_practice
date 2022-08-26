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

NEXT TIME:

Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.;
dayofweek 1,7 is weekend
dayofweek 2-6 is weekday

How many rentals were in the last month of activity?;

select datediff(max(rental_date),min(rental_date)) from rental;