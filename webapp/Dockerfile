FROM ruby:2.2.4-alpine
MAINTAINER Clemens Siebler <clemens.siebler@gmail.com>

RUN apk add --update make gcc libc-dev
RUN gem install rest_client sinatra shotgun haml elasticsearch

RUN mkdir /sinatra
COPY / /sinatra/

# Update ElasticSearch Target
ENV ELASTICSEARCH_HOST=<hostname/ip>:9200
EXPOSE 8081
ENTRYPOINT ["shotgun", "--host", "0.0.0.0", "--port", "8081", "/sinatra/webapp.rb"]
