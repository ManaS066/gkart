{{ config(materialized='table') }}

select 
    id as customer_id,
    first_name,
    last_name
from raw.jaffle_shop.customers

{% if target.name == 'dev' %}
limit 100
{% endif %}
