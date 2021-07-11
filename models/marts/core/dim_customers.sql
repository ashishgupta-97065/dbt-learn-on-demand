/* Get customers from model*/
with customers as (

    select * from {{ ref('stg_customers')}}

),

/* Get orders from model*/
orders as (

    select * from {{ ref('stg_orders') }}

),

/* Group to get order count by customers */
customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),

/* Join to combine customer data with customer order count */
customer_with_order_count as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer_id)

),

/* Group payments to get total life time value */
customer_life_time_value as (
    select
        customer_id,
        coalesce(sum(amount), 0)as life_time_value
    /*sum(amount) as life_time_value*/

    from {{ ref('fct_orders') }}

    group by 1
),

/* Join to combine customer data with customer order count */
customer_with_order_and_life_time_value as (

    select 
        customer_with_order_count.customer_id,
        customer_with_order_count.first_name,
        customer_with_order_count.last_name,
        customer_with_order_count.first_order_date,
        customer_with_order_count.most_recent_order_date,
        customer_with_order_count.number_of_orders,
        coalesce(customer_life_time_value.life_time_value,0) as life_time_value
    
    from customer_with_order_count

    left join customer_life_time_value using (customer_id)
)

select * from customer_with_order_and_life_time_value