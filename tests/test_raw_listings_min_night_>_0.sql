with minimumnights
as(
    select * from {{ ref('src_listings') }}
)

select * from minimumnights
where  minimum_nights < 0