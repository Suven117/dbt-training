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
 , f.review_date
 , f.reviewer_name
 , f.review_text
 ,  f.review_sentiment
 from f inner join h 
   on f.listing_id = h.listing_id
where 
   h.listing_id = 3176
   order by f.review_date desc
  


  