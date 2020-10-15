with

-- Think of this as importing your data
orders as (
    select * from {{ ref ('stg_orders')}}
),

payments as (
    select * from {{ ref ('stg_payments')}}
),


final as (
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        sum(payments.amount) as amount
    from orders
    left join payments using (order_id)
      -- can also use > left join payments on payments.order_id = orders.order_id
    where payments.status = 'success'
    group by 1, 2, 3
)

select * from final