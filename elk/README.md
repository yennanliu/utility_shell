## ELK Doc

### Run ES
```bash
export ES_HOME=/usr/local/bin/elasticsearch
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH

# RUN elasticsearch
cd elasticsearch-7.6.1
bin/elasticsearch
```

### Run Kibana
```bash
cd kibana-6.8.7-darwin-x86_64
./bin/kibana 
```

### Run Logstach
```bash
cd logstash-7.6.1
bin/logstash -f logstash.conf
```

### Port
- ES
	- 9300 : TCP, for ES nodes communication
	- 9200 : HTTP, recommended for client API
	- https://youtu.be/EIymTNQn8XE?t=72