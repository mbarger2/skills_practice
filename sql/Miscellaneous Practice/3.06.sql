-- 3.06 
-- Activity 1

with cte_dist_acc as (
  select account_id, district_id, date,
  rank() over (partition by district_id order by date) as open_order
  from bank.account
)
select * from cte_dist_acc
where open_order  = 1;
-- the below can be inserted at line 9 for a join to give district names in above query
select d.a3,d.a2, a.account_id
from ordered_bank_accounts a 
inner join bank.district d on d.a1 = a.district_id
where open_order = 1
order by d.a3,d.a2;
-- Activity 2

-- view call last_week_withdrawals
Use bank;
create view last_week_withdrawals3 as
with transactions as (
select *, (
  select max(date) from bank.trans
) max_date
from bank.trans
where type = 'VYDAJ'
)
select client_id, round(sum(amount)) total_withdrawal
from bank.disp
left join transactions
using (account_id)
where date(date) > date_sub(max_date, interval 7 day)
group by client_id;
select * from last_week_withdrawals3;

create view last_week_withdrawals2 as
with cte_withdrawals2  as (
  select * from bank.trans
  where type = 'VYDAJ')
;



-- HM SOLUTIONS 

SELECT * FROM bank.loan;



with ordered_bank_accounts as (
  select account_id, district_id, 
  rank() over (partition by district_id order by date) as open_order
  from bank.account
)
select d.A3, d.A2, a.account_id
from ordered_bank_accounts a
inner join bank.district d on d.A1 = a.district_id
where open_order = 1
order by d.A3, d.A2;



use bank;
create or replace view bank.last_week_withdrawals as
with transactions as (
  select *, (
    select max(date) from bank.trans
  ) max_date 
  from bank.trans
  where type = 'vydaj'
)
select client_id, round(sum(amount)) total_withdrawal
from bank.disp
left join transactions
using (account_id)
where date(date) > date_sub(max_date, interval 7 day)
group by client_id;
select * from last_week_withdrawals;



-- Activity 3
use bank;
create or replace view bank.client_demographics as
select *,
case 
when substr(birth_number,3,2) > 50
then "Female"
else "Male" 
end as sex,
case
when substr(birth_number,3,2) > 50
then concat('19',substr(birth_number,1,2),'-', substr(birth_number,3,2)-50,'-',substr(birth_number,5,2))
else concat('19',substr(birth_number,1,2),'-', substr(birth_number,3,2),'-',substr(birth_number,5,2))
end as birth_date
from bank.client;
select * from client_demographics;

select sex, status, count(*) from client_demographics a 
join bank.disp d on d.client_id = a.client_id
join bank.loan l on d.account_id = l.account_id
group by sex,status
order by status,sex;


-- Activity 4


-- one of Kaela's solutions

select * from bank.loan l1
join bank.account a1 using(account_id)
where amount > (select avg(amount)
from bank.loan l2
join bank.account a2 using (account_id)
where a1.district_id = a2.district_id);

-- my solution

with cte_1 as
(
select district_id, round(avg(amount),0) as avg_amount from bank.loan l
join bank.account a on l.account_id= a.account_id
group by district_id
)
select * from bank.loan l
join bank.account a on l.account_id= a.account_id
join cte_1 on cte_1.district_id = a.district_id
where l.amount > avg_amount;