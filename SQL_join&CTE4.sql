--What's the length of the longest trip for each day and it rains anywhere?
WITH rainy_date as
(SELECT
DATE(date) as weather_date 
FROM weather
WHERE events = 'Rain'
GROUP BY 1),

duration_date as
(SELECT
DATE(trips.start_date) as trip_date,
trip_id,
duration
FROM trips 
JOIN rainy_date
ON  rainy_date.weather_date = DATE(trips.start_date))  

SELECT
duration_date,
MAX(duration) as max_duration
FROM duration_date
GROUP BY 1
ORDER BY max_duration desc;











