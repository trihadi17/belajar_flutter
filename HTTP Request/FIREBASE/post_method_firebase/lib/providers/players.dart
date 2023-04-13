import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/player.dart';

import 'package:http/http.dart' as http;

class Players with ChangeNotifier {
  //* List Data
  List<Player> _allPlayer = [];

  //* Get Data
  List<Player> get allPlayer => _allPlayer;

  //* Length Data
  int get jumlahPlayer => _allPlayer.length;

  //* Select data by Id
  Player selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  //* Tambah Data (aysnchronous)
  Future<void> addPlayer(String name, String position, String image) {
    DateTime datetimeNow = DateTime.now();

    //* Https firebase
    //* copy link project database firebase "https://my-project-95b9e-default-rtdb.firebaseio.com/" + nama segment (players.json)
    //* jadnya gini https://my-project-95b9e-default-rtdb.firebaseio.com/players.json
    Uri url = Uri.parse(
        "https://my-project-95b9e-default-rtdb.firebaseio.com/players.json");

    //* Fungsi post http ke fire base
    return http
        .post(url,
            //* jIka menggunakan json encode harus berupa string semua
            body: json.encode({
              "name": name,
              "position": position,
              "imageUrl": image,
              "createdAt": datetimeNow.toString(),
            }))

        //* then itu merupakan asynchronous. akan dijalankan setelah menjalankan synchronous
        .then((response) {
      //print(json.decode(response.body)["name"]);

      //* add ke Local Storage (Device Storage)
      _allPlayer.add(
        Player(
          //! Id diambil dari Realtime database firebase
          id: json.decode(response.body)["name"].toString(),
          name: name,
          position: position,
          imageUrl: image,
          createdAt: datetimeNow,
        ),
      );

      notifyListeners();
    });
  }

  //* Edit Data
  Future<void> editPlayer(
      String id, String name, String position, String image) {
    Uri url = Uri.parse(
        "https://my-project-95b9e-default-rtdb.firebaseio.com/players/$id.json");

    //* Fungsi put http ke fire base
    //* patch -> update data
    //* put -> replace data
    return http
        .patch(url,
            body: json.encode({
              "name": name,
              "position": position,
              "imageUrl": image,
            }))
        .then((response) {
      Player selectPlayer =
          _allPlayer.firstWhere((element) => element.id == id);
      selectPlayer.name = name;
      selectPlayer.position = position;
      selectPlayer.imageUrl = image;

      notifyListeners();
    });
  }

  //* Delete
  Future<void> deletePlayer(String id) {
    Uri url = Uri.parse(
        "https://my-project-95b9e-default-rtdb.firebaseio.com/players/$id.json");

    return http.delete(url).then((response) {
      _allPlayer.removeWhere((element) => element.id == id);
      notifyListeners();
    });
  }
}
