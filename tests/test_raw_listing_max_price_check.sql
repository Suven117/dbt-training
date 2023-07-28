-- Test case will fail if the max price per night is more than beyond 8000

SELECT
 id AS listing_id,
 name AS listing_name,
 listing_url,
 room_type,
 minimum_nights,
 host_id,
 price AS price_str,
 created_at,
 updated_at
FROM
 AIRBNB.RAW.raw_listings
where  REPLACE(price, '$' ) :: NUMBER( 10, 2) >8000