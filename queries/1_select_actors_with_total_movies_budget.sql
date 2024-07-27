select persons.id,persons.first_name,persons.last_name
,sum(movies.budget) as total_budget
from persons
join characters
on persons.id=characters.person_id
join movies
on characters.movie_id=movies.id
group by persons.id