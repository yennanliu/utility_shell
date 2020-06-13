-- credit http://www.postgresqltutorial.com/how-to-delete-duplicate-rows-in-postgresql/

/* 
-- example  1 

DELETE
FROM
    members a
        USING members b
WHERE
    a.last_event_id < b.last_event_id
    AND a.member_id = b.member_id;


--- example  2 


SELECT member_id,
       event_date,
       event,
       count(*)
FROM ana.membership_events
GROUP BY 1,
         2,
         3
ORDER BY event_date DESC

---


SELECT member_id,
       application_date,
       count(*)
FROM ana.members
GROUP BY 1,
         2
ORDER BY application_date DESC


---

DELETE
FROM ana.membership_events a USING ana.membership_events b
WHERE a.event_id < b.event_id
  AND a.member_id = b.member_id
  AND a.event_date = b.event_date
  AND a.event = b.event


---

*/


DELETE
FROM
    basket a
        USING basket b
WHERE
    a.id < b.id
    AND a.fruit = b.fruit;
