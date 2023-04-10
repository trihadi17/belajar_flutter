import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flexible vs Expanded'),
      ),
      body: Row(
        children: [
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Text 1 - Perpanjang'),
          ),
          //* Menggunakan flexible -> mengatur ukuran sesuai isi pada widget atau sesuai dengan space yang tersedia dalam satu row
          //* default nya iut (fit:FlexFit.loose) -> ukuran sesuai isi didalamnya
          Flexible(
            //fit: FlexFit.loose,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.blue,
              child: Text('Text 3'),
            ),
          ),
          //* Expanded ini merupakan flexible yang defautlnya otomatis (fit:FlexFit.tight)
          Expanded(
            //* flex digunakan untuk membuat ukuran berdasarkan perbandiang dalam 1 row atau column
            flex: 1,
            child: Text('Text 2 - Sedikit'),
          ),
        ],
      ),
    );
  }
}
