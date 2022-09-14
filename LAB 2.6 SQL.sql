-- 1. In the table actor, which are the actors whose last names are not repeated?
SELECT first_name, last_name FROM sakila.actor
GROUP BY first_name, last_name
HAVING COUNT(last_name) = 1;

-- 2. Which last names appear more than once?
SELECT first_name, last_name FROM sakila.actor
GROUP BY first_name, last_name
HAVING COUNT(last_name) > 1; -- not sure if correct, only appeared 1 person

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT *, SUM(rental_id) AS sum
FROM sakila.rental
GROUP BY staff_id
ORDER BY sum ASC; -- dont have this clear

-- 4. Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(title) AS 'releases' FROM sakila.film
GROUP BY release_year;

-- 5. Using the film table, find out for each rating how many films were there.
SELECT rating, COUNT(title) AS 'releases' FROM sakila.film
GROUP BY rating;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places.
SELECT rating, ROUND(AVG(length),2) AS 'average length'
FROM sakila.film
GROUP BY rating; 

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, ROUND(AVG(length),2) AS 'average length'
FROM sakila.film
GROUP BY rating
HAVING 'average length' > 120.00; -- there should be 1 but doesn't seem to appear

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT title, length FROM sakila.film
RANK() OVER (PARTITION BY (title) ORDER BY length DESC) AS RANK; ----- NOT SURE HOW TO DO THIS