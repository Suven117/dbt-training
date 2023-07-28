WITH
f AS (
 SELECT
 *
 FROM
 {{ ref('fct_reviews') }}
),
h AS (
 SELECT * 
 FROM {{ ref('dim_listings_w_hosts') }}
)
Select 
   h.listing_name as AIRBNB_NAME
 , Year(f.review_date) as Sales_Year
 , monthname(f.review_date) as Month_Name
 , Month(f.review_date) as Month_No
 , sum(h.price) as Monthly_sales
 , (CASE WHEN h.host_is_superhost ='t' THEN 'YES' WHEN h.host_is_superhost ='f' THEN 'NO' END) as IS_SUPERHOST
 from f inner join h 
   on f.listing_id = h.listing_id
   group by Month_Name, Month_No, Sales_Year, AIRBNB_NAME, IS_SUPERHOST
 order by Sales_Year desc, Month_No desc
