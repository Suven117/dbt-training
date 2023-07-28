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
 , 'https://www.airbnb.com/rooms/' || h.listing_id  as AIRBNB_URL
 ,  f.review_sentiment
 ,  count(*) as Top10_NegativeListings
 from f inner join h 
   on f.listing_id = h.listing_id
where 
   f.review_sentiment = 'negative' 
   group by  h.LISTING_NAME,  h.listing_id,  AIRBNB_URL, f.review_sentiment
   order by Top10_NegativeListings desc
limit 10

  