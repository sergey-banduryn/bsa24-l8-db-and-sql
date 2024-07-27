select users.id,users.username
,array_agg(users_favorite_movies.movie_id) as favorite_movies
from users
left join users_favorite_movies
on users.id=users_favorite_movies.user_id
group by users.id