/*Test to see that total amount is > 0 ensuring refund is never greater than original payment */

with total_amount_test as (
    select
        order_id,
        sum(amount) as total_amount
    from {{ ref('stg_payments') }}
    group by 1
) 

select * from total_amount_test where not(total_amount >= 0)