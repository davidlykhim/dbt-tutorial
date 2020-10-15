select 
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount / 100 as amount, -- convert from cents to dollars
    created as created_at
from {{ source('stripe','payment')}}
-- raw.stripe.payment
-- Look at raw.stripe.payments (amount ??, 1:many for orders:payments,)
-- create a staging layer