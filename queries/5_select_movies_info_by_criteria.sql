select 
movies.id,movies.title,movies.release_date
,movies.duration,movies.description
,json_build_object(
	'id', persons.id
	,'first_name', persons.first_name
	,'last_name', persons.last_name) as director_info
from movies
join movies_genres
on movies.id=movies_genres.movie_id
join genres
on movies_genres.genre_id=genres.id
left join persons
on movies.director=persons.id
where origin_country='US'
and date_part('year', release_date)>=2022
and duration>105
and genres.name in ('Action','Drama')
group by movies.id,persons.id