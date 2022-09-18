-- ManyToMany
-- example: many reviewers review many tv shows so each show has many reviews
-- 			and each reviewers has made many reviews

-- Series Data   <--    Reviews Data    -->   Reviewers Data

create database tv_app;
use tv_app;
create table Reviewers(
	id int AUTO_INCREMENT PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255)
    );

    
create table Series(
	id int AUTO_INCREMENT PRIMARY KEY,
    title varchar(255),
    released_year YEAR,
    genre varchar(255)
    );
    
create table Reviews(
	id int AUTO_INCREMENT PRIMARY KEY,
    rating FLOAT,
    series_id int,
    reviewer_id int,
    FOREIGN KEY(series_id) REFERENCES Series(id),
    FOREIGN KEY(reviewer_id) REFERENCES Reviewers(id)
    ON DELETE CASCADE
    );
    
    INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
    INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
    
    INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
select * from reviews;
select * from reviewers;
select * from series;

select title, rating from series
INNER JOIN reviews on series.id = reviews.series_id;
select series.title, reviews.rating from series
INNER JOIN reviews on series.id = reviews.series_id;

select series.title, round(avg(reviews.rating),1)  as avg_rating, 
	count(*) as num_reviews from series
	INNER JOIN reviews on series.id = reviews.series_id 
	group by series.id order by avg_rating;
	
select first_name, last_name, rating from reviewers
JOIN reviews on reviews.reviewer_id = reviewers.id;

-- LIST OF SERIES WITH NO REVIEWS
select title as unreviewed_series from series
LEFT JOIN reviews on reviews.series_id=series.id  where rating is null;

-- GENRE RATINGS
select genre, round(avg(rating),1) as avg_rating from series
JOIN reviews on series.id = reviews.series_id group by genre;

-- STATISTICS, ACTIVE/INACTIVE
select first_name, last_name, count(rating) as COUNT, IFNULL(MIN(rating),0) as MIN, 
	IFNULL(MAX(rating),0) as MAX, IFNULL(round(AVG(rating),1),0) as AVG, 
    case
    when rating is null then 'INACTIVE'
    ELSE 'ACTIVE'   -- alternate case option is WHEN COUNT(rating >= 1 then 'ACTIVE' ELSE 'INACTIVE'
    end as STATUS  
    from reviewers
    LEFT JOIN reviews on reviewers.id = reviews.reviewer_id
    group by last_name, first_name ORDER BY status;

select first_name, last_name, count(rating) as COUNT, IFNULL(MIN(rating),0) as MIN, 
	IFNULL(MAX(rating),0) as MAX, IFNULL(round(AVG(rating),1),0) as AVG, 
    IF(rating >= 1, 'ACTIVE','INACTIVE') as STATUS    -- Simple CASE STATEMENTS can be IF STATEMENTS
    from reviewers
    LEFT JOIN reviews on reviewers.id = reviews.reviewer_id
    group by last_name, first_name ORDER BY status;
    
    select first_name, last_name, count(rating) as COUNT, IFNULL(MIN(rating),0) as MIN, 
	IFNULL(MAX(rating),0) as MAX, IFNULL(round(AVG(rating),1),0) as AVG, 
    case
    when count(rating) >= 10 then 'POWER USER'
    WHEN COUNT(rating)> 0 then 'ACTIVE'
    ELSE 'INACTIVE'   -- alternate case option is WHEN COUNT(rating >= 1 then 'ACTIVE' ELSE 'INACTIVE'
    end as STATUS  
    from reviewers
    LEFT JOIN reviews on reviewers.id = reviews.reviewer_id
    group by last_name, first_name;
    
    -- MULTI JOIN
    select title, rating, concat(first_name, ' ',last_name) as reviewer from series
    JOIN reviews on series.id = reviews.series_id
    JOIN reviewers on reviewers.id = reviews.reviewer_id order by title;