

with customers as (

    select *
    from {{ ref('stg_jaffle_shop_customer') }}

),

orders as (

    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(*) as number_of_orders
    from {{ ref('stg_jaffle_shop_orders') }}
    group by customer_id

)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    o.first_order_date,
    o.most_recent_order_date,
    o.number_of_orders
from customers c
left join orders o
    on c.customer_id = o.customer_id
