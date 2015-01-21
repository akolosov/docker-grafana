#!/bin/bash

set -e

INFLUXDB_PASS=${INFLUXDB_ENV_INFLUXDB_INIT_PWD:-${INFLUXDB_PASS}}
INFLUXDB_PASS=${INFLUXDB_1_ENV_INFLUXDB_INIT_PWD:-${INFLUXDB_PASS}}

if [ "${HTTP_PASS}" == "**Random**" ]; then
    unset HTTP_PASS
fi

if [ ! -f /.basic_auth_configured ]; then
    /set_basic_auth.sh
fi

if [ ! -f /.influx_db_configured ]; then
    /set_influx_db.sh
fi

echo "=> Starting and running Nginx..."
/usr/sbin/nginx
