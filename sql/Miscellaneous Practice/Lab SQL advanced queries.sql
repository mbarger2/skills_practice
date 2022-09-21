-- Advanced queries lab

-- 1
-- List each pair of actors that have worked together.
select a1.film_id, concat(b1.first_name, ' ',b1.last_name) as Actor_1, 
concat(b2.first_name,' ',b2.last_name) as Actor_2  from sakila.film_actor a1
join sakila.film_actor a2
on a2.actor_id <> a1.actor_id
join sakila.actor b1 on a1.actor_id = b1.actor_id
join sakila.actor b2 on a2.actor_id = b2.actor_id
where a1.film_id = a2.film_id and a1.actor_id > a2.actor_id
order by a1.actor_id;

-- 2
-- For each film, list actor that has acted in more films.
drop temporary table whocares;
create temporary table whocares
select a.actor_id, count(a.film_id) as film_count, b.title, concat(c.first_name,' ',c.last_name) as actor_name
from sakila.film_actor a
join sakila.film b on a.film_id=b.film_id
join sakila.actor c on c.actor_id = a.actor_id
group by actor_id;

with cte_whocares as 
(
select distinct film_actor.actor_id,  actor_name, film_count, title, 
rank() over(partition by film_id order by film_count desc) as rank_actors
from sakila.film_actor
join whocares on whocares.actor_id = film_actor.actor_id
order by film_id)
select * from cte_whocares
where rank_actors = 1 order by film_count desc;