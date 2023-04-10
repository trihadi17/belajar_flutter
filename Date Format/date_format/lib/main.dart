import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Date Format'),
        ),
        body: Center(
          child: Text(
            //DateTime.now().toString(),
            //DateTime(2023).toString(),

            //* Penggunaan date format dengan menggunakan skeleton nya cek https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
            //DateFormat.EEEE().format(DateTime.now()),
            DateFormat.yMMMMEEEEd().add_Hms().format(DateTime.now()),
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
