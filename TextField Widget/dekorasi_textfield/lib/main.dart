import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dekorasi TextField'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              //! Dekorasi Cursor
              showCursor: true,
              cursorColor: Colors.amber,
              /* cursorWidth: 10,
              cursorHeight: 25,
              cursorRadius: Radius.circular(20), */

              //! Dekorasi Text Align
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.bottom,
              textCapitalization: TextCapitalization
                  .words, // membuat character pertama huruf besar semua

              //! Style input
              style: TextStyle(fontSize: 10, color: Colors.red),

              //! Dekorasi Input
              decoration: InputDecoration(
                  //* menambahkan icon pada inputan (diluar)
                  icon: Icon(Icons.person),

                  //* membuat input ada bordernya (border biasa)
                  border: OutlineInputBorder(),

                  //* mmebuat style border jika fokus
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),

                  //* mmebuat style border jika enable / tidak fokus
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),

                  //* menambahkan icon pada inputan (didalam didepan)
                  //prefixIcon: Icon(Icons.sms_failed),
                  //prefixText: 'Hadi',

                  //* menambahkan icon pada inputan (didalam dibelakang)
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.remove_red_eye)),

                  //* membuat hint (placeholder)
                  hintText: 'Please Input Your Name',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 20),

                  //* membuat label input
                  labelText: 'Full Name',
                  labelStyle: TextStyle(color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }
}
