select
	count(distinct id) as trips,
	count(distinct user_id) as users,
	avg(date_part('minutes', finished_at-started_at)) as avg_duration_m,
	sum(price) as revenue_rub,
	count(price = 0 or null) / cast(count(*) as real) * 100 as free_trips_pct 
from scooters_raw.trips