-- https://stackoverflow.com/questions/14356694/mysql-function-call
-- mysql> CALL simpleproc(@a);
-- Query OK, 0 rows affected (0.00 sec)


delimiter //

CREATE PROCEDURE count_func3 (OUT param1 INT)
BEGIN
  SELECT COUNT(*) INTO param1 FROM Employee;
END//
