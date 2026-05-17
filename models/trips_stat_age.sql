with step0 as (
	select
		count(t.id) as trips,
		t.started_at::date as date,
		FLOOR(EXTRACT(EPOCH FROM t.started_at-u.birth_date) / 60 / 60 / 24 / 365.25) AS age 
	from scooters_raw.trips t
	join scooters_raw.users u on u.id = t.user_id
	group by date, age
)
select
	age,
	avg(trips)
from step0
group by age