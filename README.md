# NYC Taxi Data EDA with dbt + Redshift

This repository demonstrates **exploratory data analysis (EDA)** on the public [NYC Yellow Taxi dataset](https://www.nyc.gov/assets/tlc/pages/tlc-trip-record-data) using **dbt** and **Amazon Redshift**.

## Overview
1. Load raw NYC taxi trip data into Redshift (via S3 staging).
2. Use dbt to:
   - Create **staging models** for raw data.
   - Build **summary marts** with aggregations (average fare, trip duration, passenger counts).
   - Run **analyses** like trip duration distributions and monthly revenue trends.
3. Showcase exploratory queries on the data.

## Project Structure
```
nyc_taxi_dbt_eda/
├── models/
│   ├── staging/
│   │   └── stg_taxi_trips.sql
│   └── marts/
│       └── trips_summary.sql
├── analyses/
│   └── trip_duration_distribution.sql
├── seeds/
│   └── sample_taxi_data.csv
├── tests/
│   └── test_trips_summary.yml
├── dbt_project.yml
├── requirements.txt
└── README.md
```

## Setup

1. **Install dbt**
   ```bash
   pip install -r requirements.txt
   ```

2. **Configure Redshift connection**  
   Create a `profiles.yml` (in `~/.dbt/`) like:
   ```yaml
   nyc_taxi_dbt_eda:
     target: dev
     outputs:
       dev:
         type: redshift
         host: your-redshift-cluster.xxxxxx.us-west-2.redshift.amazonaws.com
         user: awsuser
         password: SuperSecret
         port: 5439
         dbname: dev
         schema: analytics
   ```

3. **Run dbt**
   ```bash
   dbt seed
   dbt run
   dbt test
   ```

4. **Explore**
   - Run `dbt compile` to see generated SQL.
   - Use the analyses in `/analyses` to guide exploration.

---
**License:** MIT
