-- SQL Self and Cross Join Lab

-- Problem 1
select a1.film_id, concat(b1.first_name, ' ',b1.last_name) as Actor_1, 
concat(b2.first_name,' ',b2.last_name) as Actor_2  from sakila.film_actor a1
join sakila.film_actor a2
on a2.actor_id <> a1.actor_id
join sakila.actor b1 on a1.actor_id = b1.actor_id
join sakila.actor b2 on a2.actor_id = b2.actor_id
where a1.film_id = a2.film_id and a1.actor_id > a2.actor_id
order by a1.actor_id;


-- Problem 2
use sakila;
create temporary table morefilms
select customer_id, count(*) as counts
from sakila.rental
group by customer_id
having counts > 3;
select* from morefilms;

select * from morefilms f1
join (select customer_id, count(*) as counts
from sakila.rental
group by customer_id
having counts > 3) f2
on f1.customer_id <>f2.customer_id;


-- Problem 3
select concat(a.first_name, ' ', a.last_name) as actor_name,
f.title from sakila.actor a
cross join sakila.film as f;

select *
from ( 
select concat(first_name," ", last_name) as Actor_name from sakila.actor
) actorcol
cross join (
select distinct Title from sakila.film
) filmcol;