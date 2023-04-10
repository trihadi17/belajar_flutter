import 'package:flutter/material.dart';
import 'package:routes/pages/gallery_page.dart';

class MyHomePage extends StatelessWidget {
  //* Menggunakan Static Route agar tidak salah
  static const nameRoute = '/homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routes - Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //! Khusus untuk penggunaan route kita bisa menggunakan Navigator.of(context).pushName()
          //Navigator.of(context).pushNamed('/gallerypage'); -> cara 1
          Navigator.of(context).pushNamed(GalleryPage.nameRoute); // -> cara 2
        },
        child: Icon(Icons.arrow_right_alt_outlined),
      ),
    );
  }
}
