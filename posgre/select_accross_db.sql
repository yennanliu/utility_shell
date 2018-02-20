-- ref 
-- https://stackoverflow.com/questions/46324/possible-to-perform-cross-database-queries-with-postgres



SELECT * 
FROM   table1 tb1 
LEFT   JOIN (
   SELECT *
   FROM   dblink('dbname=db2','SELECT id, code FROM table2')
   AS     tb2(id int, code text);
) AS tb2 ON tb2.column = tb1.column;
