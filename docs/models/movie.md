Movie Model Attributes
- tmdb_id, integer, unique
- imdb_id, string, unique
- title, string
- adult, bool, default false
- overview, text
- vote_average, integer (multiplied by 10)
- vote_count, integer
- release_date, string yyyy-mm-dd, default current date