import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
        //! leading height nya itu tidak bisa di custom, hanya bisa with dengan menggunakan leadingwidth
        leading: Container(
          color: Colors.amber,
        ),
        //! Untuk ukuran width dari leading
        leadingWidth: 100,
        //! title ini bisa diatur spacing (jarak antara leading dan actions) serta bisa mengatur height dan width nya
        title: Container(
          color: Colors.red,
          height: 100,
          width: 15000000000000,
        ),
        //! Penggunaan title spacing yaitu jarak antar element dengan tipe data double
        titleSpacing: 5.5,
        //! Actions width nya bisa diatur tapi tidak pada height dan actions ini dia List<widget> yang artinya bisa melakukan banyak widget
        actions: [
          Container(
            color: Colors.purple,
            width: 105,
          ),
          Container(
            color: Colors.yellow,
            width: 105,
          ),
        ],
        //! bottom adalah menambahkan element dibawah pada appbar, size nya dapat di custom dengan dibungkus widget prefereedsize
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Container(
            width: 50,
            height: 200,
            color: Colors.black,
          ),
        ),
        //! flexible space adalah untuk melakukan custom pada appbar (width tidak berpengruh)
        flexibleSpace: Center(
          child: Container(
            height: 200,
            color: Colors.pink,
          ),
        ),
      )),
    );
  }
}
