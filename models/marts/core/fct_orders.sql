with orders as (

    select ORDER_ID, CUSTOMER_ID from {{ ref('stg_orders') }}

),

payments as (

    select ORDER_ID,
    sum(case when status = 'success' then AMOUNT end) as AMOUNT
    from {{ ref('stg_payments') }}
    group by 1
),

final as (


    select * from orders

    left join payments using (ORDER_ID)

)

select * from final