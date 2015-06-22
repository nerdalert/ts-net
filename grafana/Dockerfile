FROM debian:latest
MAINTAINER Brent Salisbury <brent.salisbury@gmail.com>

RUN apt-get update \
    && apt-get -y install \
    libfontconfig \
    adduser \
    openssl \
    ca-certificates \
    curl \
    && apt-get clean

RUN curl http://grafanarel.s3.amazonaws.com/builds/grafana_latest_amd64.deb \
    -o grafana_latest_amd64.deb \
    && dpkg -i grafana_latest_amd64.deb  \
    && rm grafana_latest_amd64.deb

# The docker-compose volume mount will persist your grafana.db config in ./data
VOLUME ["/var/lib/grafana", "/var/log/grafana"]
ADD dashboards /var/lib/grafana/dashboards

EXPOSE 3000
ADD conf/init-grafana.sh /opt/conf/init-grafana.sh
ADD conf/grafana.ini /opt/conf/grafana.ini
WORKDIR /usr/share/grafana
# Start the grafana process
ENTRYPOINT ["/usr/sbin/grafana-server", "--config", "/opt/conf/grafana.ini"]