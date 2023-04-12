import 'package:flutter/material.dart';

//* Package json convert
import 'dart:convert';

//* import package http
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  //* Map data
  Map<String, dynamic> _data = {};

  //* Get data
  Map<String, dynamic> get data => _data;

  //* jumlah data
  int get jumlahData => _data.length;

  //* membuat method connect API (asynchronous)
  void connectApi(String name, String job) async {
    //* Parse data url (get data dari url)
    Uri url = Uri.parse("https://reqres.in/api/users");

    //* hasil response (aysnchronous)
    var hasilResponse = await http.post(url, body: {"name": name, "job": job});

    //* decode hasil response to JSON
    _data = json.decode(hasilResponse.body);

    //* notifylisteners
    notifyListeners();
  }
}
