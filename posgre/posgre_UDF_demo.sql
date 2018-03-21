/*


-- Posgre UDF 
-- https://www.tutorialspoint.com/postgresql/postgresql_functions.htm

-- PL/pgSQL turtorial 
-- https://w3resource.com/PostgreSQL/pl-pgsql-declarations.php
-- http://www.imada.sdu.dk/~jamik/db2-12/material/39-PL-pgSQL.pdf


-- Posgre cursor 
-- http://www.postgresqltutorial.com/plpgsql-cursor/







-- for loop example 
https://dba.stackexchange.com/questions/89643/return-the-id-after-insert-or-select

###

CREATE OR REPLACE FUNCTION f_email_insel(_email text, OUT email_id int) AS
$func$
BEGIN

LOOP
   BEGIN  -- start inner block inside loop to handle possible exception

   SELECT INTO email_id  m.email_id FROM mailing_list m WHERE m.email = _email;

   IF NOT FOUND THEN
      INSERT INTO mailing_list (email) VALUES (_email)
      RETURNING mailing_list.email_id INTO email_id;
   END IF;

   EXCEPTION WHEN UNIQUE_VIOLATION THEN     -- inserted in concurrent session.
      RAISE NOTICE 'It actually happened!'; -- hardly ever happens
   END;

   EXIT WHEN email_id IS NOT NULL;          -- else keep looping
END LOOP;

END
$func$ LANGUAGE plpgsql;

### 

*/
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





