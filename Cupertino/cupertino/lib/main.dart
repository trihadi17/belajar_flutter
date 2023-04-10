import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//* Import package io (utk megecek platform nya ios/android dll)
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuppertino'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (() {
              showDialog(
                  context: context,
                  builder: ((context) {
                    //* Jika platform nya IOS
                    return Platform.isIOS
                        ? CupertinoAlertDialog(
                            title: Text('Delete Item'),
                            content: Text('Are you sure delete this item'),
                            actions: [
                              TextButton(
                                onPressed: (() {}),
                                child: Text('No'),
                              ),
                              TextButton(
                                  onPressed: (() {}), child: Text('Yes')),
                            ],
                          )

                        //* Jika platform android
                        : AlertDialog(
                            title: Text('Delete Item'),
                            content: Text('Are you sure delete this item'),
                            actions: [
                              TextButton(
                                onPressed: (() {}),
                                child: Text('No'),
                              ),
                              TextButton(
                                  onPressed: (() {}), child: Text('Yes')),
                            ],
                          );
                  }));
            }),
            child: Text('Alert Dialog')),
      ),
    );
  }
}
