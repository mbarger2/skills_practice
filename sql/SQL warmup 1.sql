use sakila;

select * from actor;

select first_name from actor;
select first_name, last_name from actor
limit 10;

select first_name from actor where first_name = 'Scarlett';
select * from actor where last_name = 'Johansson';
select count(*) from actor where last_name = 'Johansson';

select *from rental;
select count(*) from rental;

select count(*) from film;

select rental_duration from film order by rental_duration asc limit 1;
select min(rental_duration) from film;
select rental_duration from film order by rental_duration desc limit 1;
select max(rental_duration) from film;

select max(length) as max_duration, min(length) as min_duration from film;
select round(avg(length)) as avg_minutes from film;
select round(avg(length)/60,2) as avg_hours from film;
select round(avg(length)/60,2) as avg_hours, round(avg(length)) as avg_minutes from film;
select truncate(avg(length)/60,0) as avg_hours, truncate(avg(length)%60,0) as avg_minutes from film;

select count(*) from film where length >= 180;

select title from film order by length desc limit 1;
select length(title) from film order by length desc limit 1;

Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.