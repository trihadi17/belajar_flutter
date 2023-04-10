import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //! Untuk membuat tabbar harus menggunakan DefaultTabController

  //* List tab
  List<Tab> myListTab = [
    Tab(text: 'Tab 1'),
    Tab(
      text: 'Tab 2',
      icon: Icon(Icons.ac_unit),
    ),
    Tab(
      icon: Icon(Icons.access_alarm),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        //! InitialIndex adalah urutan default tab yang akan dibuka jika saat menjalankan aplikasi dimulai dari 0
        initialIndex: 0,

        //! Length ini berapa banyak tab nya
        length: myListTab.length,

        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('TabBar Widget'),

            //! Membuat Tabbar dengan Widget TabBar()
            bottom: TabBar(
                //* Membuat custom label yang dipilih
                labelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),

                //* Membuat custom label yang tidak dipilih
                unselectedLabelColor: Colors.white,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),

                //! Jika kita menggunakan indicator: maka indicatorCOlor, indicatorWeight, dll itu diabaikan
                indicatorColor: Colors.black,
                indicatorWeight: 5,
                indicatorPadding: EdgeInsets.all(10),

                //* Indicator
                indicator: BoxDecoration(
                    color: Colors.amber,

                    //* Border Radius
                    //borderRadius: BorderRadius.circular(7)

                    //* Penggunaan Custom Border
                    border: Border(
                        bottom: BorderSide(color: Colors.red, width: 3))),
                tabs: myListTab),
          ),

          //! Membuat View dari setiap tabbar dengan menggunakan TabView()
          body: TabBarView(children: [
            Center(
              child: Text(
                'Tab 1 ',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                'Tab 2 ',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                'Tab 3 ',
                style: TextStyle(fontSize: 20),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
