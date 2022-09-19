select * from bank.account a1
join bank.account a2
on a2.account_id<> a1.account_id;

select * from bank.account a1
join bank.account a2
on a2.account_id<> a1.account_id
where a1.district_id = a2.district_id
order by a1.district_id;

select * from bank.disp;

select * from bank.disp d1
join bank.disp d2
on d1.account_id = d2.account_id;

select * from bank.disp d1
join bank.disp d2
on d1.account_id = d2.account_id
and d1.type <> d2.type;

select d1.account_id, d1.type as Type1, d2.type as Type2
from bank.disp d1
join bank.disp d2
on d1.account_id = d2.account_id and d1.type <> d2.type
where d1.type = 'DISPONENT';