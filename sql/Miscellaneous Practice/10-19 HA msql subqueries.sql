-- step 1: calculate the average
select avg(amount) 
from bank.loan;

-- step 2 --> pseudo code the main goal of this step ....
select * from bank.loan
where amount > "AVERAGE";

select *, round(avg(amount),2) as avg from bank.loan
where amount > avg;


-- step 3 ... create the query
select * from bank.loan
where amount > (
  select avg(amount)
  from bank.loan
);


-- step 4 - Prettify the result. Let's find top 10 such customers
select * 
from bank.loan
where amount > 
(select avg(amount)
from bank.loan)
order by amount desc
limit 10;





select * from (
  select account_id, bank_to, account_to, sum(amount) as Total
  from bank.order
  group by account_id, bank_to, account_to
) sub1
where total > 10000;



select bank from (
  select bank, avg(amount) as Average
  from bank.trans
  where bank <> ''
  group by bank
  having Average > 5500) sub1;
  
  
  
  select k_symbol from (
  select avg(amount) as Average, k_symbol
  from bank.order
  where k_symbol <> ' '
  group by k_symbol
  having Average > 3000
  order by Average desc
) sub1;




select * from bank.order
where bank_to in (
  select bank from (
    select bank, avg(amount) as Average
    from bank.trans
    where bank <> ''
    group by bank
    having Average > 5500
    ) sub1
)
and k_symbol <> ' ';




select * from bank.trans
where k_symbol in (
  select k_symbol as symbol from (
    select avg(amount) as Average, k_symbol
    from bank.order
    where k_symbol <> ' '
    group by k_symbol
    having Average > 3000
    order by Average desc
  ) sub1
);




select k_symbol from (
  select avg(amount) as mean, k_symbol
  from bank.order
  where bank_to in (
    select bank
    from (
      select bank, avg(amount) as Average
      from bank.trans
      where bank <> ''
      group by bank
      having Average > 5500
    ) sub1
  )
  and k_symbol <> ' '
  group by k_symbol
  having mean > 2000
) sub;





select operation from (
  select avg(balance) as Avg_balance, operation
  from bank.trans
  where k_symbol in (
    select k_symbol as symbol
    from (
      select avg(amount) as Average, k_symbol
      from bank.order
      where k_symbol <> ' '
      group by k_symbol
      having Average > 3000
      order by Average desc
    ) sub1
  )
  group by operation
) sub2
order by Avg_balance
limit 1;