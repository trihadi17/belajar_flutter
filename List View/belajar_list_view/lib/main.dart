import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //! Disarankan ketika di statless menggunakan final agar tidak bisa diubah
  // Penerapan List<Widget> / List<Container> dll -> membuat widget banyak dalam satu List
  final List<Container> myListContainer = [
    Container(
      height: 300,
      width: 300,
      color: Colors.red,
    ),
    Container(
      height: 300,
      width: 300,
      color: Colors.green,
    ),
    Container(
      height: 300,
      width: 300,
      color: Colors.blue,
    ),
    Container(
      height: 300,
      width: 300,
      color: Colors.amber,
    ),
  ];

  // Widget list color -> List<Color>
  final List<Color> myListColor = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amber
  ];

  // Generate Widget Otomatis dengan menggunakan List
  final List<Widget> myListWidget = List.generate(
    100,
    (index) => Text("${index + 1}",
        style: TextStyle(fontSize: 20 + double.parse(index.toString()))),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('List View'),
            ),
            body:
                //* 1. ListView() -> membuat list baik secara horizontal dan vertical (versi 1)
                /* ListView(
              scrollDirection: Axis.horizontal,
              children: myListContainer,
            ) */

                //* 2. ListView dengan Generate Widget berkali- kali secara otomatis
                ListView(
              scrollDirection: Axis.vertical,
              children: myListWidget,
            )

            //* 3. ListView.builder() -> membuat listView secara horizontal dan vertical tanpa harus deklarasi widgetnya (misal: Container) secara berulang
            /* ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myListColor.length, // length dari list myColor
                    itemBuilder: ((context, index) {
                      // builder container secara otomatis
                      return Container(
                        height: 300,
                        width: 300,
                        color: myListColor[index],
                      );
                    })) */

            //* 4. ListView.separated() -> membuat listView secara horizontal dan vertical menggunakan spasi per elemen dalam list view */
            /*  ListView.separated(
                    separatorBuilder: (context, index) {
                      //* Cara 1 -> menggunakan widget CONTAINER */
                      return Container(
                        height: 30,
                      );

                      //* Cara 2 -> menggunakan widget Divider() yaitu membuat garis */
                      return Divider(
                        height: 20,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: myListColor.length, // length dari list myColor
                    itemBuilder: ((context, index) {
                       /* builder container secara otomatis */
                      return Container(
                        height: 300,
                        width: 300,
                        color: myListColor[index],
                      );
                    }
                    )
                    ) */

            ));
  }
}
