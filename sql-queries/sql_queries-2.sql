use sakila;
show tables;
desc customer_list;
desc sales_by_film_category;
select * from customer limit 1;
/*Find out the number of documentaries with deleted scenes.*/
select count(f.title) from film f
inner join film_category fc
on fc.film_id = f.film_id
inner join category c 
on c.category_id =  fc.category_id
where c.name = 'Documentary' and f.special_features = 'Deleted Scenes';

/*Find out the number of sci-fi movies rented by the store managed by Jon Stephens.*/
select count(distinct(fc.film_id)) from film_category fc
inner join category c 
on c.category_id = fc.category_id
inner join inventory i
on i.film_id = fc.film_id
inner join rental r 
on r.inventory_id = i.inventory_id
inner join customer cu
on cu.customer_id = r.customer_id
inner join store s 
on s.store_id = cu.store_id
inner join staff st 
on s.manager_staff_id = st.staff_id
where st.first_name = 'JON' and st.last_name = 'STEPHENS' and c.name = 'Sci-Fi';

/*Find out the total sales from Animation movies.*/
select total_sales from sales_by_film_category where category = 'Animation';

/*Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.*/
select c.name from film_category fc 
inner join category c 
on c.category_id = fc.category_id
inner join inventory i 
on i.film_id = fc.film_id
inner join rental r 
on r.inventory_id = i.inventory_id
inner join customer cu 
on cu.customer_id = r.customer_id
where cu.first_name = 'PATRICIA' and cu.last_name = 'JOHNSON'
group by c.name
order by count(fc.film_id) desc limit 3;

/*Find out the number of R rated movies rented by “SUSAN WILSON”.*/
select count(f.film_id) from film f
inner join film_category fc
on f.film_id = fc.film_id 
inner join category c 
on c.category_id = fc.category_id
inner join inventory i 
on i.film_id = fc.film_id
inner join rental r 
on r.inventory_id = i.inventory_id
inner join customer cu 
on cu.customer_id = r.customer_id
where cu.first_name = 'SUSAN' and cu.last_name = 'WILSON' and f.rating = 'R';