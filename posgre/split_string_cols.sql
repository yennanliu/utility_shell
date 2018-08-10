

# split string into multiple columns with substring 
# ref 
# https://www.postgresql.org/message-id/50EB2E3E.2020406@encs.concordia.ca



# e.g. 1 
select regexp_split_to_table('hello world', E'\\s+');
# output :
#1 hello
#2 world


# e.g. 2 
SELECT unnest(string_to_array('a\b\c', '\'));
# 1 a
# 2 b
# 3 c 