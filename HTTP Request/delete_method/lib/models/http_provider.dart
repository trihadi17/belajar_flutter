import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  Uri url = Uri.parse("");

  void connectAPI(String id, BuildContext context) async {
    url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url);

    if (hasilResponse.statusCode == 200) {
      _data = (json.decode(hasilResponse.body))["data"];
      notifyListeners();

      //* Handling
      handlingStatusCode(context, "Berhasil Get Data");
    } else {
      //gagal mengambil data dari server
      handlingStatusCode(context, "ERROR ${hasilResponse.statusCode}");
    }
  }

  void deleteData() async {
    var hasilResponse = await http.delete(url);

    //* Mengambil status codenya
    print(hasilResponse.statusCode);

    if (hasilResponse.statusCode == 204) {
      _data = {};
      notifyListeners();
      print('Berhasil Dihapus');
    }
  }

  //* Function untuk snackbar (notif)
  handlingStatusCode(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    ));
  }
}
