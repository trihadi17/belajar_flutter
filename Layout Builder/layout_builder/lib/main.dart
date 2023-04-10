import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
    //* Mendapatkan ukuran height dan width dari ukuran full app
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;

    //* Mengambil ukuran padding top dari keseluruhan app
    final paddingTop = MediaQuery.of(context).padding.top;

    //* Menjadikan appbar ke variable untuk akumulasi ukuran bodyHeight
    final appBar = AppBar(
      title: Text('Layout Builder'),
      centerTitle: true,
    );

    //* Mendapatkan bodyHeight (tinggi ukuran untuk body saja)
    final bodyHeight = heightApp - appBar.preferredSize.height - paddingTop;
    return Scaffold(
      appBar: appBar,

      //* Container() / Parent (UKURAN DARI WIDGET PARENT)
      body: Container(
        width: widthApp,
        height: bodyHeight * 0.3,
        color: Colors.grey,
        //* Row() / Child (UKURAN DARI WIDGET Child akan mengikuti ukuran dari parent)
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyContainer(widthApp),
            MyContainer(widthApp),
            MyContainer(widthApp),
          ],
        ),
      ),
    );
  }
}

//* Mengatur ukuran child berapa persen dari ukuran keseluruhan parent
class MyContainer extends StatelessWidget {
  final widthApp;

  //* Constructor dengan menggunakan this keyword
  MyContainer(this.widthApp);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Container(
          width: widthApp * 0.25,

          //* ukuran Tinggi Persen child akan menyesuaikan dari ukuran persen dari parent
          height: constraints.maxHeight * 0.5,
          color: Colors.amber,
        );
      }),
    );
  }
}
