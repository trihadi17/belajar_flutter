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
  //! Data switch
  bool statusSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Switch')),
      body: Center(
        child: Column(
          children: [
            Switch(
                //* Thumb -> Bulatan nya
                activeColor: Colors.amber,
                inactiveThumbColor: Colors.black,
                //activeThumbImage: Image.asset('Images/images.jpg'),
                //inactiveThumbImage: Image.asset('Images/images.jpg'),

                //*  Track -> Garis
                activeTrackColor: Colors.red,
                inactiveTrackColor: Colors.blue,
                value: statusSwitch,
                onChanged: ((value) {
                  setState(() {
                    //! merubah false menjadi true atau kebalikan nya
                    statusSwitch = !statusSwitch;
                  });

                  print(statusSwitch);
                })),

            //* Pengunaan IF ELSE
            //cara 1
            // if (statusSwitch == true) Text('Switch On') else Text('Switch Off')

            //cara 2
            Text((statusSwitch == true) ? "Switch On" : "Switch Off")
          ],
        ),
      ),
    );
  }
}
