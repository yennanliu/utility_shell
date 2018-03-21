

-- Posgre UDF 
-- https://www.tutorialspoint.com/postgresql/postgresql_functions.htm

CREATE OR REPLACE FUNCTION upsert_tableName() RETURNS VOID AS $$ 
    DECLARE 
    BEGIN 
        UPDATE rw.vehiclelogfix_dev SET category = 'Return to Service' WHERE category = 'Out of Service' and category_shifted = 'Create booking'; 
        IF FOUND THEN 
        INSERT INTO rw.vehiclelogfix_dev  (category) values ('Return to Service'); 
        END IF; 
    END; 
    $$ LANGUAGE 'plpgsql'; 



 -- execute UDF 

select upsert_tableName(); 
