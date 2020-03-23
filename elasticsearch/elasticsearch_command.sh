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