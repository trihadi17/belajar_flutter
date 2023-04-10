import 'dart:math';

import 'package:flutter/material.dart';

//* Package untuk mengatur tampilan portrait/landscape
//import 'package:flutter/services.dart';

void main() {
  //* cara membuat agar tampilan sebagai portrait atau landscape saja
  /*  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    //* Hanya bisa portraitUp saja */
    DeviceOrientation.portraitUp,
    //DeviceOrientation.landscapeRight
  ]); */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
    //* Mendapatkan size height dan width dari total layar (100%) dengan Media Query
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    //* Menjadikan Appbar ke dalam variable yang digunakan untuk diambil size nya nanti
    final myAppBar = AppBar(centerTitle: true, title: Text('Media Query'));

    //* Mendapatkan size padding top (padding utk sinyal baterai dll) dengan Media Query
    final myPaddingTop = MediaQuery.of(context).padding.top;

    //* Mendapatkan bodyHeight (ukuran sebenarnya dari body saja) dari akumulasi Padding top  mediaQueryHeight -  myAppbar.preferredSize.height - myPaddingTop
    final bodyHeight =
        mediaQueryHeight - myAppBar.preferredSize.height - myPaddingTop;

    //* Mengecek apabila tampilan nya landscape (true) atau (false) dengan
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: myAppBar,
      body: Center(

          //* Melakukan pengecekan apakah landscape atau tidak
          child:
              //? Jika LANDSCAPE
              (isLandscape)
                  ? Column(
                      children: [
                        Container(
                          //* Menggunakan Media Query menetapkan bahwanya disemua perangkat ukurannya 0.5 (50%) dari (100%)
                          //* Disarankan tidak menggunakan px
                          height: bodyHeight * 0.5,
                          width: mediaQueryWidth,
                          color: Colors.amber,
                        ),
                        Container(
                            //* Menggunakan Media Query menetapkan bahwanya disemua perangkat ukurannya 0.5 (50%) dari (100%)
                            //* Disarankan tidak menggunakan px
                            height: bodyHeight * 0.5,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10),
                              itemCount: 100,
                              itemBuilder: (context, index) {
                                return GridTile(
                                    child: Container(
                                  color: Color.fromARGB(
                                      255,
                                      Random().nextInt(156),
                                      Random().nextInt(156),
                                      Random().nextInt(156)),
                                ));
                              },
                            ))
                      ],
                    )

                  //? JIKA PORTRAIT
                  : Column(
                      children: [
                        Container(
                          //* Menggunakan Media Query menetapkan bahwanya disemua perangkat ukurannya 0.3 (30%) dari (100%)
                          //* Disarankan tidak menggunakan px
                          height: bodyHeight * 0.3,
                          width: mediaQueryWidth,
                          color: Colors.amber,
                        ),

                        //* List view tidak bisa digunakan langsung pada children[] harus dibungkus dengan container()
                        Container(
                          //* Menggunakan Media Query menetapkan bahwanya disemua perangkat ukurannya 0.7 (70%) dari (100%)
                          //* Disarankan tidak menggunakan px
                          height: bodyHeight * 0.7,
                          child: ListView.builder(
                              itemCount: 100,
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  leading: CircleAvatar(),
                                  title: Text('Halo Semua'),
                                );
                              })),
                        )
                      ],
                    )),
    );
  }
}
