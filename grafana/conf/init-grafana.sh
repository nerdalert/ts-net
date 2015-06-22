#!/bin/bash


#INFLUXDB_PORT_8086_TCP_ADDR=127.0.0.1
#GRAFANA_PORT_3000_TCP_PORT=3000

GRAFANA_HOST=grafana:${GRAFANA_PORT_3000_TCP_PORT}


#/usr/sbin/grafana-server --config /opt/conf/grafana.ini \
sleep 3
 echo "Creating Graphite Database..."
curl -X POST "$GRAFANA_HOST/login" -c cookies.txt \
    -H 'Content-Type: application/json;charset=UTF-8' \
     --data-binary '
     {
         "user": "admin",
         "email": "",
         "password": "admin"
     }'
curl -X POST "$GRAFANA_HOST/api/datasources" \
    -X POST -b cookies.txt  \
    -H 'Content-Type: application/json;charset=UTF-8' \
    --data-binary '
    {
        "name": "graphite",
        "type": "influxdb",
        "isDefault": true,
        "url": "http://influxdb:8086",
        "access": "proxy",
        "database": "graphite",
        "user": "graphite",
        "password": "graphite"
    }'
