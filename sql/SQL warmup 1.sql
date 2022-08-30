use sakila;

select * from actor;
select first_name from actor;
select first_name, last_name from actor
limit 10;

1.Select all the actors with the first name ‘Scarlett’.;
select first_name from actor where first_name = 'Scarlett';

2. Select all the actors with the last name ‘Johansson’.;
select * from actor where last_name = 'Johansson';
select count(*) from actor where last_name = 'Johansson';

3. How many films (movies) are available for rent?;
select *from rental;
select count(*) from rental;

4. How many films have been rented?;
select count(*) from film;

5. What is the shortest and longest rental period?;
select rental_duration from film order by rental_duration asc limit 1;
select min(rental_duration) from film;
select rental_duration from film order by rental_duration desc limit 1;
select max(rental_duration) from film;

6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.;
select max(length) as max_duration, min(length) as min_duration from film;
select round(avg(length)) as avg_minutes from film;

7. Whats the average movie duration?;
select round(avg(length)/60,2) as avg_hours from film;
select round(avg(length)/60,2) as avg_hours, round(avg(length)) as avg_minutes from film;

8. Whats the average movie duration expressed in format (hours, minutes)?;
select truncate(avg(length)/60,0) as avg_hours, truncate(avg(length)%60,0) as avg_minutes from film;

9. How many movies longer than 3 hours?;
select count(*) from film where length >= 180;

10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.;
select length(title) from film order by length desc limit 1;

10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.;
select concat(first_name,'.',last_name,'@sakilacustomer.org') as 'email path' from customer;

11. Whats the length of the longest film title?;
select title from film order by length desc limit 1;





