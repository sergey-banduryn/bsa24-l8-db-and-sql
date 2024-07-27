select 
movies.id,movies.title,movies.release_date
,movies.duration,movies.description
,(select json_build_object(
	'id', persons.id
	,'first_name', persons.first_name
	,'last_name', persons.last_name)
	from persons
	where persons.id=movies.director) as director_info
,array(	select json_build_object(
	'id',persons.id
	,'first_name',persons.first_name
	,'last_name',persons.last_name)
	from characters
	join persons
	on characters.person_id=persons.id
	where characters.movie_id=movies.id) as actors
,array(	select json_build_object(
	'id',genres.id,'name',genres.name)
	from movies_genres
	join genres
	on movies_genres.genre_id=genres.id
	where movies_genres.movie_id=movies.id) as genres
from movies
where movies.id=573435
