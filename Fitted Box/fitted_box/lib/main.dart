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
          title: Text('Fitted Box'),
        ),
        body: Center(
          child: Column(
            children: [
              //* Tanpa Fitted Box
              Container(
                height: 110,
                width: 300,
                color: Colors.blue,
                child: Text(
                  'Haloooooooooooooooooooooooooooooooo',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
              ),

              SizedBox(
                height: 50,
              ),

              //* Dengan Fitted Box
              Container(
                height: 100,
                width: 300,
                color: Colors.blue,
                child: FittedBox(
                  //alignment: Alignment.bottomRight,
                  //fit: BoxFit.cover,
                  child: Text(
                    'Haloooooooooooooooooooooooooooooooo',
                    style: TextStyle(fontSize: 34, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
