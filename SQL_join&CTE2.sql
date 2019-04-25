--2. Which station is full most often?
SELECT
status_10K.station_id,
stations.name,
COUNT(CASE WHEN docks_available=0 then 1 END) zero_count
FROM status_10K
JOIN stations
ON stations.station_id = status_10K.station_id
GROUP BY 1,2
ORDER BY zero_count