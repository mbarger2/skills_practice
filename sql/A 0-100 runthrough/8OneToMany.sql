-- One To Many
-- When one row of a table is referred to by many rows of a different table 
-- examples: orders for a customer, mother with many kids

CREATE DATABASE customers_and_orders;
use customers_and_orders;
CREATE TABLE customers 
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100)
);

CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
	amount DECIMAL(8,2),
	customer_id INT,
	FOREIGN KEY(customer_id) REFERENCES customers(id)
);
-- convention to name a foreign key column the name of the table and column it is referring to
-- ie '<table name with foreign key as primary key>_<primary key column name>'

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
SELECT * FROM customers;
SELECT * FROM orders;

select database();

select * from customers where last_name = 'George';
select * from orders where customer_id = 1;

-- finding a customer_id from a table to filter a second table
select * from orders where customer_id =
(select id from customers
where last_name = 'George'
);

-- Alternatively, join the two tables to make navigating the information easier
-- Cross Join / Implicit Join / Cartesian Join
-- this combines every row of one table to each row of the other table (like cross multiplying)
select * from customers, orders;
select * from orders, customers;

-- IMPLICIT INNER JOIN
select * from customers, orders where customers.id = orders.customer_id;
select first_name, last_name, order_date, amount from customers, orders 
	where customers.id = orders.customer_id;
    
-- EXPLICIT INNER JOIN (conventional)
select * from customers
Join orders 
	on customers.id = orders.customer_id;
select * from customers
INNER JOIN orders -- 'JOIN' assumes 'INNER JOIN'
	on customers.id = orders.customer_id;

select * from orders
Join customers
	on customers.id = orders.customer_id;

select first_name, last_name, order_date, amount 
from customers
Join orders 
	on customers.id = orders.customer_id;

select first_name, last_name, order_date, amount 
from orders
Join customers
	on customers.id = orders.customer_id;

-- Joins can still be modified by where, order by, group by
select first_name, last_name, order_date, amount 
from orders
Join customers
	on customers.id = orders.customer_id order by amount;

select first_name, last_name, order_date, round(avg(amount),2) as average_amount
from orders
join customers
	on customers.id = orders.customer_id 
-- group by a primary key, not last name, first name
    group by orders.customer_id; 
    
select first_name, last_name,  sum(amount) as total_spent 
from orders
join customers
	on customers.id = orders.customer_id 
    group by orders.customer_id
    order by total_spent desc; 
    
-- arbitrary join: incorrect information
select * from customers
join orders on customers.id = orders.id;

-- LEFT JOIN
-- even if rows in one table are not referred to by another table, that information is retained
-- aka if some customers haven't ordered yet, they are still shown with null info in a left join
select * from customers
LEFT JOIN orders 
	on customers.id = orders.customer_id;

select * from orders
LEFT JOIN customers 
	on customers.id = orders.customer_id;

-- IFNULL
select first_name, last_name, IFNULL(SUM(amount),0) as  total_spent from customers
LEFT JOIN orders
	on customers.id = orders.customer_id
    group by customers.id
    order by total_spent desc;

-- RIGHT JOIN
-- helps to verify all information is accounted for 
-- (what if customer id was deleted? but orders had been made by them beforehand?)
-- cant delete information with a primary key if there is an associated foreign key
select * from customers
RIGHT JOIN orders
	on customers.id=orders.customer_id;

-- ON DELETE CASCADE
-- add 'ON DELETE CASCADE' as final bit of table to orders, or any foreign key using table
-- this deletes the rows with foreign keys when the primary key is removed (which is now possible)


-- EXERCISES

select database();
create database school;
use school;
create table students(
	id int AUTO_INCREMENT primary key,
    first_name varchar(25)
    );

create table papers(
	title varchar(255),
    grade int,
    student_id int,
    FOREIGN KEY(student_id) 
		REFERENCES students(id) 
        ON DELETE CASCADE
    );
    
INSERT INTO students (first_name) 
VALUES ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) 
VALUES
	(1, 'My First Book Report', 60),
	(1, 'My Second Book Report', 75),
	(2, 'Russian Lit Through The Ages', 94),
	(2, 'De Montaigne and The Art of The Essay', 98),
	(4, 'Borges and Magical Realism', 89);

SHOW TABLES IN school;
desc papers;
desc students;
select * from papers;
select * from students;

select first_name, title, grade from students
inner join papers on students.id = papers.student_id order by first_name desc, title;

select first_name, title, grade from students
left join papers on students.id = papers.student_id;

select first_name, IFNULL(title,'MISSING') as title, IFNULL(grade,0) AS grade from students
left join papers on students.id = papers.student_id;

select first_name, IFNULL(round(avg(grade),2), 0) as average from students
left join papers on students.id = papers.student_id group by first_name order by average desc;

select first_name, IFNULL(round(avg(grade),2), 0) as average, 
case
when avg(grade) is null then 'FAILING' -- NOT A NECESSARY LINE OF CODE BUT USES 'IS NULL'
when avg(grade) >= 75 then 'PASSING'
else 'FAILING'
end as passing_status
from students 
left join papers on students.id = papers.student_id 
group by first_name order by average desc;








