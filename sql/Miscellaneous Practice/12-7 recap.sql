use bank;

select a.account_id, a.district_id, a.frequency, 
d.A2 as District, d.A3 as Region, l.loan_id, 
l.amount, l.payments, l.status from bank.account a 
JOIN bank.district d on a.district_id = d.A1
JOIN bank.loan l on a.account_id = l.account_id
where l.status = "B"
order by a.account_id;

select * from (
  select a.account_id, a.district_id, a.frequency, d.A2 as District,
    d.A3 as Region, l.loan_id, l.amount, l.payments, l.status
  from bank.account a join bank.district d
  on a.district_id = d.A1
  join bank.loan l
  on a.account_id = l.account_id
where l.status = "B"
order by a.account_id)sub1
where sub1.amount > (
  select round(avg(amount),2)
  from bank.loan
  where status = "B")
order by amount desc;

with cte_1 as (
    select * from (
      select a.account_id, a.district_id, a.frequency, d.A2 as District,
        d.A3 as Region, l.loan_id, l.amount, l.payments, l.status
      from bank.account a
      join bank.district d
      on a.district_id = d.A1
        join bank.loan l
        on a.account_id = l.account_id
        where l.status = "B"
        order by a.account_id ) sub1
      where sub1.amount > (
        select round(avg(amount),2)
        from bank.loan
        where status = "B")
      order by amount desc)
select cte_1.account_id, cte_1.amount, max(date(t.date)) as Last_transaction
from cte_1
join bank.trans t on cte_1.account_id = t.account_id
group by cte_1.account_id, cte_1.amount
order by cte_1.amount desc;

select *
from bank.loan l1
where l1.payments > (select avg(payments) from bank.loan l2 where l1.duration = l2.duration)
and l1.status = "A"
order by account_id;

select account_id, round(sum(amount),2) as Amount, date_format(date, "%M") as Month
from trans
where date_format(date, "%Y") = 1993 and date_format(date, "%m") <= 3
group by account_id, Month;

#next query is more effective than the last (check it out)

select account_id,
max( case when Month = 'January' Then Amount end) as January,
max( case when Month = 'February' Then Amount end) as February,
max( case when Month = 'March' Then Amount end) as March
from (
  select account_id, round(sum(amount),2) as Amount, date_format(date, "%M") as Month
  from trans
  where date_format(date, "%Y") = 1993 and date_format(date, "%m") <= 3
  group by account_id, Month) sub1
group by account_id
order by account_id;

-- select account_id, 'January', 'February', 'March'
-- from (
--   select account_id, amount, date_format(date, "%M") as Month from trans
--   where date_format(date, "%Y") = 1993 and date_format(date, "%m") <= 3
-- ) as sub1
-- pivot (
--   sum(amount) for Month in ('January', 'February', 'March')
-- ) as sub2;


#string manipulation

create function print_function (x char(20))
returns char(50) deterministic
return concat('Iron', x, '!');
select print_function('hack');

delimiter //
create procedure number_of_rows_proc (out param1 int)
begin
select COUNT(*) into param1 from bank.account;
end;
//
delimiter ;

call number_of_rows_proc(@x);
select @x;

select round(avg(amount),2)
from bank.loan
where status = "B";