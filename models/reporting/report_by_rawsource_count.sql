WITH
sh AS (
 SELECT
 *
 FROM
 {{ ref('src_hosts') }}
),
sl AS (
 SELECT * 
 FROM {{ ref('src_listings') }}
),
sr AS (
 SELECT * 
 FROM {{ ref('src_reviews') }}
)

Select 
'Host' as Raw_Soure
, count(*) Raw_RecCount
, count( host_id) as UniqueID
, count(host_name) as Name
from sh
union
Select 
'Listing' as Raw_Soure
, count(*) Raw_RecCount
, count( listing_id) as UniqueID
, count(listing_name) as Name
from sl
union
Select 
'Review' as Raw_Soure
, count(*) Raw_RecCount
, count( listing_id) as UniqueID
, count(reviewer_name) as Name
from sr