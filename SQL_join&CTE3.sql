--Return a list of stations with a count of number of trips starting at 
--that station but ordered by dock count.
SELECT
	start_station,
	dockcount, 
	COUNT(*)
FROM stations
JOIN trips
ON trips.start_station = stations.name
GROUP BY 1,2
ORDER BY 2 DESC