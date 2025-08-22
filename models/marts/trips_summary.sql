with trips as (
    select * from {{ ref('stg_taxi_trips') }}
),

summary as (
    select
        date_trunc('month', pickup_datetime) as month,
        count(*) as total_trips,
        avg(trip_distance) as avg_distance,
        avg(total_amount) as avg_fare,
        avg(extract(epoch from (dropoff_datetime - pickup_datetime))/60.0) as avg_duration_min
    from trips
    group by 1
)

select * from summary
