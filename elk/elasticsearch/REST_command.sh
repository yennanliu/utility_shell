#-------------------------------
# ES REST command
#-------------------------------

# step 1) plz go to kibana UI  (port 5601)
# step 2) click "dev-op tool"
# step 3) run below command in the UI (these command can be run via CLI curl as well)

### Indside kibana UI ###

# REST COMMAND 
# 1. GET
# 2. PUT
# 3. POST
# 4. DELETE
# 5. PATCH

#-------------------------------
# basic command
#-------------------------------

# GET
GET /9300 

# check health
GET /_cat/health?v

# get master node info
GET /_cat/master?v

# get all indices
GET /_cat/indices


# PUT

# add new index (POST is OK as well)
# PUT needs id; for POST it's optional
# syntax : PUT <index_name>/<table_name>/<data_id>
# ES index ~= mysql DB, table ~= mysql table
# if index, table already existed, will become update op
# https://youtu.be/hKBxfpmTclw?t=207
PUT twitter/_doc/2
{
  "user": "GBaxewfewx",
  "uid": "1",
  "city": "LONDON"
}

PUT twitter/_create/10
{
  
}

GET twitter/_doc/WBk8e3MBpFYgZiusgXSc

GET twitter/_doc/WBk8e3MBpFYgZiusgXSc/_source

GET twitter/_doc/1?_source=city,user

GET twitter/_doc/1


POST twitter/_doc/
{
  "user": "xxx",
  "uid": "2",
  "city": "TOKYO"
}

GET twitter

GET _cat/indices?v

GET _cat/nodes?v

PUT myindex2/_doc/1
{
  "name" : "es",
  "usee" : "abc",
  "age"  : 123
}

GET myindex2

GET _search
{
  "query": {
    "match_all": {}
  }
}

# update
POST twitter/_update/1
{
  "doc":{
    "city": "taipei",
    "user" :"taiwan"
  }
}


#-------------------------------
# create datatype (for index)
#-------------------------------
# create dtype 
PUT dev_index2?include_type_name=true
{
   "mappings": {
     "student": { 
       "properties": { 
         "name":     { "type": "keyword"  },
         "age":      { "type": "integer" }  
         }
     }
   }
 }
 
# insert data (id = 3) 
PUT dev_index2/_doc/3
{
  "name" : "es",
  "age"  : 123
}

# query all data from with the index name
GET dev_index2/_search?pretty