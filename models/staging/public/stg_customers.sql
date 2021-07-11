/*
with customers as (

    select
        "ID" as CUSTOMER_ID,
        "FIRST_NAME" as FIRST_NAME,
        "LAST_NAME" as LAST_NAME

    from airbyte_data_warehouse.public.jaffle_shop_customers

)
select * from customers
*/

with customers as (

    select
        "ID" as CUSTOMER_ID,
        "FIRST_NAME" as FIRST_NAME,
        "LAST_NAME" as LAST_NAME

    from {{source('public', 'jaffle_shop_customers')}}
)

select * from customers