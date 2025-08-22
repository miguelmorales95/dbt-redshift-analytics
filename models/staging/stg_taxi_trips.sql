with source as (
    select * from {{ source('public','yellow_taxi_trips') }}
),

renamed as (
    select
        vendorid as vendor_id,
        tpep_pickup_datetime as pickup_datetime,
        tpep_dropoff_datetime as dropoff_datetime,
        passenger_count,
        trip_distance,
        payment_type,
        fare_amount,
        total_amount
    from source
)

select * from renamed
