create database midterm_examFA2025;
use midterm_examFA2025;

create table movies(
	movie_id INT PRIMARY KEY auto_increment,
    title varchar(100),
    genre varchar(50),
    release_year INT,
    rating DECIMAL(3,1)
    );
    
create table subscribers (
	sub_id INT primary key auto_increment,
    name VARCHAR(50),
    city VARCHAR (50),
    join_date DATE,
    plan_type VARCHAR(20)
);
    
create table watch_history(
	watch_id INT primary key auto_increment,
    sub_id INT references subscribers(sub_id),
    movie_id INT references movies(movie_id),
    watch_date DATE,
    duration_min INT,
    feedback VARCHAR(100)
);



Insert into movies(title, genre, release_year, rating) values
('Inception', 'Sci-Fi', 2010, 8.8),

('Titanic', 'Romance', 1997, 9.0),

('The Matrix', 'Sci-Fi', 1999, 8.7),

('Avengers', 'Action', 2019, 8.4),

('Joker', 'Drama', 2019, 8.6)
;
 
 select * from movies;

Insert Into Subscribers(name, city, join_date, plan_type) values

('Alice', 'New York', '2022-01-15', 'Premium'),

('Bob', 'Los Angeles', '2021-11-10', 'Basic'),

('Charlie', 'Chicago', '2022-02-05', 'Standard'),

('Diana', 'New York', '2023-03-12', 'Premium'),

('Ethan', 'Houston', '2023-04-20', 'Basic')
;

select * from subscribers;
 

Insert into  watch_history(sub_id, movie_id, watch_date, duration_min, feedback) values

(1, 1, '2023-09-10', 120, 'Amazing concept'),

(2, 2, '2023-09-12', 150, 'Emotional'),

(3, 3, '2023-09-13', 100, NULL),

(4, 4, '2023-09-14', 140, 'Too long'),

(5, 5, '2023-09-15', 110, 'Outstanding');

select * from watch_history;
 
-- 1. movies that are not Sci-Fi but rating above 8.5
select * from movies 
where genre != "Sci_Fi" and rating > 8.5;


-- 2. movies title with  second character ‘a’
select * from movies 
where title LIKE '_a%';

-- 3. movies released before 2000 OR rated below 8.0, exclude genre "Action"
select * from movies
where (release_year < 2000 OR rating < 8.0)
and genre != 'Action';

-- 4. only those genres where the average rating is greater than 8.5
select genre, AVG(rating) AS avg_rating
from movies
group by genre
having AVG(rating) > 8.5;



-- 5. highest and lowest movie ratings labeled as Highest_Rating and Lowest_Rating
SELECT 
    MAX(rating) as Highest_Rating,
    MIN(rating) as Lowest_Rating
from movies;


-- 6. add a new column award_won BOOLEAN to the movies table
ALTER TABLE movies
ADD COLUMN award_won BOOLEAN;


select * from movies;

-- 7. update award_won to true for all movies whose ratings are 8.8 or higher
UPDATE movies
SET award_won = TRUE
WHERE rating >= 8.8;

select * from movies;


-- 8. reduce the rating by 0.2 for all movies older than the year 2000
update movies
set rating = rating - 0.2
where release_year < 2000;

select * from movies;


-- 9. delete all subscribers whose join_date is before 2021
DELETE FROM subscribers
where join_date < '2021-01-01';

Select * from subscribers;


-- 10. show how many years old each movie is
select 
    title, release_year, YEAR(CURDATE()) - release_year AS years_old
FROM movies;



