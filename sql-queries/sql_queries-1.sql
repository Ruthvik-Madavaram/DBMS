show databases;
use sakila;

/*Find out the PG-13 rated comedy movies. DO NOT use the film_list table.*/
select f.title,f.rating,c.name from film f
inner join film_category fc
on f.film_id = fc.film_id
inner join category c
on fc.category_id = c.category_id
where f.rating = 'PG-13' and c.name = 'Comedy';

/*Find out the top 3 rented horror movies.*/
select f.title,c.name from film f 
inner join film_category fc
on f.film_id = fc.film_id
inner join category c 
on fc.category_id = c.category_id
inner join inventory i
on fc.film_id = i.film_id
inner join rental r 
on r.inventory_id = i.inventory_id
inner join customer cu
on r.customer_id = cu.customer_id
where c.name = 'Horror'
group by f.title
order by count(cu.customer_id) desc limit 3;

/*Find out the list of customers from India who have rented sports movies.*/
select distinct(cu.name) from film_category fc
inner join category c 
on c.category_id = fc.category_id 
inner join inventory i
on i.film_id = fc.film_id
inner join rental r 
on r.inventory_id = i.inventory_id
inner join customer_list cu 
on cu.ID = r.customer_id
where cu.country = 'India' and c.name = 'Sports';

/*Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.*/
select distinct(cu.name) from film_category fc
inner join category c 
on c.category_id = fc.category_id 
inner join inventory i
on i.film_id = fc.film_id
inner join rental r 
on r.inventory_id = i.inventory_id
inner join customer_list cu 
on cu.ID = r.customer_id
inner join film_actor fa
on fc.film_id = fa.film_id
inner join actor a 
on a.actor_id = fa.actor_id
where cu.country = 'Canada' and a.first_name = 'NICK' and a.last_name = 'WAHLBERG';

/*Find out the number of movies in which “SEAN WILLIAMS” acted.*/
select count(f.title) from film f 
inner join film_actor fa
on fa.film_id = f.film_id
inner join actor a
on fa.actor_id = a.actor_id
where a.first_name = 'SEAN' and a.last_name = 'WILLIAMS';