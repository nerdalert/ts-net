FROM debian:latest
MAINTAINER Brent Salisbury <brent.salisbury@gmail.com>

RUN apt-get update -qq \
    && apt-get install -y curl \
    && apt-get clean

# This is creates the initial DB in InfluxDB
# at runtime using the Influx API in init.sh
ADD ./init.sh /init.sh
RUN chmod +x /init.sh
ENTRYPOINT ["/init.sh"]