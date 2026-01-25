use regex;
#Q1 Question: For each trip_date, show number of trips, total fare, and average rating. 
select trip_date,count(trip_id) as trips_count ,sum(fare) as total_fare,avg(rating) as avg_rating from trips group by trip_date;
#Q2 Question: By base_area, show total trips, total fare, and average distance.
select base_area,count(trip_id) as trips ,sum(fare)as total_fare,avg(distance_km) as avg_distance from drivers as d join trips as t on d.driver_id=t.driver_id group by base_area;
#Q3Rating buckets count (>=4.8 as “High”, else “Other”)rating_bucket trips
SELECT CASE WHEN rating >= 4.8 THEN 'High' ELSE 'Other' END AS rating_bucket, COUNT(trip_id) AS trips FROM Trips GROUP BY CASE WHEN rating >= 4.8 THEN 'High' ELSE 'Other' END;
#Q4 Days where total fare >= 800 (GROUP BY + HAVING)
select trip_date,sum(fare) as total_fare from trips group by  trip_date having sum(fare) >=800;
#Q5 Base-area average rating, only areas with avg rating >= 4.7 (HAVING)
select base_area,avg(rating) as avg_rating from drivers as d join trips as t on d.driver_id=t.driver_id group by base_area having avg(rating)>=4.7;
#Q6Trips with fare greater than the overall average fare (single-row subquery)
SELECT trip_id, driver_id, fare FROM Trips WHERE fare > (SELECT AVG(fare) FROM Trips);
#Q7 Drivers who have at least one trip rated 4.9 (multi-row IN subquery)
SELECT driver_id, driver_name FROM Drivers WHERE driver_id IN (SELECT driver_id FROM Trips WHERE rating = 4.9);
#Q8 Drivers whose total fare is greater than the average total fare per driver
WITH DriverTotals AS (SELECT driver_id, SUM(fare) AS total_fare FROM Trips GROUP BY driver_id) SELECT d.driver_name, dt.total_fare FROM Drivers d
JOIN DriverTotals dt ON d.driver_id = dt.driver_id
WHERE dt.total_fare > (SELECT AVG(total_fare) FROM DriverTotals);
#Q9 Latest trip per driver
SELECT trip_id, driver_id, trip_date, fare
FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY driver_id ORDER BY trip_date DESC) as rn FROM Trips) t WHERE rn = 1;
#Q10 Row number of trips per driver ordered by date (then trip_id)
select driver_id, trip_id, trip_date, row_number() over(partition by driver_id order by trip_date,trip_id) as rn from trips;
#Q11 Running total fare per driver over time
select driver_id, trip_id ,trip_date, fare, sum(fare) over(partition by driver_id order by trip_id,trip_date) as running_fare from trips;
#Q12 Rank trips by fare within each driver (highest fare rank 1)
select driver_id, trip_id ,fare ,dense_rank() over(partition by driver_id order by fare) as  fare_rank from trips;
#Q13 Show each trip’s fare minus the driver’s average fare (window AVG)
SELECT driver_id, trip_id, fare, AVG(fare) OVER(PARTITION BY driver_id) AS driver_avg_fare, fare - AVG(fare) OVER(PARTITION BY driver_id) AS fare_diff
FROM Trips;
#Q14 For each driver, show the previous trip’s fare (LAG) ordered by date
SELECT driver_id, trip_id, trip_date, fare,
    LAG(fare) OVER(PARTITION BY driver_id ORDER BY trip_date, trip_id) AS prev_trip_fare
FROM Trips;