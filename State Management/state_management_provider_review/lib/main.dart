import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => Counter(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* Provider
    final counter = Provider.of<Counter>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //* Provider dengan menggunakan Consumer (listen true)
          Consumer<Counter>(
            builder: (context, value, child) => Text(
              value.counter.toString(),
              style: TextStyle(fontSize: 35),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  //* Provider (listen : false)
                  counter.remove();
                },
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  //* Provider (listen : false)
                  counter.add();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _counter = 0;

  int get counter {
    return _counter;
  }

  void add() {
    _counter += 1;
    notifyListeners();
  }

  void remove() {
    if (_counter >= 1) {
      _counter -= 1;
    }
    notifyListeners();
  }
}
