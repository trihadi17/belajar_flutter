import 'package:flutter/material.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //* Tipe data date time
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* Text
            Text(
              selectDate.toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 20,
            ),

            //* OutlinedButton
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    //* Inisialisasi tanggal
                    initialDate: selectDate,

                    //* Dimunculkan dari tahun ke berapa
                    firstDate: DateTime(2000),

                    //* Dimunculkan sampai tahun berapa
                    lastDate: DateTime(2050),

                    //* Type datepicker (default -> calender)
                    //initialEntryMode: DatePickerEntryMode.input

                    //* Mode date picker
                    // initialDatePickerMode: DatePickerMode.year

                    //* Range Date Picker (bertipe bool)
                    selectableDayPredicate: (day) {
                      //* Mengurangi tanggal dari tanggal hari ini
                      if (day.isAfter(
                              DateTime.now().subtract(Duration(days: 5))) &&

                          //* Menambahkan tanggal dari tanggal hari ini
                          (day.isBefore(
                              DateTime.now().add(Duration(days: 10))))) {
                        return true;
                      }
                      return false;
                    },

                    //* Membuat custom text datepicker
                    helpText: 'Help Text',
                    cancelText: 'Cancel Text',
                    confirmText: 'Confirm Text',
                    fieldHintText: 'Field Hint Text',
                    fieldLabelText: 'Field Label Text',

                    //* Membuat thema atau tampilan dengan builder
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark(),

                        //* karna child: nya bertipe required sedangkan child itu bertipe nullable, harus diubah dari child: child -> child: child!
                        child: child!,
                      );
                    },
                  ).then((value) {
                    //* Cek null safety karna defaultnya bertipe nullable
                    if (value != null)
                      setState(() {
                        selectDate = value;
                      });
                  });
                },
                child: Text('Date Picker')),
          ],
        ),
      ),
    );
  }
}
