#!/bin/sh

# 1) Create index 
#curl -XPUT "http://localhost:9200/IndexName/TypeName"
curl -XPUT "http://localhost:9200/logstash"

# 2) Query elasticsearch
# https://stackoverflow.com/questions/42993351/how-to-query-elasticsearch-when-it-is-used-as-an-output-plugin-in-logstash
# query index = logstash 
curl http://localhost:9200/logstash

# 3) Delete index 
# https://stackoverflow.com/questions/22924300/removing-data-from-elasticsearch
# (delete index with logstash-* pattern )
curl -XDELETE localhost:9200/logstash-*

# 4) list all index
curl http://localhost:9200/_cat/indices

# 5) list all command 
curl http://localhost:9200/_cat

# 6) insert data (via XPUT)
# index = library, type = book, id = 1
curl -XPUT 'http://localhost:9200/library/book/1?pretty' -H 'Content-Type: application/json' -d '
{
"author" : "jim",
"title" : "pig"	
}'

# 6)' insert data (via XPOST) (no need to set up id)
# index = library, type = booK
curl -XPOST 'http://localhost:9200/library/book?pretty' -H 'Content-Type: application/json' -d '
{
"author" : "JK ROLLING",
"title" : "potter",
"page" : 777
}'

# 7) query data (with index name and id)
curl -XGET 'http://localhost:9200/library/book/1?pretty'
curl -XGET 'http://localhost:9200/library/book/6SUWhXQBjtaA1DFIuiYb?pretty'
