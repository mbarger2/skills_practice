with cte_loan as (
  select * from bank.loan
)
select * from cte_loan
where status = 'B';
with cte_transactions as (
  select account_id, sum(amount), sum(balance)
  from bank.trans
  group by account_id
)
select * from cte_transactions ct
join account a
on ct.account_id = a.account_id;
create view running_contract_ok_balances as
with cte_running_contract_OK_balances  as (
  select *, amount-payments as Balance
  from bank.loan
  where status = 'C'
  order by Balance
)
select * from cte_running_contract_OK_balances
where Balance > (
  select avg(Balance)
  from cte_running_contract_OK_balances
)
order by Balance desc
limit 20;

drop view if exists customer_status_D;
create view customer_status_D as
select * from bank.loan
where status = 'D'
with check option;

create or replace view customer_status_D as
select * from bank.loan
where status = 'D'
with check option;
select * from customer_status_D;

insert into customer_status_D values (0000, 00000, 987398, 00000, 60, 00000, 'C');
create or replace view customer_status_D as
select * from bank.loan
where status = 'D';

select * from customer_status_D;
insert into customer_status_D values (0000, 00000, 987398, 00000, 60, 00000, 'C');
select * from  bank.loan
order by loan_id;
drop view if exists customer_status_D;