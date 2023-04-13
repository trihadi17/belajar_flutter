import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  void connectAPI(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    //* Get
    var hasilResponse = await http.get(url);

    //* Get response semua data
    // var data = json.decode(hasilResponse.body);

    //* Get hanya beberapa data
    _data = (json.decode(hasilResponse.body))['data'];

    notifyListeners();
  }
}
