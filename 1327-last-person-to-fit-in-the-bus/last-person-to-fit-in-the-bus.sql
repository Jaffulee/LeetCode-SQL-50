-- Write your PostgreSQL query statement below

-- cte for running total weight

with running_total_weight as (
    select 
        *,
        total_weight<=1000 as under_flag
    from (
            select 
                *,
                sum(weight) over (order by turn asc) as total_weight
            from queue
    )
    order by turn desc

)

-- flag underweight

, flag_under as (
    select
        *,
        row_number() over (partition by under_flag order by turn desc) as reverse_order
    from running_total_weight
)

-- Filter for people in weight limit, first person in reverse_order
select person_name
from flag_under
where under_flag and reverse_order = 1