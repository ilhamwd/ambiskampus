class Config {
  var api, app, key;
  Config() {
    final String api = "https://api.ambiskampus.com/", app = api + "frontend/";
    this.api = api;
    this.app = app;
    this.key = "ambis_storage";
  }
}
