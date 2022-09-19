-- SQL Subqueries Lab
-- 1 (works)
-- How many copies of the film Hunchback Impossible exist in the inventory system?
with cte_hunch as(
select a.film_id, b.title from sakila.inventory a 
join sakila.film b using(film_id)
)
select count(*) from cte_hunch
where title = 'Hunchback Impossible';

-- 2 (works)
-- List all films whose length is longer than the average of all the films.
with cte_temp as(
select * from sakila.film
where length> (
select avg(length) from sakila.film
)
)
select title, length from cte_temp
order by length desc;

-- 3 (works)
-- Use subqueries to display all actors who appear in the film Alone Trip.
with cte_movie as(
select a.title, concat(c.first_name, ' ',c.last_name) as actor_name from sakila.film a
join sakila.film_actor b on a.film_id = b.film_id
join sakila.actor c on b.actor_id = c.actor_id)
select count(*) from cte_movie
where title = 'Alone Trip';






-- 4 (works)
-- Sales have been lagging among young families, and you wish to target all family 
-- movies for a promotion. Identify all movies categorized as family films.
with cte_fam as(
select a.name, c.title from sakila.category a
join sakila.film_category b using (category_id)
join sakila.film c using (film_id))
select title from cte_fam
where name = 'Family';




-- 5 (works)
-- Get name and email from customers from Canada using subqueries. 
-- Do the same with joins. Note that to create a join, you will have 
-- to identify the correct tables with their primary keys and foreign keys, 
-- that will help you get the relevant information.

with cte_customer as(
select a.first_name, a.last_name, a.email,d.country from sakila.customer a
join sakila.address b using (address_id)
join sakila.city c using (city_id)
join sakila.country d using (country_id)
)
select concat(first_name,' ',last_name) as full_name, email from cte_customer
where country = 'Canada';


-- 6 (works)
-- Which are films starred by the most prolific actor? Most prolific actor is 
-- defined as the actor that has acted in the most number of films. 
-- First you will have to find the most prolific actor and then use that actor_id 
-- to find the different films that he/she starred.

with cte_pro as(
select a.actor_id, a.film_id, c.first_name, c.last_name from sakila.film_actor a
join sakila.film b using (film_id)
join sakila.actor c using (actor_id)
)
select concat(first_name,' ',last_name) as full_name, count(film_id) as films_acted from cte_pro
group by full_name 
order by films_acted desc
limit 1;







-- 7 (works)
-- Films rented by most profitable customer. You can use the customer table and 
-- payment table to find the most profitable customer ie the customer that has 
-- made the largest sum of payments


with cte_rented as(
select a.amount, a.customer_id, b.first_name, b.last_name from sakila.payment a
join sakila.customer b on b.customer_id=a.customer_id
join sakila.rental c on c.rental_id=a.rental_id
join sakila.inventory d on c.inventory_id =d.inventory_id
join sakila.film e on e.film_id=d.film_id
)
select concat(first_name,' ',last_name) as full_name,  sum(amount) as total_paid from cte_rented
group by full_name
order by total_paid desc
limit 1;




-- 8 (works)
-- Customer who spent the least amount more than the average payments.

with cte_temp as(
select account_id,payments from bank.loan
where payments> (
select avg(payments) from bank.loan
)
)
select * from cte_temp
order by payments
limit 1;






