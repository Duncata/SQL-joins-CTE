--1. are the three longest trips on rainy days?
WITH rainy as
(SELECT 
DATE(date) as rainy_day
FROM weather
WHERE events = 'Rain'
GROUP BY 1)

SELECT
trip_id,
duration,
DATE(start_date)
FROM trips 
JOIN rainy 
ON DATE(start_date)=rainy.rainy_day
ORDER BY duration DESC
LIMIT 3;