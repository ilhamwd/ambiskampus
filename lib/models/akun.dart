// AKUN DAN KELAS LANGGANAN
// KELAS LANGGANAN

import 'package:ambiskampus_flutter/helpers/core.dart';

class Akun {
  String nm_akun;
  int active;
  List<Akun> data = [];

  Akun(Map<String, dynamic> data) {
    this.nm_akun = data['nm_akun'];
    this.active = isNull(data['active']) ? 0 : int.parse(data['active']);
  }
  Akun.register(Map<String, dynamic> source) {
    List<dynamic> arr = source["akun"];

    arr.forEach((e) {
      this.data.add(Akun(e));
    });
  }
}

// AKUN
class UserData {
  String nama;
  int no_siswa;
  String suffix = "!==++!==";

  UserData() {
    // ALGORITMA UNTUK MENGAMBIL DATA
    // DARI SharedPreferences

    // MENYIMPAN DATA UNTUK DIGUNAKAN
    // DI APLIKASI
    this.nama = "Muhammad Arifin Ilham";
    this.no_siswa = 18;
  }
}
