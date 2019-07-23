SELECT @accum,
       @prev,
       @x,
       @x + 1,
       (@x + 1)*(@x - 1)
FROM    
       (SELECT @accum := 0, 
               @prev := -1,
               @x := 123 ) init 
