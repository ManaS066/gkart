 select
        status as value_field,
        count(*) as n_records

    from RAW.STRIPE.stg_jaffle_shop_orders
    group by status