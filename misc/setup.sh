#!/bin/sh
# Run as root and cd into misc dir before running!

# Update and install docker stuff
apt-get -y update
apt-get -y install docker.io
curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Build webapp image
cd ../webapp
docker build -t webapp .

# Copies opt to /opt to pre-configure grafana dashboards.
cd ../misc
cp -r ./opt/* /opt/
mkdir /opt/elasticsearch/conf/scripts

echo "Run docker using"
echo "Interatively: docker-compose up"
echo "Daemon: docker-compose up -d"
