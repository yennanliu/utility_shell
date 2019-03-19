

-- #################################################################
-- # REGULAR EXPRESSIONS SQL DEMO   
-- #################################################################

-- https://www.periscopedata.com/blog/getting-started-with-regular-expressions



-- 1) Comparison

-- 2) OR Operator

SELECT REGEXP_SUBSTR('123', '1(1|2)3'), REGEXP_SUBSTR('123', '1(1)3'), REGEXP_SUBSTR('123', '1(2)3'), '123';

-- 2) Repetition
SELECT REGEXP_SUBSTR('ccccc', 'c{4}'), 'cccc';  


