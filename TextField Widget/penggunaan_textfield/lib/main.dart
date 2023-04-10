import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //! Controller untuk  editable text field.
  final TextEditingController myController = TextEditingController();

  //* Variabel
  String hasil = 'HASIL INPUT';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Penggunaan TextField'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  //! Digunakan untuk mengambil isi inputan user
                  controller: myController,
                  //! Ketika ada perubahan pada inputan
                  onChanged: ((value) {
                    print('ON CHANGE');

                    //! Perubahan Nilai
                    /*   setState(() {
                      hasil = value;
                    }); */
                  }),

                  //! Ketika disubmit
                  onSubmitted: ((value) {
                    print(value);

                    //! Perubahan Nilai
                    setState(() {
                      hasil = value;
                    });
                  }),

                  //! Mengambil nilai ketika selesai edit, hampir sama kayak submitted
                  onEditingComplete: () {
                    print('EDIT SUCCESS');
                    print(myController.text);
                  },
                ),
                Text(hasil)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
