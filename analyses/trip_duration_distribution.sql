-- Example exploratory analysis: distribution of trip durations
with trips as (
    select * from {{ ref('stg_taxi_trips') }}
)

select
    width_bucket(
        extract(epoch from (dropoff_datetime - pickup_datetime))/60.0, 
        0, 120, 12
    ) as duration_bin,
    count(*) as trips
from trips
group by 1
order by 1
