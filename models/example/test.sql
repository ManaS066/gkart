{{
    config(
        materialized='table'
    )
}}
select ORDERID from raw.stripe.payment