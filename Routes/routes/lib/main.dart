import 'package:flutter/material.dart';
import './pages/photo_page.dart';
import './pages/gallery_page.dart';
import './pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),

        //! Inisial Route merupakan route pertama kali dijalankan
        initialRoute: /* '/homepage' */ MyHomePage.nameRoute,
        routes: {
          //! Cara 1 Route
          // '/homepage': ((context) => MyHomePage()),
          //'/gallerypage': ((context) => GalleryPage()),
          // '/photopage': ((context) => PhotoPage()),

          //! Cara 2 Route
          MyHomePage.nameRoute: (context) => MyHomePage(),
          GalleryPage.nameRoute: (context) => GalleryPage(),
          PhotoPage.nameRoute: (context) => PhotoPage(),
        });
  }
}
