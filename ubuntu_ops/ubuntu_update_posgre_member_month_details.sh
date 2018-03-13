#!/bin/sh

# =========================

echo '*************'
current_date_time_=`date "+%Y-%m-%d %H:%M:%S"`
echo 'current_date_time_ : ' $current_date_time_;
echo '*************'



# =========================


echo '-------------'
echo 'delete table...'
echo '-------------'


psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
DROP TABLE IF EXISTS ana.member_month_details_table;
EOF

# =========================


echo '-------------'
echo 'create table ...'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF

CREATE TABLE ana.member_month_details_table AS
  (WITH month_dates AS
     (SELECT MONTH
      FROM dates
      GROUP BY MONTH
      ORDER BY MONTH) ,
        current_month_details AS
     (SELECT concat(md.month, mem.member_id) AS id ,
             md.month ,
             mem.member_id ,
             mem.test_account_p ,
             mem.role ,
             mem.application_date ,
             mem.join_date ,
             mem.login ,
             mem.last_name ,
             mem.first_name ,
             mem.preferred_name ,
             mem.birth_date ,
             mem.join_promo ,
             mem.email_consent_p ,
             mem.gender_p ,
             mem.student_p ,
             mem.workflow_status AS current_workflow_status ,
             CASE
                 WHEN date_trunc('month', mem.join_date) = md.month THEN 1
                 ELSE 0
             END AS joins_in_month ,
             extract(MONTH
                     FROM age(md.month, date_trunc('month', mem.join_date))) AS tenure_months ,
             CASE
                 WHEN count(bo.booking_id) > 0 THEN 1
                 ELSE 0
             END AS is_active_in_month ,
             count(bo.booking_id) AS bookings_in_month ,
             min(bo.booking_end_date) AS first_booking_in_month ,
             max(bo.booking_end_date) AS last_booking_in_month ,

        (SELECT max(bo2.booking_end_date)
         FROM ana.bookings bo2
         WHERE bo2.member_id = mem.member_id
           AND bo2.booking_end_date < md.month
           AND bo2.trip_duration > 0) AS last_booking_before_month ,
             sum(bo.booking_duration) AS booking_duration ,
             sum(bo.reservation_duration) AS reservation_duration ,
             sum(bo.trip_duration) AS trip_duration ,
             sum(bo.distance) AS distance ,
             sum(bo.usage_revenue) AS gross_usage_revenue ,
             sum(bo.credit) AS credit_used ,
             sum(bo.uc_revenue) AS net_usage_revenue ,
             count(DISTINCT bo.start_zone_name) AS distinct_start_zones ,
             count(DISTINCT bo.end_zone_name) AS distinct_end_zones ,
             count(DISTINCT bo.start_zone_name || bo.end_zone_name) AS distinct_zone_combos
      FROM ana.members mem
      INNER JOIN month_dates md ON mem.join_date < (md.month + interval '1 month') 

      LEFT JOIN ana.bookings bo ON date_trunc('month', bo.booking_end_date) = md.month
      AND bo.member_id = mem.member_id
      AND bo.trip_duration > 0 -- limit the time here to speed up view updating
      GROUP BY concat(md.month, mem.member_id) ,
               md.month ,
               mem.member_id ,
               mem.test_account_p ,
               mem.role ,
               mem.application_date ,
               mem.join_date ,
               mem.login ,
               mem.last_name ,
               mem.first_name ,
               mem.preferred_name ,
               mem.birth_date ,
               mem.join_promo ,
               mem.email_consent_p ,
               mem.gender_p ,
               mem.student_p ,
               mem.workflow_status ,
               CASE
                   WHEN date_trunc('month', mem.join_date) = md.month THEN 1
                   ELSE 0
               END ,
               age(md.month, date_trunc('month', mem.join_date))) ,
        last_month_details AS
     (SELECT cmd.* ,
             extract(MONTH
                     FROM age(cmd.month, cmd.last_booking_before_month)) AS months_inactive_at_month_start ,
             CASE
                 WHEN cmd.joins_in_month = 1 THEN 0
                 ELSE 1
             END AS is_member_last_month ,
             lmd.is_active_in_month AS is_active_in_last_month ,
             lmd.bookings_in_month AS bookings_in_last_month ,
             lmd.gross_usage_revenue AS gross_usage_revenue_last_month ,
             lmd.credit_used AS credit_used_last_month ,
             lmd.net_usage_revenue AS net_usage_revenue_last_month ,
             extract(MONTH
                     FROM age(lmd.month, lmd.last_booking_before_month)) AS months_inactive_at_last_month_start
      FROM current_month_details cmd
      LEFT JOIN current_month_details lmd ON cmd.member_id = lmd.member_id
      AND (cmd.month - interval '1 month') = lmd.month) SELECT * ,
                                                               CASE
                                                                   WHEN joins_in_month = 1
                                                                        AND is_active_in_month = 1 THEN '6. active - joiner'
                                                                   WHEN joins_in_month = 1
                                                                        AND is_active_in_month = 0 THEN '4. inactive - joiner'
                                                                   WHEN is_active_in_month = 1
                                                                        AND is_active_in_last_month = 1 THEN '7. active - consistent'
                                                                   WHEN is_active_in_month = 1
                                                                        AND is_active_in_last_month = 0 THEN '5. active - reactivated'
                                                                   WHEN is_active_in_month = 0
                                                                        AND is_active_in_last_month = 1 THEN '3. inactive - lapsed'
                                                                   WHEN is_active_in_month = 0
                                                                        AND last_booking_before_month IS NULL THEN '1. inactive - never activated'
                                                                   WHEN is_active_in_month = 0
                                                                        AND is_active_in_last_month = 0 THEN '2. inactive - stagnant'
                                                                   ELSE NULL
                                                               END AS activity_segment
   FROM last_month_details);


EOF



# =========================

echo '-------------'
echo 'testing query...'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
SELECT COUNT(*) FROM ana.member_month_details_table   ;
EOF






