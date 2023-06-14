-- 1) List the number of films per category.
select count(f.film_id), fc.category_id from film f
left join film_category fc on f.film_id=fc.film_id
group by fc.category_id
order by fc.category_id asc;

-- 2) Display the first and the last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address, a.district, a.postal_code from staff s
left join address a on s.address_id = a.address_id;

-- 3) Display the total amount rung up by each staff member in August 2005.
select p.staff_id, sum(p.amount) as total_amount
from payment p
left join staff s on p.staff_id = s.staff_id
where year(p.payment_date)=2005 and month(p.payment_date)=8
group by p.staff_id;

-- 4) List all films and the number of actors who are listed for each film.
select f.title, count(fa.actor_id) from film f
left join film_actor fa on f.film_id = fa.film_id
group by f.title;

-- 5) Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select c.first_name, c.last_name, sum(p.amount) from customer c
left join payment p on c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name asc;