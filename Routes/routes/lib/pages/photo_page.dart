import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  //* Menggunakan Static Route agar tidak salah
  static const nameRoute = '/photopage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routes - Photo Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Photo Page',
              style: TextStyle(fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: (() {
                      Navigator.of(context).pop();
                    }),
                    child: Text(
                      '<< Back',
                      style: TextStyle(fontSize: 25),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
