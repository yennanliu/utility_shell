

-- #################################################################
-- # REGULAR EXPRESSIONS SQL DEMO   
-- #################################################################

-- https://www.periscopedata.com/blog/getting-started-with-regular-expressions
-- https://www.regular-expressions.info/quickstart.html

-- 1) Comparison

-- 2) OR Operator
--  For example, if we wanted to match 111 or 121, the pattern 1(1|2)1 would match that.
SELECT REGEXP_SUBSTR('123', '1(1|2)3'), REGEXP_SUBSTR('123', '1(1)3'), REGEXP_SUBSTR('123', '1(2)3'), '123';

-- 2) Repetition

-- 2-1) ? matches zero or one occurrences
SELECT REGEXP_SUBSTR('ababac', '[ab]?') , 'ababac';

-- 2-2) + matches one or more
SELECT REGEXP_SUBSTR('ababac', '[ab]+') , REGEXP_SUBSTR('ababac', '[a]+'),  'ababac';

-- 2-2) {n} matches exactly n occurrences of the preceding pattern
SELECT REGEXP_SUBSTR('ccccc', 'c{4}'), 'cccc';  


-- 3) Position Operators
-- 3-1)  ^ matches the beginning of a string. E.g. ^a matches a as the first letter of a string.
SELECT REGEXP_SUBSTR('ABC', '^A'), REGEXP_SUBSTR('ABC', '^AB'), REGEXP_SUBSTR('ABC', '^ABC'), REGEXP_SUBSTR('ABC', '^A[A-Z][A-Z]'), REGEXP_SUBSTR('ABC', '[A]..'), 'ABC';


-- 3-2) $ matches the end of a string.
SELECT REGEXP_SUBSTR('ABC', '[AB]C$'), REGEXP_SUBSTR('ABC', 'C$'), REGEXP_SUBSTR('ABC', '..C$'), 'ABC'; 


-- 4) Other Operators

-- 4-1) . matches any character
SELECT REGEXP_SUBSTR('ABC', '.'), REGEXP_SUBSTR('ABC', '..'), REGEXP_SUBSTR('ABC', '.*'), 'ABC';

-- 4-2) [ ] Square parentheses match any single character contained in the parentheses and can contain ranges. E.g. [a-z] matches any lowercase letter.
SELECT REGEXP_SUBSTR('ABC', '[A-Z]'), REGEXP_SUBSTR('ABC', '[A-Z][A-Z]'), REGEXP_SUBSTR('ABC', '[A-Z][A-Z][A-Z]'), 'ABC'; 

-- 4-3 [^ ] matches any character not contained in the set. E.g. [^123] matches any character that is not 1, 2 or 3.
SELECT REGEXP_SUBSTR('123', '[^123]'), REGEXP_SUBSTR('123', '[^45][^45][^45]'),  '123';






