#!/bin/sh


function select_one()
{
psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
SELECT * FROM ana.members LIMIT 1;
EOF
}


function for_loop_select()
{

for x in ana.members\
         ana.membership_events\
         ana.member_month_details_table\
         ana.presales_signups\
         ana.member_lifetime\
         ana.member_month_details\
         prc.sdb_members_dev\
         prc.v_cc_individuals_brussels_table\
         prc.trips\
         prc.v_cc_member_first_res\
         prc.v_cc_member_last_res\
         prc.v_cc_members\
         prc.v_mm_customer_email\
         prc.v_mm_eligible_customers\
         prc.v_mm_eligible_customers_dev\
         prc.transactions\
         public.mm_fulfillment\
         public.temp_bru_mm_credits\
         rw.mm_successful_referrals\
         rw.user_address_lonlat\
         rw.user_address_nonnull_lonlat\
         rw.v_cc_members

do 
   echo 'table : ' $x

   psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
   SELECT * FROM $x LIMIT 1;
EOF

done 

}






for_loop_select
