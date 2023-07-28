WITH
l AS (
 SELECT
 *
 FROM
 {{ ref('fct_reviews') }}
)
Select --* from l
   year(review_date) as REVIEW_YEAR
, l.review_sentiment
, count(*) as Review_Count 
from l 
group by REVIEW_YEAR, l.review_sentiment
order by review_year desc