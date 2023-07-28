 SELECT name, regexp_substr(name, 'ß\\W+\\w+') as SC
  FROM AIRBNB.RAW.raw_listings
  where SC is not null