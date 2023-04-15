import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/players.dart';

class DetailPlayer extends StatelessWidget {
  static const routeName = "/detail-player";

  @override
  Widget build(BuildContext context) {
    //* Provider
    final players = Provider.of<Players>(context, listen: false);

    //* ModalRoute (get id)
    final playerId = ModalRoute.of(context)!.settings.arguments as String;

    //* Get data berdasarkan id
    final selectPLayer = players.selectById(playerId);

    //* Text Editing
    final TextEditingController imageController =
        TextEditingController(text: selectPLayer.imageUrl);
    final TextEditingController nameController =
        TextEditingController(text: selectPLayer.name);
    final TextEditingController positionController =
        TextEditingController(text: selectPLayer.position);

    return Scaffold(
      //* meresize jika ada keyboard
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("DETAIL PLAYER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              //* Jika url gambar nya error / tidak ditemukan, akan ditambah handling errornya sebagai default
              //* menggunakan pub.dev CachedNetworkImage

              /*  ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageController.text),
                    ),
                  ),
                ),
              ), */

              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Container(
                  width: 150,
                  height: 150,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageController.text,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Container(
                      width: 50,
                      height: 50,
                      child: Image.network(
                          'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png'),
                    ),
                  ),
                ),
              ),

              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(labelText: "Nama"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Posisi"),
                textInputAction: TextInputAction.next,
                controller: positionController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Image URL"),
                textInputAction: TextInputAction.done,
                controller: imageController,
                onEditingComplete: () {
                  players
                      .editPlayer(
                    playerId,
                    nameController.text,
                    positionController.text,
                    imageController.text,
                  )
                      .then((value) {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Berhasil diubah"),
                        duration: Duration(seconds: 2),
                      ),
                    );
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
                        .editPlayer(
                      playerId,
                      nameController.text,
                      positionController.text,
                      imageController.text,
                    )
                        .then((value) {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berhasil diubah"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    });
                  },
                  child: Text(
                    "Edit",
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
