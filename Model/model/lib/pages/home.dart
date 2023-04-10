import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../models/Product.dart';

class MyHomePage extends StatelessWidget {
  //* Faker
  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    //* List generate data product
    List<Product> dummyData = List.generate(100, ((index) {
      return Product(
          "https://picsum.photos/id/${index}/200",
          faker.food.restaurant(),
          (10000 + Random().nextInt(100000)),
          faker.lorem.sentence());
    }));

    return Scaffold(
      appBar: AppBar(
        title: Text('Model Hadi'),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: dummyData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: ((context, index) {
            return GridTile(
              child: Image.network(dummyData[index].imageUrl),
              footer: Container(
                height: 80,
                alignment: Alignment.center,
                color: Colors.green.withBlue(255).withOpacity(0.6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      dummyData[index].judul,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    Text("Rp ${dummyData[index].harga}",
                        style: TextStyle(color: Colors.white)),
                    Text(
                      dummyData[index].deskripsi,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      maxLines: 2,
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
