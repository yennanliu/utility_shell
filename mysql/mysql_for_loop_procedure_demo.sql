-- https://stackoverflow.com/questions/5125096/for-loop-example-in-mysql
-- execute the mysql procedure :
-- mysql> call for_loop_example();
-- +-------------------+
-- | str               |
-- +-------------------+
-- | -5,-4,-3,-2,-1,0, |
-- +-------------------+
-- 1 row in set (0.00 sec)

delimiter //

CREATE procedure yourdatabase.for_loop_example()
wholeblock:BEGIN
  DECLARE x INT;
  DECLARE str VARCHAR(255);
  SET x = -5;
  SET str = '';

  loop_label: LOOP
    IF x > 0 THEN
      LEAVE loop_label;
    END IF;
    SET str = CONCAT(str,x,',');
    SET x = x + 1;
    ITERATE loop_label;
  END LOOP;

  SELECT str;

END//