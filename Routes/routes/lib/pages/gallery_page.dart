import 'package:flutter/material.dart';
import 'package:routes/pages/photo_page.dart';

class GalleryPage extends StatelessWidget {
  //* Menggunakan Static Route agar tidak salah
  static const nameRoute = '/gallerypage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routes - Gallery Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Gallery Page',
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
                TextButton(
                    onPressed: (() {
                      //! Khusus untuk penggunaan route kita bisa menggunakan Navigator.of(context).pushName()
                      //Navigator.of(context).pushNamed('/photopage'); // -> cara1
                      Navigator.of(context)
                          .pushNamed(PhotoPage.nameRoute); // -> cara2
                    }),
                    child: Text('Next >>', style: TextStyle(fontSize: 25))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
