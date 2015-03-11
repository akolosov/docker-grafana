define(['settings'],
function (Settings) {
  return new Settings({
    datasources: {
      influx: {
        default: true,
        grafanaDB: <--GRAFANADB-->,
        type: 'influxdb',
        url: "<--PROTO-->://<--ADDR-->:<--PORT-->/db/<--DB_NAME-->",
        username: "<--USER-->",
        password: "<--PASS-->",
      }
    },
    timezoneOffset: null,
    grafana_index: "grafana-dash",
    unsaved_changes_warning: true,
    playlist_timespan: "30s"
  });
});
