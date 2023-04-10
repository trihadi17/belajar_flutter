import 'package:flutter/material.dart';
import 'package:navigation/pages/page_satu.dart';

class PageDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation - Page 2'),
        //! Menghilangkan tanda panah/back (leading) pada page kedua ke page 1
        //leading: Container(),
      ),
      body: Center(
        child: Text(
          ' INI PAGE 2',
          style: TextStyle(fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //* Menggunakan navigator push dan materialpageroute.builder()
          Navigator.of(context).pop();
        },
        child: Icon(Icons.keyboard_arrow_left),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
