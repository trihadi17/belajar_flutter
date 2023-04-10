import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Menghilang label debug disamping kanan
      debugShowCheckedModeBanner: false,
      //Scaffold merupakan pembungkus dari tampilan
      home: Scaffold(
        // Colors -> widget color / Color(ffffff) -> custom untuk color
        //! backgroundColor: Colors.green,
        //App merupakan title App
        appBar: AppBar(
          //Text()-> merupakan widget untuk membuat text
          title: Text('My Apps'),
        ),
        //body merupakan isi dari app dan Center() -> merupakan widget untuk atur posisi menjadi tengah
        body: Center(
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            /* maxLines: 2, // -> membuat maximal 2 baris
            // membuat seperti titik (...) kayak diberita dengan TextOverflow.ellipsis
            overflow: TextOverflow.ellipsis, */
            textAlign: TextAlign.center,
            style: TextStyle(
                backgroundColor: Colors.amber,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontFamily: 'Poppins',
                decorationStyle: TextDecorationStyle.wavy,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.white,
                decorationThickness: 5),
          ),
        ),
      ),
    );
  }
}
