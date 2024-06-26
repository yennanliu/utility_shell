#!/bin/sh
# for elasticsearch-7.9.1

# 1) Create index 
#curl -XPUT "http://localhost:9200/IndexName/TypeName"
curl -XPUT "http://localhost:9200/logstash"

# 1)' check if index exists
curl -XHEAD -i "http://localhost:9200/logstash"

# 1)' get index detail inform.
curl -XGET -i "http://localhost:9200/logstash?pretty"

# 2) Query elasticsearch
# https://stackoverflow.com/questions/42993351/how-to-query-elasticsearch-when-it-is-used-as-an-output-plugin-in-logstash
# query index = logstash 
curl http://localhost:9200/logstash

# 3) Delete index 
# https://stackoverflow.com/questions/22924300/removing-data-from-elasticsearch
curl -XDELETE localhost:9200/logstash-* # (delete index with logstash-* pattern )
curl -XDELETE localhost:9200/logstash # (delete index with logstash pattern )

# 4) list all index
curl http://localhost:9200/_cat/indices

# 4) *** List all data under index ***
# https://stackoverflow.com/questions/17497075/efficient-way-to-retrieve-all-ids-in-elasticsearch
curl -XGET 'http://localhost:9200/library/_search?pretty'  # index = library
curl -XGET 'http://localhost:9200/my_index/_search?pretty' # index = my_index

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
# index = library, type = book
curl -XPOST 'http://localhost:9200/library/book?pretty' -H 'Content-Type: application/json' -d '
{
"author" : "JK ROLLING",
"title" : "potter",
"page" : 777
}'

# 7) query data (with book, index name and id)
curl -XGET 'http://localhost:9200/library/book/1?pretty' # type = book, id = 1 
curl -XGET 'http://localhost:9200/library/book/6SUWhXQBjtaA1DFIuiYb?pretty' # type = book, id = 6SUWhXQBjtaA1DFIuiYb
curl -XGET 'http://localhost:9200/library/_all/1?pretty' # id = 1 but in all type (_all)

# 8) delete data
curl -XDELETE 'http://localhost:9200/library/book/1?pretty' # type = book, id = 1 

# 9) clean cache (index)
curl -XPOST 'http://localhost:9200/library/_cache/clear'

# 9) refresh cache (index)
curl -XPOST 'http://localhost:9200/library/_refresh'

# 10) bulk insert
# https://stackoverflow.com/questions/45601344/elasticsearch-bulk-json-data
# https://youtu.be/ryKQGqx67jg?t=591
# curl -XPOST localhost:9200/your_index/your_type/_bulk -H "Content-Type: application/x-ndjson" --data-binary @bulk.json
curl -XPOST localhost:9200/myindex1/data/_bulk -H "Content-Type: application/x-ndjson" --data-binary data/accounts.json

curl -XPOST localhost:9200/myindex1/data/_bulk?pretty --data-binary data/accounts.json -H 'Content-Type: application/json'

