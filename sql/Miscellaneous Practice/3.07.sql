-- 3.07
-- Activity 1

with cte_activity as (
  select Active_users, lag(Active_users,1) over (partition by Activity_year) as last_month,
  Active_users/lag(Active_users,1)over (partition by Activity_year) as Percent_change, Activity_month
  from Monthly_active_users
)
select * from cte_activity
where last_month is not null;

-- Activity 2

with cte_activity as (
  select Active_users, lag(Active_users,1) over (partition by Activity_year) as last_month,
  lag(Active_users,1,-Active_users) over (partition by Activity_year) as Customers_lost, Activity_month
  from Monthly_active_users
)
select * from cte_activity
where last_month is not null;

-- Activity 3
-- Use a similar approach to get total monthly transaction per account and the difference with the previous month.







