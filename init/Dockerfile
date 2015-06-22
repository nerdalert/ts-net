FROM debian:latest
MAINTAINER Brent Salisbury <brent.salisbury@gmail.com>

RUN apt-get update
RUN apt-get install -y curl

# This is creates the initial DB in InfluxDB
# at runtime using the Influx API in init.sh
ADD ./init.sh /init.sh
RUN chmod +x /init.sh
ENTRYPOINT ["/init.sh"]