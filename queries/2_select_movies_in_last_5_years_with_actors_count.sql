select movies.id,movies.title,count(persons.id) as actors_count
from movies
join characters
on movies.id=characters.movie_id
join persons
on characters.person_id=persons.id
where date_part('year', movies.release_date)>date_part('year', CURRENT_DATE)-5
group by movies.id
