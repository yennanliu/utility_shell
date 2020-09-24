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

# get
GET /9300 

GET /_cat/health?v

GET /_cat/master?v

# put
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

# create new datatype (for index)
PUT dev_index?include_type_name=true
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
