#!/bin/sh

# =========================

echo '*************'
current_date_time_=`date "+%Y-%m-%d %H:%M:%S"`
echo 'current_date_time_ : ' $current_date_time_;
echo '*************'



echo '-------------'
echo 'cerate view...'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
CREATE OR REPLACE VIEW prc.v_cc_individuals_brussels AS

WITH waivers AS (
         SELECT DISTINCT bpr.customer_id AS member_id,
            TRUE::bool AS has_had_any_per_trip_waiver
           FROM billed_products_raw bpr
          WHERE bpr.billing_product::text = 'FEES.PER_TRIP_WAIVER'::text AND bpr.net > 0::double precision
        ), credits AS (
         SELECT customer_credit.account_id AS member_id,
            round(cast(sum(customer_credit.available_amount) as numeric),2) AS current_credit,
            min(customer_credit.end_date_utc) AS next_credit_expiry_date
           FROM rw.customer_credit
          WHERE customer_credit.end_date_utc > now() AND customer_credit.available_amount > 0::double precision
          GROUP BY customer_credit.account_id
        ), bookings AS (
         SELECT DISTINCT first_value(bo.member_id) OVER (PARTITION BY bo.member_id ORDER BY bo.booking_end_date ASC) AS member_id,
            first_value(bo.booking_end_date) OVER (PARTITION BY bo.member_id ORDER BY bo.booking_end_date ASC) AS first_res_end_date,
            first_value(initcap("left"(v.name::text, "position"(v.name::text, ' '::text) - 1))) OVER (PARTITION BY bo.member_id ORDER BY bo.booking_end_date ASC) AS first_res_vehicle_name,
            first_value(bo.start_zone_name) OVER (PARTITION BY bo.member_id ORDER BY bo.booking_end_date) AS first_res_start_zone,
            first_value(bo.booking_end_date) OVER (PARTITION BY bo.member_id ORDER BY bo.booking_end_date DESC) AS last_res_end_date,
            first_value(initcap("left"(v.name::text, "position"(v.name::text, ' '::text) - 1))) OVER (PARTITION BY bo.member_id ORDER BY bo.booking_end_date DESC) AS last_res_vehicle_name,
            first_value(bo.start_zone_name) OVER (PARTITION BY bo.member_id ORDER BY bo.booking_end_date DESC) AS last_res_start_zone
           FROM ana.bookings bo
             LEFT JOIN ana.vehicles v ON v.vin::text = bo.vin::text
          WHERE bo.trip_duration > 0::double precision AND bo.booking_start_date < now()
        )
 SELECT DISTINCT mem.member_id ||'_zipcar' as subscriber_key,
    mem.member_id as member_id_zc,
    initcap(mem.first_name::text) AS first_name_zc,
    initcap(mem.last_name::text) AS last_name_zc,
    ml.language,
    date_trunc('month'::text, mem.birth_date::timestamp) AS birth_month_year,
        CASE
            WHEN (mem.birth_date + (((date_part('year'::text, 'now'::text::date)::integer - date_part('year'::text, mem.birth_date)::integer) || ' years'::text)::interval)) >= 'now'::text::date AND (mem.birth_date + (((date_part('year'::text, 'now'::text::date)::integer - date_part('year'::text, mem.birth_date)::integer) || ' years'::text)::interval)) <= ('now'::text::date + 7) THEN TRUE::bool
            ELSE FALSE::bool
        END AS has_birthday_this_week,
    trim(mem.email) AS email_address_zc,
        CASE
            WHEN mem.email IS NULL THEN NULL::text
            ELSE lower("left"("substring"(mem.email::text, "position"(mem.email::text, '@'::text) + 1), "position"("substring"(mem.email::text, "position"(mem.email::text, '@'::text) + 1), '.'::text) - 1))
        END AS email_address_domain,
    case when mem.email_consent_p = 't' then TRUE::bool
        when mem.email_consent_p = 'f' then FALSE::bool
        end AS is_emailable,
        CASE
            WHEN mem.role::text = ANY(ARRAY['customer'::text, 'staff'::text, 'admin'::text]) AND mem.workflow_status::text = 'Approved'::text THEN TRUE::bool
            ELSE FALSE::bool
        END AS is_current_approved_member,
        CASE
            WHEN (mem.role::text = ANY (ARRAY['staff'::text, 'admin'::text])) AND mem.workflow_status::text = 'Approved'::text THEN TRUE::bool
            ELSE FALSE::bool
        END AS is_employee,
        CASE
            WHEN mem.role::text = 'customer'::text AND (mem.workflow_status::text = ANY (ARRAY['Pending'::text, 'In review'::text])) THEN TRUE::bool
            ELSE FALSE::bool
        END AS is_prospect,
    mem.role,
        CASE
            WHEN z4b.account_id IS NOT NULL THEN TRUE::bool
            ELSE FALSE::bool
        END AS has_segment_business,
    'Belgium'::text AS fleet_country_name,
    mem.workflow_status AS current_status,
    mem.application_date,
    mem.join_date AS first_join_date,
    mem.join_promo AS join_promo_code,
        CASE
            WHEN mem.driving_license IS NULL THEN FALSE::bool
            ELSE TRUE::bool
        END AS has_driving_license,
        CASE
            WHEN mem.credit_card IS NOT NULL AND mem.credit_card_expiry > now() THEN TRUE::bool
            ELSE FALSE::bool
        END AS has_valid_credit_card,
    boo.first_res_end_date,
    boo.first_res_vehicle_name,
    boo.first_res_start_zone,
    boo.last_res_end_date,
    boo.last_res_vehicle_name,
    boo.last_res_start_zone,
    COALESCE(w.has_had_any_per_trip_waiver, FALSE::bool) AS has_had_any_per_trip_waiver,
    COALESCE(c.current_credit, 0::double precision) AS current_credit,
    c.next_credit_expiry_date
   FROM ana.members mem
     LEFT JOIN ana.member_language ml ON ml.member_id::text = mem.member_id::text
     LEFT JOIN waivers w ON w.member_id::text = mem.member_id::text
     LEFT JOIN credits c ON c.member_id::text = mem.member_id::text
     LEFT JOIN ana.z4b_members z4b ON z4b.member_id::text = mem.member_id::text
     LEFT JOIN bookings boo ON mem.member_id::text = boo.member_id::text
  WHERE mem.test_account_p = 'f'::text ; 
EOF







# =========================


echo '-------------'
echo 'delete table...'
echo '-------------'


psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
DROP TABLE IF EXISTS prc.v_cc_individuals_brussels_table;
EOF




# =========================


echo '-------------'
echo 'create table...'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
CREATE TABLE IF NOT EXISTS prc.v_cc_individuals_brussels_table 
AS SELECT * FROM prc.v_cc_individuals_brussels;
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
SELECT COUNT(*) FROM prc.v_cc_individuals_brussels_table ;
EOF



# =========================

echo '-------------'
echo 'delete the view ...'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
DROP VIEW prc.v_cc_individuals_brussels ;
EOF





