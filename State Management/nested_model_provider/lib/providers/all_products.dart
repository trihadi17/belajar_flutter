import 'dart:math';
import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _allproducts = List.generate(
    25,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );

  List<Product> get allproducts {
    //* [...namaList] -> SPREAD COLLECTIONS (gabungan list/array yang kelebihan nya urutan nya bisa di atur dimana saja)
    //* Efisien digunakan dikondisi mengestrak elemen dari list yang posisi nya bisa diatur
    //* Cara 1 Get
    // return [..._allproducts];

    //* Cara 2 Get
    //* Paling efisien digunakan jika data nya urutan
    return _allproducts;
  }

  Product findById(productId) {
    return _allproducts.firstWhere((prodId) => prodId.id == productId);
  }

  // void addProduct() {
  //   _allproducts.add(value);
  //   notifyListeners();
  // }
}
