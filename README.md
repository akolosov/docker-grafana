docker-grafana
==============

Grafana dashboard for Influx DB


Usage
-----
To create the image `akolosov/grafana`, execute the following command on the akolosov-docker-grafana folder:

    docker build -t akolosov/grafana .

To run the image and bind the port:

    docker run -d -p 80:80 akolosov/grafana
    
The first time that you run your container, a new user `admin` will be created for HTTP basic auth with a random password. To get the password, check the logs of the container by running:

    docker logs <CONTAINER_ID>

You will see an output like the following:
```
 ========================================================================
 You can now connect to Grafana with the following credential:
 
     admin:ilNfrVn68r1N

 ========================================================================
```
In this case, `ilNfrVn68r1N` is the password allocated to the `admin` user.

You can now login you to Grafana in your browser: `http://127.0.0.1/`


Setting a specific password for Basic HTTP Authentication
---------------------------------------------------------

You can specify username and password for HTTP Basic Auth of `akolosov/grafana`:

```
HTTP_USER=admin                 Username for HTTP auth, using admin by default
HTTP_PASS=**Random**        Password for HTTP auth. Change it, otherwise system will generate a random password.
```

If you want to user a preset password instead of a random generated one, you can set the environment variable `HTTP_PASS` to you specific password when running the container:

    docker run -d -p 80:80 -e HTTP_USER=admin -e HTTP_PASS=mypass akolosov/grafana

You can now test it: `http://127.0.0.1/`


Configure the connection to InfluxDB
------------------------------------

`akolosov/grafana` needs to know the information of your InfluxDB for configuration. Please provide the following environment variables when running your Grafana container:
```
INFLUXDB_PROTO=http                 Protocol of your InfluxDB
INFLUXDB_HOST=**ChangeMe**          Host of your InfluxDB (without protocol)
INFLUXDB_PORT=8086                  Port number of your InfluxDB
INFLUXDB_NAME=**ChangeMe**          Database name of your InfluxDB
INFLUXDB_USER=root                  Username of your InfluxDB
INFLUXDB_PASS=root                  Password of your InfluxDB
```

Here is an example:

    docker run -d -p 80:80 -e INFLUXDB_HOST=influxdb-1-tifayuki.delta.akolosov.io -e INFLUXDB_PORT=8086 -e INFLUXDB_NAME=testdb -e INFLUXDB_USER=root -e INFLUXDB_PASS=root akolosov/grafana


Configure InfluxDB to save and load dashboards
---------------------------------------------------
If you want to use InfluxDB for saving dashboards, you need to pass an extra
environment variable: `INFLUXDB_IS_GRAFANADB` which defaults to false.

Here is an example:
```
docker run -d -p 80:80 \
  -e INFLUXDB_HOST=influxdb-1-tifayuki.delta.akolosov.io \
  -e INFLUXDB_PORT=8086 \
  -e INFLUXDB_NAME=testdb \
  -e INFLUXDB_USER=root \
  -e INFLUXDB_PASS=root \
  -e INFLUXDB_IS_GRAFANADB=true \
  akolosov/grafana
```
