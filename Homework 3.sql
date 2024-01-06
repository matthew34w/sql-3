--1
SELECT customer.customer_id, customer.first_name, address
FROM customer
JOIN address ON customer.address_id = address.address_id
WHERE address.address = 'Texas';

--2
SELECT customer.customer_id, customer.first_name, customer.last_name, payment.amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;

--3
SELECT first_name, last_name
FROM customer
WHERE first_name IN (
    SELECT first_name
    FROM payment
    WHERE amount > 175
);

--4
SELECT customer.customer_id, customer.first_name, country.country_id
FROM customer
JOIN country ON customer.address_id = country.country_id
WHERE country.country = 'Nepal';

--5
SELECT staff.staff_id, staff.first_name, COUNT(rental.rental_id) AS last_update
FROM staff
JOIN rental ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id, staff.first_name
ORDER BY staff_id DESC
LIMIT 2;

--6
SELECT film.rating, COUNT(film.film_id) AS title
FROM film
GROUP BY film.rating;

--7
SELECT  customer.first_name, customer.active
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);

--8
SELECT COUNT(rental.rental_id) AS free_rentals
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
WHERE payment.amount = 0;