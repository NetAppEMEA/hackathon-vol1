FROM ruby:alpine
MAINTAINER Clemens Siebler <clemens.siebler@gmail.com>

RUN gem install sinatra shotgun unirest haml elasticsearch

RUN mkdir /sinatra
COPY / /sinatra/

EXPOSE 8081
ENTRYPOINT ["shotgun", "--host", "0.0.0.0", "--port", "8081", "/sinatra/webapp.rb"]
