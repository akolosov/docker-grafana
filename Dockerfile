FROM akolosov/nginx

ENV GRAFANA_VERSION 1.9.1

RUN rm -f /app/*
RUN rm -f /etc/nginx/sites-enabled/default
RUN apt-get update
RUN apt-get install -y wget pwgen apache2-utils
RUN wget http://grafanarel.s3.amazonaws.com/grafana-${GRAFANA_VERSION}.tar.gz -O grafana.tar.gz
RUN tar zxf grafana.tar.gz
RUN rm grafana.tar.gz
RUN mv grafana-${GRAFANA_VERSION} app
RUN apt-get autoremove -y wget
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

ADD config.js /app/config.js
ADD default /etc/nginx/sites-enabled/default

# Environment variables for HTTP AUTH
ENV HTTP_USER admin
ENV HTTP_PASS **Random**

ENV INFLUXDB_PROTO http
ENV INFLUXDB_HOST **ChangeMe**
ENV INFLUXDB_PORT 8086
ENV INFLUXDB_NAME **ChangeMe**
ENV INFLUXDB_USER root
ENV INFLUXDB_PASS root
ENV INFLUXDB_IS_GRAFANADB true

ADD run.sh /run.sh
ADD set_influx_db.sh /set_influx_db.sh
ADD set_basic_auth.sh /set_basic_auth.sh
RUN chmod +x /*.sh

CMD ["/run.sh"]
