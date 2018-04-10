 WITH dates AS (
         SELECT DISTINCT generate_series(min(vehicle_logs.date) OVER (PARTITION BY vehicle_logs.vin)::timestamp without time zone, now()::date - '1 day'::interval, '1 day'::interval)::date AS date,
            vehicle_logs.vin,
            24 AS capacity_hours,
            1 AS capacity_days 
           FROM rw.vehicle_logs_fixed  vehicle_logs
          WHERE vehicle_logs.date >= '2017-09-01'::date
        ), serv_sub AS (
         SELECT vehicle_logs.vin,
            vehicle_logs.category,
            to_timestamp((vehicle_logs.date || ' '::text) || vehicle_logs."time", 'YYYY-MM-DD FMHH24:FMMI:FMSS'::text)::timestamp without time zone AS "timestamp",
            dense_rank() OVER (PARTITION BY vehicle_logs.vin ORDER BY (to_timestamp((vehicle_logs.date || ' '::text) || vehicle_logs."time", 'YYYY-MM-DD FMHH24:FMMI:FMSS'::text)::timestamp without time zone) DESC) AS rank
           FROM rw.vehicle_logs_fixed vehicle_logs
          WHERE vehicle_logs.category::text ~~ '%Service%'::text
        ), serv_calcs AS (
         SELECT s_start.vin,
            s_start."timestamp" AS start_timestamp,
            s_start.category AS start_category,
                CASE
                    WHEN s_end."timestamp" IS NULL THEN now()::date::timestamp without time zone
                    ELSE s_end."timestamp"
                END AS end_timestamp,
            s_end.category AS end_category
           FROM serv_sub s_start
             LEFT JOIN serv_sub s_end ON s_end.vin::text = s_start.vin::text AND s_end.category::text = 'Return to Service'::text AND s_end.rank =
                CASE
                    WHEN s_start.rank = 1 THEN 0::bigint
                    ELSE s_start.rank - 1
                END
          WHERE s_start.category::text = 'Out of Service'::text
        ), individual_service_res AS (
         SELECT d_1.date,
            d_1.vin,
                CASE
                    WHEN sc.start_timestamp < d_1.date AND sc.end_timestamp::date > d_1.date THEN 24::double precision
                    WHEN sc.start_timestamp < d_1.date THEN date_part('hour'::text, sc.end_timestamp) + date_part('minute'::text, sc.end_timestamp) / 60::double precision
                    WHEN sc.start_timestamp::date = d_1.date AND sc.end_timestamp::date > d_1.date THEN date_part('epoch'::text, d_1.date + '1 day'::interval - sc.start_timestamp) / 3600::double precision
                    WHEN sc.start_timestamp::date = d_1.date AND sc.end_timestamp::date = d_1.date THEN date_part('epoch'::text, sc.end_timestamp - sc.start_timestamp) / 3600::double precision
                    ELSE 0::double precision
                END AS service_hours,
            sc.start_timestamp,
            sc.end_timestamp
           FROM dates d_1
             LEFT JOIN serv_calcs sc ON (sc.start_timestamp::date <= d_1.date AND sc.end_timestamp::date >= d_1.date OR sc.start_timestamp::date = d_1.date) AND d_1.vin::text = sc.vin::text
        ), service_sum AS (
         SELECT isr.date,
            isr.vin,
            sum(isr.service_hours) AS total_service_hours,
            sum(isr.service_hours) / 24::double precision AS total_service_days
           FROM individual_service_res isr
          GROUP BY isr.date, isr.vin
        )
 SELECT d.date,
    d.vin,
    sum(ss.total_service_hours) AS total_service_hours,
    sum(ss.total_service_days) AS total_service_days,
    sum(d.capacity_hours) AS total_capacity_hours,
    sum(d.capacity_days) AS total_capactiy_days,
    sum(d.capacity_days)::double precision - sum(ss.total_service_days) AS total_bookable_days,
    sum(d.capacity_hours)::double precision - sum(ss.total_service_hours) AS total_bookable_hours
   FROM dates d
     LEFT JOIN service_sum ss ON ss.date = d.date AND ss.vin::text = d.vin::text
  GROUP BY d.date, d.vin;

