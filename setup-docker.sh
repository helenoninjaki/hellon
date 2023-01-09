
#!/bin/bash

# build the flask container
docker build -t helenoninjaki/hellon .

# create the network
docker network create hellon

# start the ES container
docker run -d --name es --net hellon -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.3.2

# start the flask app container
docker run -d --net hellon -p 0000:5000 --name hellon helenoninjaki/hellon