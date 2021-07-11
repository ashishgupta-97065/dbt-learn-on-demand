/*
See why a test is failing:

- Copy the sql from the run details
- replace count(*) wiht * 
- full video: https://courses.getdbt.com/courses/take/fundamentals/lessons/15546212-schema-tests*/

with all_values as (

    select distinct
        status as value_field

    from "airbyte_data_warehouse"."dbt_agupta"."stg_orders"

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'completed','shipped','returned','placed'
    )
)
/*Replace count(*) with * to see actual error*/
/*select count(*) as validation_errors*/
select *
from validation_errors