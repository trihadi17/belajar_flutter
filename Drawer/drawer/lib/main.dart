import './pages/setting_page.dart';
import './pages/page_satu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),

      //! membuat drawer (menu kesamping)
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.red,
              width: double.infinity,
              height: 150,
              alignment: Alignment.bottomLeft,
              child: Text(
                'Menu Pilihan',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                //! Navigation push utk tidak mengganti page current skrg dan tidak bisa di back
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => PageSatu())));
              },
              leading: Icon(
                Icons.home,
                size: 35,
              ),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ListTile(
              onTap: () {
                //! Navigation push utk tidak mengganti page current skrg dan tidak bisa di back
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => SettingPage())));
              },
              leading: Icon(
                Icons.settings,
                size: 35,
              ),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Somewhere Text Here!',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
