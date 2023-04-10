import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //* Generate Container menggunakan List
  final List<Container> myList = List.generate(90, (index) {
    return Container(
      height: 50,
      width: 150,
      color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256),
          Random().nextInt(256)),
    );
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Grid View')),
          body:

              //* GridView Dasar
              /* GridView(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              //*! Jumlah Grid dalam satu row */
              crossAxisCount: 3,

              //*! Ukuran/jarak antara grid atas dan grid bawah */
              mainAxisSpacing: 10,

              //*! Ukuran/jarak antara grid kanan dan kiri */
              crossAxisSpacing: 10,

              //*! ukuran grid per elemen nya */
              childAspectRatio: 4 / 3),
          children: myList,
        ), */

              //* GridView.count()
              GridView.count(
            padding: EdgeInsets.all(10),
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 4 / 3,
            children: myList,
          )),
    );
  }
}
