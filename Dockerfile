FROM docker.elastic.co/elasticsearch/elasticsearch:8.11.1

USER root

RUN apt-get upgrade && \
    apt-get update && \
    apt-get install -y vim

COPY configs/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

USER elasticsearch