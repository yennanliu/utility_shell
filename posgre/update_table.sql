

# credit 
# https://www.withdata.com/blog/postgresql/replace-update-or-insert-a-row-into-postgresql-table.html

/*

example 1 : 


UPDATE table SET field='C', field2='Z' WHERE id=3;
INSERT INTO table (id, field, field2)
       SELECT 3, 'C', 'Z'
       WHERE NOT EXISTS (SELECT 1 FROM table WHERE id=3);


example 2 :

WITH new_values (id, field1, field2) as (
  values
     (1, 'A', 'X'),
     (2, 'B', 'Y'),
     (3, 'C', 'Z')

),
upsert as
(
    update mytable m
        set field1 = nv.field1,
            field2 = nv.field2
    FROM new_values nv
    WHERE m.id = nv.id
    RETURNING m.*
)
INSERT INTO mytable (id, field1, field2)
SELECT id, field1, field2
FROM new_values
WHERE NOT EXISTS (SELECT 1
                  FROM upsert up
                  WHERE up.id = new_values.id)

*/


#==================================




# step 1 :
# dump all old data from prc.vehicle_day (view) -> prc.vehicle_day (table)


CREATE TABLE prc.vehicle_days_dev AS
SELECT *
FROM prc.vehicle_days



# step 2 :
# delete yesterday -> today's data at prc.vehicle_day (table) 

DELETE
FROM prc.vehicle_days_dev
WHERE date(date) >= date((now() - interval '1 day'))
  AND date(date) <= date(now())


# step 3:
# select yesterday -> today's date at prc.vehicle_day (view) and insert them to prc.vehicle_day (table) 


INSERT INTO prc.vehicle_days_dev
  ( SELECT *
   FROM prc.vehicle_days
   WHERE date(date) >= date((now() - interval '1 day'))
     AND date(date) <= date(now()) );

 



















