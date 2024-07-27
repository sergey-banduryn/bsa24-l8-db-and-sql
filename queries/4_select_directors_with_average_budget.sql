select persons.id
,persons.first_name||' '||persons.last_name as director_name
,AVG(movies.budget::numeric::real) as average_budget
from persons
join movies
on persons.id=movies.director
group by persons.id