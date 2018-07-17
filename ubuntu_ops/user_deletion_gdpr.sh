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



function for_loop_delete()
{

for x in ana.members_dev 

do 
   echo 'table : ' $x

   psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF

   UPDATE $x 
   SET login = 'Forgotten_Value',  
       last_name = 'Forgotten_Value', 
       first_name = 'Forgotten_Value',
       middle_name = 'Forgotten_Value', 
       preferred_name = 'Forgotten_Value', 
       driving_license = 'Forgotten_Value', 
       driving_license_country = 'Forgotten_Value', 
       driving_license_province = 'Forgotten_Value',      
       address_1 = 'Forgotten_Value', 
       address_2 = 'Forgotten_Value', 
       city = 'Forgotten_Value', 
       zipcode = 'Forgotten_Value',  
       province = 'Forgotten_Value', 
       country = 'Forgotten_Value',             
       billing_address_1 = 'Forgotten_Value', 
       billing_address_2 = 'Forgotten_Value', 
       billing_city = 'Forgotten_Value', 
       billing_zipcode = 'Forgotten_Value', 
       billing_province = 'Forgotten_Value', 
       billing_country = 'Forgotten_Value', 
       phone_number = 'Forgotten_Value',
       school = 'Forgotten_Value', 
       credit_card = 'Forgotten_Value',
       credit_card_name = 'Forgotten_Value'


    WHERE member_id = 'C000000005'
EOF

done 

}


#for_loop_select
for_loop_delete





