FROM debian:latest
MAINTAINER Brent Salisbury <brent.salisbury@gmail.com>

RUN apt-get update -qq \
    && apt-get install -y curl \
    && apt-get clean

# Install Influxdb
RUN curl -o influxdb_latest_amd64.deb http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb \
    && dpkg -i influxdb_latest_amd64.deb

# EXPOSE PORT GRAPHITE, ADMIN, API
EXPOSE 2003 8083 8086 8125/udp

# Mount points
ADD conf /opt/influxdb/conf
VOLUME ["/opt/influxdb/conf/", "/opt/influxdb/shared/", "/var/log/influxdb"]
CMD ["/opt/influxdb/influxd", "-config", "/opt/influxdb/conf/influxdb.toml"]

