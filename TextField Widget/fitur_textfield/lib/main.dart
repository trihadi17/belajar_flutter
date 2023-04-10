import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Fitur TextField')),
        body: Center(
          //! Widget padding
          child: Padding(
            padding: const EdgeInsets.all(20),

            //! Widget TextField
            child: TextField(
              //* Membuat Autocorrect
              autocorrect: false,

              //* membuat autofocus
              autofocus: true,

              //* Memberikan saran
              enableSuggestions: false,

              //* mmebuat semacam copy/paste
              enableInteractiveSelection: false,

              //* Membuat field enable/disabled
              //enabled: false,

              //* Membuat text menjadi character tertentu (defaultnya model password)
              //obscureText: true,
              //obscuringCharacter: '-',

              //* Mmebuat tipe input
              keyboardType: TextInputType.phone,

              //* hanya dibuat readonly
              readOnly: false,
            ),
          ),
        ),
      ),
    );
  }
}
