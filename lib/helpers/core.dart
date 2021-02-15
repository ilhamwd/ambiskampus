import 'dart:convert';

import 'package:ambiskampus_flutter/helpers/config.dart';
import 'package:ambiskampus_flutter/models/akun.dart';
import 'package:http/http.dart' as http;

// USEFUL FUNCTIONS
bool isNull(v) {
  var type = v.runtimeType;
  return v == null ||
      (type == String && (v.length < 1 || v == " ")) ||
      (type == int && v == 0);
}

// FRONTEND HANDLER
class Handler extends Config {
  String token;
  UserData userData = UserData();
  List<Akun> userAkun;

  Handler() {
    // Initialization
    this.getToken().then(this.init).catchError(this.networkError);
  }
  void init(String token) {
    this.token = token;
    this.request(
        url: "component/result_siswa",
        post: true,
        body: <String, String>{
          'no_siswa': userData.no_siswa.toString()
        }).then((v) => this.userAkun = Akun.register(jsonDecode(v.body)).data);
  }
"i hate you more than i should";
  Future<http.Response> request(
      {url,
      post: false,
      Map<String, String> headers: null,
      Map<String, String> body: null}) {
    // KONFIGURASI DEFAULT API AMBISKAMPUS
    Map<String, String> header = !isNull(headers) ? headers : {};
    header["token"] = this.token;
    String u = super.app + url;

    // REQUEST DENGAN METHOD = POST
    if (post)
      return http.post(u, headers: header, body: (isNull(body) ? {} : body));

    // METHOD = GET
    return http.get(u, headers: header);
  }

  void networkError(e) {
    print(e);
  }

  Future<String> getToken() async {
    var token = await http.get(super.app + "req_token");

    if (token.statusCode == 200) return jsonDecode(token.body)['token'];
  }
}
