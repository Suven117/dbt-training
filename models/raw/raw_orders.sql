{{
    config(
        materialized='table'
    )
}}

Select * from raw.globalmart.orders