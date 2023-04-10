import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //* Brightness Aplikasi
          //brightness: Brightness.dark,

          //* Kepadatan Aplikasi
          //visualDensity: VisualDensity.adaptivePlatformDensity,
          //visualDensity: VisualDensity.comfortable,
          //visualDensity: VisualDensity.compact,
          //visualDensity: VisualDensity(horizontal: 0, vertical: 0),

          //* Warna Aplikasi
          //primarySwatch: Colors.amber,
          /* primarySwatch: MaterialColor(0xFFF5E0C3, <int, Color>{
          50: Color(0x1a5D4524),
          100: Color(0x1a5D4524),
          200: Color(0x1a5D4524),
          300: Color(0x1a5D4524),
          400: Color(0x1a5D4524),
          500: Color(0x1a5D4524),
          600: Color(0x1a5D4524),
          700: Color(0x1a5D4524),
          800: Color(0x1a5D4524),
          900: Color(0x1a5D4524),
        }), */
          //primaryColor: Color(0xFF42A5F5),
          //appBarTheme: AppBarTheme(color: Colors.green),
          //textTheme: TextTheme(bodyText2: TextStyle(color: Colors.red)),
          /*  appBarTheme: AppBarTheme(
              color: Colors.green,
              toolbarTextStyle: TextStyle(color: Colors.amber)) */
          ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is a text',
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'This is a text',
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (() {}),
                child: Text(
                  'Button',
                  style: TextStyle(fontSize: 35),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.mediation),
      ),
    );
  }
}
