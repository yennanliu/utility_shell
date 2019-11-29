#!/bin/sh
####################################################################
# SCRIPT FOR LOOP BUILD TABLES IN REDSHIFT WITH PARAM 
####################################################################

base_for_loop() {
    base_sql="select * from table_"
    for i in 1 2 3 4 5
        do
            #echo "select * from $i"
            echo "${base_sql}"$i 
        done 
}

multiline_sql_for_loop() {
    base_sql="""
        WITH filtered_vm AS
          (SELECT sales_date,
                  branch_number,
                  customer_number,
                  equipment_code,
                  count(DISTINCT product_code)::numeric/max(column_no)::numeric AS item_ratio
           FROM table
           GROUP BY 1,
                    2,
                    3,
                    4
        HAVING item_ratio > 0.5)"""
    for i in 1 2 3 4 5
        do
            SQL=$(echo $base_sql | sed -e "s/\table/table_$i/g")
            echo $SQL
        done 
}

#base_for_loop
multiline_sql_for_loop