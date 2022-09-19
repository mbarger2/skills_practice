-- drop view if exists <view name>;
-- drop table if exists <table name>;



create or replace view customer_status_D as
select * from bank.loan
where status = 'D'
with check option;

insert into customer_status_D
values (000, 0000, 383, 88, 0900,1000, 'C');
-- will not insert due to "check option" line only allowing
-- status as 'D'


-- the following is an example of not a self-contained subquery


select * from bank.loan l1
where amount > (
select avg(amount)
from bank.loan l2
where l1.status = l2.status
)
order by amount desc;

-- ---------------------------------------------------------------------------------------------

-- month on month monthly active users (MAU)
create or replace view user_activity as
select account_id, convert(date, date) as Activity_date,
date_format(convert(date,date), '%M') as Activity_Month,
date_format(convert(date,date), '%Y') as Activity_year
from bank.trans;

create or replace view Monthly_active_users as
select count(distinct account_id) as Active_users, Activity_year, Activity_Month
from user_activity
group by Activity_year, Activity_Month
order by Activity_year, Activity_Month;
with cte_activity as (
  select Active_users, lag(Active_users,1) over (partition by Activity_year) as last_month, Activity_year, Activity_month
  from Monthly_active_users
)
select * from cte_activity
where last_month is not null;
-- Number of retained users per month
with distinct_users as (
  select distinct account_id , Activity_month, Activity_year
  from user_activity
)
select count(distinct d1.account_id) as Retained_customers, d1.Activity_month, d1.Activity_year
from distinct_users d1
join distinct_users d2
on d1.account_id = d2.account_id and d1.activity_month = d2.activity_month + 1
group by d1.Activity_month, d1.Activity_year
order by d1.Activity_year, d1.Activity_month;

create or replace view retained_customers_view as
with distinct_users as (
  select distinct account_id , Activity_month, Activity_year
  from user_activity
)
select count(distinct d1.account_id) as Retained_customers, d1.Activity_month, d1.Activity_year
from distinct_users d1
join distinct_users d2 on d1.account_id = d2.account_id
and d1.activity_month = d2.activity_month + 1
group by d1.Activity_month, d1.Activity_year
order by d1.Activity_year, d1.Activity_month;

-- Percentage change in the number of retained customers.
select * from retained_customers;

select Retained_customers, lag(Retained_customers, 1) over(partition by Activity_year), Activity_month, Activity_year
from retained_customers;

select (Retained_customers-lag(Retained_customers, 1) over(partition by Activity_year)) as Diff, Activity_month, Activity_year
from retained_customers;
















