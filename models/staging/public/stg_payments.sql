with payments as (

    select
        "ID" as PAYMENT_ID,
        "ORDERID" as ORDER_ID,
        "PAYMENTMETHOD" as PAYMENT_METHOD,
        "STATUS" as STATUS,

        --AMOUNT IS IN CENTS
        "AMOUNT"/100 as AMOUNT,
        
        "CREATED" as "PAYMENT_CREATED_AT"


    from {{source('public','stripe_payments')}}

)
select * from payments

/*
with payments as (

    select
        "ID" as PAYMENT_ID,
        "ORDERID" as ORDER_ID,
        "PAYMENTMETHOD" as PAYMENT_METHOD,
        "STATUS" as STATUS,
        --AMOUNT IS IN CENTS
        "AMOUNT"/100 as AMOUNT,
        "CREATED" as "PAYMENT_CREATED_AT"


    from stripe_payments

)
select * from payments
*/