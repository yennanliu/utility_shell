
/*


select distinct only on 1  column 
http://www.postgresqltutorial.com/postgresql-select-distinct/


*/ 


/*  example 

SELECT 
DISTINCT ON  
(ticket_id) ticket_id,*
FROM all_ 
INNER JOIN rw.price_task_scheme price_task ON price_task.code = all_.code
where closed_date is not null
ORDER BY 1

*/ 


SELECT
 DISTINCT ON
 (bcolor) bcolor,
 fcolor
FROM
 t1
ORDER BY
 bcolor,
 fcolor;


 