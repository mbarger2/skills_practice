-- WORKSHEET

use tv_app;

-- 




use bank;
select *, lag(date(date)) over(order by date) from account group by date; 

select *, first_value(account_id) over(order by date) from account group by date;

select *, 
-- could inner join and sum a column over this for totals by date

select date from account where date like '%13';
select date from account where date regexp '13$';
select date from account where date regexp '^95' order by date desc;
select date from account where date regexp '045|043';