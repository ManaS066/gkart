with payments as (
    select * from {{ ref('stg_stripe__payments')}}

)

select 
    order_id,
    SUM(amount) as total_amt
     from payments
     group by order_id
     having total_amt<0