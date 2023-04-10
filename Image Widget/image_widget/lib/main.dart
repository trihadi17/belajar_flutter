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
          title: Text('Image Widget'),
        ),
        body: Center(
            child: Container(
          width: 350,
          height: 500,
          color: Colors.amber,
          child: /* Image(
            fit: BoxFit.contain,
            image: AssetImage('images/images.jpg'),
          ), */
              Image.asset(fit: BoxFit.cover, 'images/images.jpg'),
        )),
      ),
    );
  }
}
