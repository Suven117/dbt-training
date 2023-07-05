Select 
      segment
    , sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by
      segment
order by profit desc