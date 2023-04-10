import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = 'Belum Ada Input';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Widget'),
      ),

      body: Center(
        child: Text(
          data,
          style: TextStyle(fontSize: 25),
        ),
      ),

      //* Floatin action button */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Telah di klik');

          //* Membuat dialog
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('CONFIRM'),
                  content: Text('Mari Silahkan'),
                  actions: [
                    //* Membuat Button
                    TextButton(
                        onPressed: () {
                          print('NO');

                          setState(() {
                            data = 'No';
                          });

                          //* Dialog akan hilang jika di klik
                          Navigator.of(context).pop(false);
                        },
                        child: Text('NO')),
                    TextButton(
                        onPressed: () {
                          print('YES');

                          setState(() {
                            data = 'Yes';
                          });

                          //* Dialog akan hilang jika di klik
                          Navigator.of(context).pop(true);
                        },
                        child: Text('YES'))
                  ],
                );
              }).then((value) {
            //! -> future = mengembalikan nilai Navigator.of(context).pop();
            return print(value);
          });
        },
        child: Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
