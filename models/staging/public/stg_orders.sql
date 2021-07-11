with orders as (

    select
        "ID" as ORDER_ID,
        "USER_ID" as CUSTOMER_ID,
        "ORDER_DATE" as ORDER_DATE,
        "STATUS" as STATUS

    from {{source('public','jaffle_shop_orders')}}

)
select * from orders

/* with orders as (

    select
        "ID" as ORDER_ID,
        "USER_ID" as CUSTOMER_ID,
        "ORDER_DATE" as ORDER_DATE,
        "STATUS" as STATUS

    from jaffle_shop_orders

)
select * from orders
*/