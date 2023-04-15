import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/players.dart';

class AddPlayer extends StatelessWidget {
  //* Route Name
  static const routeName = "/add-player";

  //* Text Editing Controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //* Provider
    final players = Provider.of<Players>(context, listen: false);

    //* Function
    final VoidCallback addPlayer = () {
      players
          .addPlayer(
        nameController.text,
        positionController.text,
        imageController.text,
      ) //* then  = asynchronous (harus menambahkan future pada providers nya)
          .then((value) {
        //* Snack Bar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Berhasil ditambahkan"),
            duration: Duration(seconds: 2),
          ),
        );

        //* Pop Layer
        Navigator.pop(context);
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Telah Terjadi Error $error"),
            content: Text('Tidak Dapat Menambahkan Player'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OKAY'))
            ],
          ),
        );
      });
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("ADD PLAYER"),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: addPlayer),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(labelText: "Nama"),

                //* TextInputAction.next = next ke textfield berikutnya
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Posisi"),

                //* TextInputAction.next = next ke textfield berikutnya
                textInputAction: TextInputAction.next,
                controller: positionController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Image URL"),

                //* TextInputAction.done = submit
                textInputAction: TextInputAction.done,
                controller: imageController,
                //* On editing complete adalah ketika textinputaction.done
                onEditingComplete: () {
                  players
                      .addPlayer(
                    nameController.text,
                    positionController.text,
                    imageController.text,
                  ) //* then  = asynchronous (harus menambahkan future pada providers nya)
                      .then((value) {
                    //* Snack Bar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Berhasil ditambahkan"),
                        duration: Duration(seconds: 2),
                      ),
                    );

                    //* Pop Layer
                    Navigator.pop(context);
                  });
                },
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    players
                        .addPlayer(
                      nameController.text,
                      positionController.text,
                      imageController.text,
                    )
                        //* then  = asynchronous (harus menambahkan future pada providers nya)
                        .then((value) {
                      //* Snack Bar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berhasil ditambahkan"),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      //* Pop Layer
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
