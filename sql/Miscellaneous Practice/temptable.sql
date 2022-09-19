


create temporary table bank.distinct_cards
select distinct type from bank.card;
select * from bank.distinct_cards;
create temporary table bank.distinct_frequency
select distinct frequency from bank.account;
select * from bank.distinct_frequency;

select fa1 film_id, concat(a2.first_name," ", a2.last_name)
from sakila.actor a1
join film_actor fa1
on a1.actor_id = fa1.film_id
and fa1.;


create temporary table bank.distinct_cards
select distinct type from bank.card;
create temporary table bank.distinct_frequency
select distinct frequency from bank.account;
select * 
from bank.distinct_cards
cross join bank.distinct_frequency;



select *
from ( 
select distinct type from bank.card 
) sub1
cross join (
select distinct type from bank.disp
) sub2;