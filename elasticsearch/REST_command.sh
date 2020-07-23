# step 1) plz go to kibana UI  (port 5601)
# step 2) click "dev-op tool"
# step 3) run below command in the UI (these command can be run via CLI curl as well)

### Indside kibana UI ###

GET / 

GET /_cat/health?v

GET /_cat/master?v

PUT twitter/_doc/2
{
  "user": "GBaxewfewx",
  "uid": "1",
  "city": "LONDON"
}

PUT twitter/_create/10
{
  
}

POST twitter/_doc/
{
  "user": "xxx",
  "uid": "2",
  "city": "TOKYO"
}

GET twitter/_doc/WBk8e3MBpFYgZiusgXSc

GET twitter/_doc/WBk8e3MBpFYgZiusgXSc/_source

GET twitter/_doc/1?_souce=city

GET twitter/_doc/1


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
