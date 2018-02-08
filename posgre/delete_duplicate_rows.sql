-- credit http://www.postgresqltutorial.com/how-to-delete-duplicate-rows-in-postgresql/
-- example 
/*
DELETE
FROM
    members a
        USING members b
WHERE
    a.last_event_id < b.last_event_id
    AND a.member_id = b.member_id;

*/



DELETE
FROM
    basket a
        USING basket b
WHERE
    a.id < b.id
    AND a.fruit = b.fruit;

    
