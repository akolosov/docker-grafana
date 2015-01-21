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
    default_route: '/dashboard/file/default.json',
    timezoneOffset: null,
    grafana_index: "grafana-dash",
    unsaved_changes_warning: true,
    panel_names: ['text','graphite']
  });
});
