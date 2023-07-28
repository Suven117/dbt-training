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
 --  f.listing_id
 --, f.review_date
   monthname(f.review_date) as Month
 , Year(f.review_date) as Year
 --, h.listing_name as AIRBNB_NAME
 --, h.room_type
 --, f.reviewer_name
 --, f.review_sentiment
 --, f.review_text
 --, h.minimum_nights
 , sum(h.price)
 --, h.host_name
 --, (CASE WHEN h.host_is_superhost ='t' THEN 'YES' WHEN h.host_is_superhost ='f' THEN 'NO' END) as IS_SUPERHOST
 from f inner join h 
   on f.listing_id = h.listing_id
   group by Month, Year
 order by Year desc
