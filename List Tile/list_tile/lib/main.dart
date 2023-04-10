import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Tile'),
        ),
        body: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              leading: CircleAvatar(),
              title: Text('Tri Hadi Putra'),
              subtitle: Text(
                'This is subtitle okay This is subtitle okay This is subtitle okay This is subtitle okay This is subtitle okay This is subtitle okay',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text('10.00 PM'),
              /* tileColor: Colors.amber,
              dense: true,
              // widget on click
              onTap: () {
                return;
              }, */
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(),
              title: Text('Tri Hadi Putra'),
              subtitle: Text(
                'This is subtitle okay ',
              ),
              trailing: Text('10.00 PM'),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
