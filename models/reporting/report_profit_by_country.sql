Select 
      country
    , sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by
      country 
order by profit desc