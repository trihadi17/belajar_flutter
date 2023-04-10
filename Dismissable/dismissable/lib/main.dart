import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hadi')),
      body: ListView.builder(
          padding: EdgeInsets.all(1),
          itemCount: 100,
          itemBuilder: (context, index) {
            //* Membuat DISMISSABLE
            return Dismissible(
              //* Jika telah di dismisssable
              onDismissed: (direction) {
                print('Direction');

                if (direction == DismissDirection.endToStart) {
                  print('END TO START');
                } else {
                  print('START TO END');
                }
              },

              //* Confirm Dismissable menggunakan Dialog
              confirmDismiss: (direction) {
                return showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: Text('Confirm'),
                        content: Text('Are you sure to delete this item'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              print('No');

                              //! Jika di tekan 'NO' maka tidak jadi di dismiss
                              Navigator.of(context).pop(false);
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                              onPressed: (() {
                                print('Yes');

                                //! Jika di tekan 'YES' maka tidak jadi di dismiss
                                Navigator.of(context).pop(true);
                              }),
                              child: Text('Yes'))
                        ],
                      );
                    }));
              },

              //* direction = cara menghapus nya bagaimana (kiri ke kanan, horizontal, vertical, dll)
              //direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 25,
                ),
                alignment: Alignment.centerRight,
              ),

              key: Key(index.toString()),
              child: ListTile(
                leading: CircleAvatar(
                  child: Center(
                    child: Text('${index + 1}'),
                  ),

                  //* Menggunakan Background image
                  /* backgroundImage: NetworkImage(
                        'https://picsum.photos/id/$index/200/300') */
                ),
                title: Text(faker.person.name()),
                subtitle: Text(faker.lorem.sentence()),
              ),
            );
          }),
    );
  }
}
