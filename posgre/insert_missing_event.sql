
-- Insert missing events into an ordered sequence of event records in PosgreSQL



-- V1 

/*

case 1) 

original : out of service -> x ( x!= return to service )
modified : out of service -> return to service 

*/

WITH triple AS (
        SELECT vin, category
        , LAG(category,1) OVER www AS must_be_c
        , LAG(date,1) OVER www AS c_date
        , LAG(time,1) OVER www AS c_time
        FROM abcd_dev
                WINDOW www AS (PARTITION BY vin ORDER BY date,time desc)
        )
INSERT INTO abcd_dev ( date,time , category , vin )
SELECT t.c_date, t.c_time,'Return to Service', t.vin
FROM triple t
WHERE t.must_be_c = 'Out of Service'





/*

case 2) 

original :   x ( x!= out of service) -> return to service 
modified : out of service -> return to service 

*/



-- To check if this case 2) is necessary 





----------------------------------------




-- V2


WITH triple AS (
        SELECT vin, category
        , LAG(category,2) OVER www AS must_be_a
        , LAG(category,1) OVER www AS must_be_c
        , LAG(date,1) OVER www AS c_date
        , LAG(time,1) OVER www AS c_time
        , LAG(category,0) OVER www AS must_be_d
        FROM abcd_dev
                WINDOW www AS (PARTITION BY vin ORDER BY date)
        )
INSERT INTO abcd_dev ( date,time , category , vin )
SELECT t.c_date, t.c_time,'out_of_service', t.vin
FROM triple t
WHERE t.must_be_a = 'End booking'
AND t.must_be_c = 'Return to Service'
AND t.must_be_d = 'Create booking'




-- V3
INSERT INTO abcd_dev (out_of_service, return_service, vin,date,TIME,category)
SELECT c.out_of_service,
       c.return_service,
       c.vin,
       c.date,
       c.time,
       'out_of_service'
FROM abcd_dev c
JOIN abcd_dev a ON a.vin = c.vin
AND a.date < c.date
AND a.time < c.time
AND NOT EXISTS
  (SELECT *
   FROM abcd_dev x
   WHERE x.vin = a.vin
     AND x.date >= a.date
     AND x.date <= c.date
     AND x.time >= a.time
     AND x.time <= c.time )
JOIN abcd_dev d ON d.vin = c.vin
AND d.date > c.date
AND d.time > c.time
AND NOT EXISTS
  (SELECT *
   FROM abcd_dev x
   WHERE x.vin = d.vin
     AND x.date >= c.date
     AND x.date <= d.date
     AND x.time >= c.time
     AND x.time <=  d.time )
WHERE c.category = 'Return to Service' ;
